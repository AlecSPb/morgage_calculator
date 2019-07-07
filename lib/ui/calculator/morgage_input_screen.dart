import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/state/mort_gate_input_view_state.dart';
import 'package:road_keeper_mobile/ui/calculator/mort_gage_input_vm.dart';
import 'package:road_keeper_mobile/utils/errors.dart';
import 'package:road_keeper_mobile/utils/event.dart';

import '../../constants.dart';
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
            StoreConnector<AppState, Event<Exception>>(
              distinct: true,
              converter: (store) => store.state.domainEventException,
              builder: (context, errorEvent) {
                var error = errorEvent?.dataIfNotHandled;
                if (error is SnackBarShowException) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(error.message)));
                  });
                }
                return Container(
                  width: 0.0,
                  height: 0.0,
                );
              },
            ),
            StoreConnector<AppState, MortGageInputVm>(
              distinct: true,
              converter: MortGageInputVm.fromStore,
              builder: (context, vm) => _MortGageInputWidget(vm),
            ),
            SizedBox(
              height: 16,
            ),
            StoreConnector<AppState, MortGageOutPutVm>(
                distinct: true,
                converter: MortGageOutPutVm.fromCalculatorOutput,
                builder: (context, vm) => CalculateOutputWidget(vm))
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
  MortGageType _mortGageType;
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
    _mortGageType = viewState.mortGageType;
    _plannedPaymentCheck = viewState.plannedPaymentCheck;
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
              height: 16.0,
            ),
            getMortGageTypeSelector(),
            SizedBox(
              height: 16.0,
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
                NumberDigitTextFormatter()
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
                      NumberDigitTextFormatter()
                    ],
                    onSaved: (val) => _planned_payment =
                        double.tryParse(_removeWhiteSpaces(val)) ?? 0.0,
                    validator: (val) {
                      if (!_plannedPaymentCheck) {
                        return null;
                      } else {
                        return _removeWhiteSpaces(val).isEmpty
                            ? "Обозначте планируемый платеж"
                            : null;
                      }
                    },
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

  Widget getMortGageTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Тип кредита: "),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: MortGageType.annuity,
                  groupValue: _mortGageType,
                  onChanged: (value) {
                    setState(() {
                      _mortGageType = value;
                    });
                  },
                ),
                Text(
                  "Аннуитетный"
                )
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: MortGageType.differentiated,
                  groupValue: _mortGageType,
                  onChanged: (value) {
                    setState(() {
                      _mortGageType = value;
                    });
                  },
                ),
                Text(
                  "Дифференцированный"
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _saveInputState() {
    var inputState = MortGageInputViewState((b) => b
      ..plannedPaymentCheck = _plannedPaymentCheck
      ..plannedPayment = _plannedPaymentTextController.text
      ..creditTerm = _creditTermTextController.text
      ..creditSum = _creditSumTextController.text
      ..mortGageType = _mortGageType
      ..creditRate = _creditPercentsTextController.text);
    widget.viewModel.storeAction(SaveInputDataAction(inputState));
  }

  void _handleCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final plannedPayment = _plannedPaymentCheck ? _planned_payment : null;
      widget.viewModel.storeAction(CalculateCreditAction((b) => b
        ..mortGageType = _mortGageType
        ..creditSum = _creditSum
        ..creditTerm = _creditTerm
        ..creditPercents = _creditPercents
        ..estimatedPayment = plannedPayment));
    }
  }
}

class CalculateOutputWidget extends StatelessWidget {
  final MortGageOutPutVm viewModel;

  CalculateOutputWidget(this.viewModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getResultRow(
      context,
      creditEndTerm: viewModel.creditMounthCount,
      totalSum: viewModel.totalSumString,
      overpayment: viewModel.overPayString,
    );
  }

  Widget _getResultRow(BuildContext context,
      {String creditEndTerm, String totalSum, String overpayment}) {
    var textTheme = Theme.of(context).textTheme;
    var titleTextStyle = textTheme.body1.copyWith(
        fontFamily: 'Comfortaa',
        color: CustomThemeColors.primaryColor,
        fontWeight: FontWeight.bold);
    var secondaryTextStyle = textTheme.body1.copyWith(
        fontFamily: 'Comfortaa',
        color: CustomThemeColors.secondaryColor,
        fontWeight: FontWeight.bold);

    List<Widget> widgets = [
      Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Срок погашения:",
                  textAlign: TextAlign.center, style: titleTextStyle),
              Text(creditEndTerm ?? "_", style: secondaryTextStyle)
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Общая сумма:", style: titleTextStyle),
              Text(totalSum ?? "_", style: secondaryTextStyle)
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Переплата:", style: titleTextStyle),
              Text(overpayment ?? "_", style: secondaryTextStyle)
            ],
          ),
        ],
      ),
    ];
    var paymentWidget = _getPaymentWidget(titleTextStyle, secondaryTextStyle);
    if (paymentWidget != null) {
      widgets.add(SizedBox(height: 16.0));
      widgets.add(paymentWidget);
      widgets.add(SizedBox(height: 16.0));
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: CustomThemeColors.cardBackgroundColor.withOpacity(0.4),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: widgets,
      ),
    );
  }

  Widget _getPaymentWidget(TextStyle titleStyle, TextStyle secondaryStyle) {
    var calculatedCreditPaymentString = viewModel.regularCreditPayment;
    if (calculatedCreditPaymentString == null) return null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Eжемесячный взнос:",
          style: titleStyle,
        ),
        Text(calculatedCreditPaymentString, style: secondaryStyle),
      ],
    );
  }
}

///Format incoming numeric text to fit the format of 1 000 000
class NumberDigitTextFormatter extends TextInputFormatter {
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
