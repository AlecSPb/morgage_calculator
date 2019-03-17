import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MortGageInputPage extends StatefulWidget {
  @override
  _MortGageInputPageState createState() => _MortGageInputPageState();
}

class _MortGageInputPageState extends State<MortGageInputPage> {
  static final _formKey = GlobalKey<FormState>();
  int _creditTerm;
  double _creditSum, _creditPercents;

  FocusNode _creditSumFocusNode, _creditTermFocusNode, _creditPercentsFocusNode;

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
                            icon: Icon(Icons.attach_money),
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
                          onFieldSubmitted: (v) => _handleCalculate(),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: RaisedButton(
                            child: const Text("РАССЧИТАТЬ"),
                            onPressed: _handleCalculate,
                          ),
                        )
                      ],
                    )))));
  }

  void _handleCalculate() {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("CALCULATE: $_creditSum, $_creditTerm, $_creditPercents");
    }
  }
}
