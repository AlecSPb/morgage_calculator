import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_keeper_mobile/block/motgage_calculate/mortgage_calculate_block.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_view_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';

class MortGageInputPage extends StatefulWidget {
  @override
  _MortGageInputPageState createState() => _MortGageInputPageState();
}

class _MortGageInputPageState extends State<MortGageInputPage> {
  static final _formKey = GlobalKey<FormState>();
  int _creditTerm;
  double _creditSum, _creditPercents, _planned_payment;

  FocusNode _creditSumFocusNode,
      _creditTermFocusNode,
      _creditPercentsFocusNode,
      _plannedPaymentFocusNode;

  @override
  void initState() {
    _creditPercentsFocusNode = FocusNode();
    _creditTermFocusNode = FocusNode();
    _creditSumFocusNode = FocusNode();
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
    final mortGageBlock = MortGageProvider.of(context);
    return Scaffold(
        appBar: AppBar(title: Text("MortGage calculator")),
        body: SafeArea(
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
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onSaved: (val) =>
                              _creditSum = double.tryParse(val) ?? 0.0,
                          validator: (val) => val.trim().isEmpty
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
                            onSaved: (val) =>
                                _creditTerm = int.tryParse(val) ?? 0,
                            validator: (val) => val.trim().isEmpty
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
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          onSaved: (val) =>
                              _creditPercents = double.tryParse(val) ?? 0.0,
                          validator: (val) => val.trim().isEmpty
                              ? "Обозначте процентную ставку"
                              : null,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (v) => _handleCalculate(mortGageBlock),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            icon: Icon(Icons.account_balance_wallet),
                            hintText: "Обозначте планируемую сумму платежа",
                            labelText: "Планируемый платеж",
                          ),
                          focusNode: _plannedPaymentFocusNode,
                          keyboardType: TextInputType.number,
                          onSaved: (val) =>
                          _planned_payment = double.tryParse(val) ?? 0.0,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: RaisedButton(
                            child: const Text("РАССЧИТАТЬ"),
                            onPressed: (){_handleCalculate(mortGageBlock);},
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        _getResultRow(mortGageBlock)
                      ],
                    )))));
  }

  Widget _getResultRow(MortGageCalculateBlock mortGageBlock,
      {String creditEndTerm, String totalSum, String overpayment}) {
    return StreamBuilder<MortGageViewState>(
      stream: mortGageBlock.viewState,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Срок погашения, мес.:"),
                Text(snapshot.data?.paymentsList?.length?.toString() ?? "_")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Общая сумма:"), Text(snapshot.data?.totalSum?.toString() ?? "_")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Переплата:"), Text(snapshot.data?.overPay?.toString() ?? "_")],
            ),
          ],
        );
      }
    );
  }

  void _handleCalculate(MortGageCalculateBlock block) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      block.action.add(CalculateCreditAction((b)=>
          b..creditSum = _creditSum
          ..creditTerm = _creditTerm
          ..creditPercents = _creditPercents
          ..estimatedPayment = _planned_payment
      ));
    }
  }
}
