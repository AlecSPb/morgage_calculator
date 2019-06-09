import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:road_keeper_mobile/block/motgage_calculate/mortgage_calculate_block.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/ui/mortgage/mort_gage_vm.dart';

class MortGageInputPageContainer extends StatelessWidget {

  const MortGageInputPageContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MortGageVm>(
      distinct: true,
      converter: MortGageVm.fromStore,
      builder: (BuildContext context, MortGageVm) =>
          MortGageInputPage(MortGageVm),
    );
  }
}

class MortGageInputPage extends StatefulWidget {
  final MortGageVm viewModel;

  MortGageInputPage(this.viewModel, {Key key}) : super(key: key);

  @override
  _MortGageInputPageState createState() => _MortGageInputPageState();
}

class _MortGageInputPageState extends State<MortGageInputPage> {
  static final _formKey = GlobalKey<FormState>();
  int _creditTerm;
  double _creditSum, _creditPercents, _planned_payment;
  bool _plannedPaymentCheck = false;

  FocusNode _creditSumFocusNode,
      _creditTermFocusNode,
      _creditPercentsFocusNode,
      _plannedPaymentFocusNode;

  String _removeWhiteSpaces(String value) {
    return value.replaceAll(" ", "");
  }

  @override
  void initState() {
    _creditPercentsFocusNode = FocusNode();
    _creditTermFocusNode = FocusNode();
    _creditSumFocusNode = FocusNode();
    _plannedPaymentFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _creditSumFocusNode.dispose();
    _creditTermFocusNode.dispose();
    _creditPercentsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      onSaved: (val) => _creditSum =
                          double.tryParse(_removeWhiteSpaces(val)) ?? 0.0,
                      validator: (val) => _removeWhiteSpaces(val).isEmpty
                          ? "Обозначте сумму кредиту"
                          : null,
                      onFieldSubmitted: (v) => FocusScope.of(context)
                          .requestFocus(_creditTermFocusNode),
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
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        onSaved: (val) => _creditTerm =
                            int.tryParse(_removeWhiteSpaces(val)) ?? 0,
                        validator: (val) => _removeWhiteSpaces(val).isEmpty
                            ? "Обозначте срок кредита"
                            : null,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) => FocusScope.of(context)
                            .requestFocus(_creditPercentsFocusNode)),
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
                      onFieldSubmitted: (v) => FocusScope.of(context)
                          .requestFocus(_plannedPaymentFocusNode),
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
                              hintText:
                              "Обозначте планируемую сумму платежа",
                              labelText: "Планируемый платеж",
                            ),
                            focusNode: _plannedPaymentFocusNode,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              _NumberDigitTextFormatter()
                            ],
                            onSaved: (val) => _planned_payment =
                                double.tryParse(_removeWhiteSpaces(val)) ??
                                    0.0,
                            onFieldSubmitted: (v) => _handleCalculate(),
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
                    SizedBox(
                      height: 16,
                    ),
                    _getResultRow(
                      creditEndTerm: widget.viewModel.creditMounthCount,
                      totalSum: widget.viewModel.totalSum,
                      overpayment: widget.viewModel.overPay,
                    )
                  ],
                ))));
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
