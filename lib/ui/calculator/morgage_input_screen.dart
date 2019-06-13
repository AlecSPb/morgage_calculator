import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gate_input_view_state.dart';
import 'package:road_keeper_mobile/ui/calculator/mort_gage_input_vm.dart';

import 'mort_gage_output_vm.dart';

class MortGageInputPage extends StatelessWidget {
  const MortGageInputPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            StoreConnector<AppState, MortGageInputVm>(
              distinct: true,
              converter: MortGageInputVm.fromStore,
              builder: (context, vm) => _MortGageInputWidget(vm),
            ),
            SizedBox(height: 16,),
            StoreConnector<AppState, MortGageOutPutVm>(
                distinct: true,
                converter: MortGageOutPutVm.fromStore,
                builder: (context, vm) => _CalculateOutputWidget(vm))
          ])),
    );
  }
}

class _MortGageInputWidget extends StatefulWidget {
  final MortGageInputVm viewModel;

  _MortGageInputWidget(this.viewModel, {Key key}) : super(key: key);

  @override
  _MortGageInputWidgetState createState() => _MortGageInputWidgetState();
}

class _MortGageInputWidgetState extends State<_MortGageInputWidget> {
  static final _formKey = GlobalKey<FormState>();
  int _creditTerm;
  double _creditSum, _creditPercents, _planned_payment;
  bool _plannedPaymentCheck = false;

  FocusNode _creditSumFocusNode,
      _creditTermFocusNode,
      _creditPercentsFocusNode,
      _plannedPaymentFocusNode;

  TextEditingController _creditSumTextController,
      _creditTermTextController,
      _creditPercentsTextController,
      _plannedPaymentTextController;

  String _removeWhiteSpaces(String value) {
    return value.replaceAll(" ", "");
  }

  @override
  void initState() {
    var viewState = widget.viewModel.mortGageInputViewState;
    _creditPercentsFocusNode = FocusNode();
    _creditTermFocusNode = FocusNode();
    _creditSumFocusNode = FocusNode();
    _plannedPaymentFocusNode = FocusNode();

    _creditSumTextController = TextEditingController(text: viewState.creditSum);
    _creditTermTextController =
        TextEditingController(text: viewState.creditTerm);
    _creditPercentsTextController =
        TextEditingController(text: viewState.creditRate);
    _plannedPaymentTextController =
        TextEditingController(text: viewState.plannedPayment);
    super.initState();
  }

  @override
  void dispose() {
    _creditSumFocusNode.dispose();
    _creditTermFocusNode.dispose();
    _creditPercentsFocusNode.dispose();
    _saveInputState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.attach_money),
                hintText: "Обозначте сумму кредита",
                labelText: "Сумма кредита",
              ),
              focusNode: _creditSumFocusNode,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                _NumberDigitTextFormatter()
              ],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onSaved: (val) =>
                  _creditSum = double.tryParse(_removeWhiteSpaces(val)) ?? 0.0,
              validator: (val) => _removeWhiteSpaces(val).isEmpty
                  ? "Обозначте сумму кредиту"
                  : null,
              onFieldSubmitted: (v) =>
                  FocusScope.of(context).requestFocus(_creditTermFocusNode),
              controller: _creditSumTextController,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.timer),
                hintText: "Обозначте срок кредита",
                labelText: "Срок кредита, мес",
              ),
              focusNode: _creditTermFocusNode,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              onSaved: (val) =>
                  _creditTerm = int.tryParse(_removeWhiteSpaces(val)) ?? 0,
              validator: (val) => _removeWhiteSpaces(val).isEmpty
                  ? "Обозначте срок кредита"
                  : null,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (v) =>
                  FocusScope.of(context).requestFocus(_creditPercentsFocusNode),
              controller: _creditTermTextController,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.all_inclusive),
                hintText: "Обозначте кредитную ставку",
                labelText: "Кредитная ставка",
              ),
              focusNode: _creditPercentsFocusNode,
              inputFormatters: [_OneDotNumberTextFormatter()],
              onSaved: (val) => _creditPercents =
                  double.tryParse(_removeWhiteSpaces(val)) ?? 0.0,
              validator: (val) => _removeWhiteSpaces(val).isEmpty
                  ? "Обозначте процентную ставку"
                  : null,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (v) =>
                  FocusScope.of(context).requestFocus(_plannedPaymentFocusNode),
              controller: _creditPercentsTextController,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.account_balance_wallet),
                      hintText: "Обозначте планируемую сумму платежа",
                      labelText: "Планируемый платеж",
                    ),
                    focusNode: _plannedPaymentFocusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      _NumberDigitTextFormatter()
                    ],
                    onSaved: (val) => _planned_payment =
                        double.tryParse(_removeWhiteSpaces(val)) ?? 0.0,
                    onFieldSubmitted: (v) => _handleCalculate(),
                    controller: _plannedPaymentTextController,
                  ),
                ),
                Switch(
                  value: _plannedPaymentCheck,
                  onChanged: (bool value) {
                    setState(() {
                      _plannedPaymentCheck = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: RaisedButton(
                child: const Text("РАССЧИТАТЬ"),
                onPressed: () {
                  _handleCalculate();
                },
              ),
            ),
          ],
        ));
  }

  void _saveInputState() {
    var inputState = MortGageInputViewState((b) => b
      ..plannedPayment = _plannedPaymentTextController.text
      ..creditTerm = _creditTermTextController.text
      ..creditSum = _creditSumTextController.text
      ..mortGageType = MortGageType.differentiated
      ..creditRate = _creditPercentsTextController.text);
    widget.viewModel.storeAction(SaveInputDataAction(inputState));
  }

  void _handleCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.viewModel.storeAction(CalculateCreditAction((b) => b
        ..creditSum = _creditSum
        ..creditTerm = _creditTerm
        ..creditPercents = _creditPercents
        ..estimatedPayment = _planned_payment));
    }
  }
}

class _CalculateOutputWidget extends StatelessWidget {
  final MortGageOutPutVm viewModel;

  _CalculateOutputWidget(this.viewModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getResultRow(
      creditEndTerm: viewModel.creditMounthCount,
      totalSum: viewModel.totalSum,
      overpayment: viewModel.overPay,
    );
  }

  Widget _getResultRow(
      {String creditEndTerm, String totalSum, String overpayment}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Срок погашения:",
              textAlign: TextAlign.center,
            ),
            Text(creditEndTerm ?? "_")
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Общая сумма:"), Text(totalSum ?? "_")],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Переплата:"), Text(overpayment ?? "_")],
        ),
      ],
    );
  }
}

///Format incoming numeric text to fit the format of 1 000 000
class _NumberDigitTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    if (newTextLength <= 3) return newValue;

    final newTextBuffer = StringBuffer();
    for (var index = (newTextLength - 1); index >= 0; index--) {
      var revertedIndex = newTextLength - index;
      newTextBuffer.write(newValue.text[index]);
      if (revertedIndex % 3 == 0 && index != 0) {
        newTextBuffer.write(" ");
        selectionIndex++;
      }
    }
    final newText = newTextBuffer.toString().split('').reversed.join();

    return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex));
  }
}

class _OneDotNumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    final newTextBuffer = StringBuffer();

    int dotCounter = 0;
    for (var index = 0; index < newTextLength; index++) {
      var currChar = newValue.text[index];
      if (currChar == "." || currChar == ",") {
        ++dotCounter;
        if (dotCounter == 1 && index != 0) {
          newTextBuffer.write(".");
        } else
          --selectionIndex;
        continue;
      }
      newTextBuffer.write(currChar);
    }
    return TextEditingValue(
        text: newTextBuffer.toString(),
        selection: TextSelection.collapsed(offset: selectionIndex));
  }
}
