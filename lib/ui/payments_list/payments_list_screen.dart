import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/ui/calculator/morgage_input_screen.dart';
import 'package:road_keeper_mobile/ui/calculator/mort_gage_output_vm.dart';
import 'package:road_keeper_mobile/ui/payments_list/payments_list_vm.dart';
import 'package:road_keeper_mobile/utils/format_utils.dart';

class PaymentsListPageContainer extends StatelessWidget {
  const PaymentsListPageContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PaymentsListVm>(
      distinct: true,
      converter: PaymentsListVm.fromStore,
      builder: (BuildContext context, PaymentsListVm vm) =>
          _PaymentsListPage(vm),
    );
  }
}

class _PaymentsListPage extends StatelessWidget {
  final PaymentsListVm _vm;

  const _PaymentsListPage(this._vm, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false, child: _getContentWidget());
  }

  Widget _getContentWidget() {
    return (_vm.paymentsList.length == 0)
        ? Center(child: Text("Расчет не выполнен!"))
        : ListView.separated(
            separatorBuilder: (context, index) =>
                (index > 0) ? Divider() : Container(),
            itemBuilder: _rowBuilder,
            itemCount: (_vm.paymentsList.length + 2),
          );
  }

  Widget _rowBuilder(BuildContext context, int index) {
    if (index == 0) return _getResultHeader();
    if (index == 1) return _HeaderRow();
    var rowIndex = index - 2;
    var row = _vm.paymentsList[rowIndex];
    var rowKey = ValueKey<MortGageCalcOutRow>(row);
    return GestureDetector(
        onTap: () async {
          var addPayResult = await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => _AddPaymentCorrectionDialog(row));
          if(addPayResult == null) return;
          _vm.setAddPaymentCallback(rowIndex, addPayResult);
        },
        child: CreditRowTile(key: rowKey, row: row, index: rowIndex + 1));
  }

  Widget _getResultHeader() {
    return StoreConnector<AppState, MortGageOutPutVm>(
        distinct: true,
        converter: MortGageOutPutVm.fromGraphOutput,
        builder: (context, vm) => CalculateOutputWidget(vm));
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: _getTableHeaderRow());
  }

  Widget _getTableHeaderRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(alignment: Alignment.center, height: 64, child: Text("№")),
        Container(
            alignment: Alignment.center, height: 64, child: Text("Осн. долг")),
        Container(
            alignment: Alignment.center, height: 64, child: Text("Проценты")),
        Container(
            alignment: Alignment.center, height: 64, child: Text("Остаток")),
        Container(
            alignment: Alignment.center, height: 64, child: Text("Платеж")),
      ],
    );
  }
}

class CreditRowTile extends StatelessWidget {
  final MortGageCalcOutRow row;
  final int index;
  final void Function(int, double) setAddPaymentCallback;

  const CreditRowTile(
      {Key key, this.row, this.index, this.setAddPaymentCallback})
      : assert(row != null),
        assert(index != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: _getTableRow(context),
    );
  }

  Widget _getTableRow(BuildContext ctx) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 64,
            child: Text(index.toString())),
        Container(
            alignment: Alignment.center,
            height: 64,
            child: Text(getBigDecimalString(row.mainPayment))),
        Container(
            alignment: Alignment.center,
            height: 64,
            child: Text(getBigDecimalString(row.percentPayment))),
        Container(
            alignment: Alignment.center,
            height: 64,
            child: Text(getBigDecimalString(row.creditResidual))),
        Container(
            alignment: Alignment.center,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(getBigDecimalString(row.totalPayment)),
                Text(getBigDecimalString(row.additionalPayment))
              ],
            )),
      ],
    );
  }
}

class _AddPaymentCorrectionDialog extends StatefulWidget {
  final MortGageCalcOutRow row;

  const _AddPaymentCorrectionDialog(this.row, {Key key}) : super(key: key);

  @override
  _AddPaymentCorrectionDialogState createState() =>
      _AddPaymentCorrectionDialogState();
}

class _AddPaymentCorrectionDialogState
    extends State<_AddPaymentCorrectionDialog> {
  TextEditingController _addPaymentTextController;

  @override
  void initState() {
    super.initState();
    _addPaymentTextController =
        TextEditingController(text: getBigDecimalString(widget.row.additionalPayment));
  }

  double get _addPaymentValue =>
      double.tryParse(_addPaymentTextController.text
          .replaceAll(RegExp(r"\s\b|\b\s"), "")) ??
      0.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Доп. платеж'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Обозначте дополнительную сумму",
                  labelText: "Доп. платеж"),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                NumberDigitTextFormatter()
              ],
              controller: _addPaymentTextController,
              onSubmitted: (value) {
                Navigator.of(context).pop(_addPaymentValue);
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
          child: Text("отмена".toUpperCase()),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("пересчет".toUpperCase()),
          onPressed: () {
            Navigator.of(context).pop(_addPaymentValue);
          },
        )
      ],
    );
  }
}
