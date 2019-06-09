import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/ui/payments_list/payments_list_vm.dart';

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
    return SafeArea(
      top: false,
      bottom: false,
      child: ListView.builder(
          itemCount: _vm.paymentsList.length,
          itemBuilder: _rowBuilder
      ),
    );
  }

  Widget _rowBuilder(BuildContext context, int index) {
    var row = _vm.paymentsList[index];
    var rowKey = ValueKey<MortGageCalcOutRow>(row);
    return ListTile(
      key: rowKey,
      title: Text(index.toString()),
      subtitle: Text(row.creditResidual.toString()),
    );
  }
}
