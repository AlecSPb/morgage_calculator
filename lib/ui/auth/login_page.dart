import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef TryLoginCallback = Function(String login, String password);

class LoginScreen extends StatefulWidget {
  final TryLoginCallback tryLogin;

  LoginScreen({Key key, @required this.tryLogin}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _formKey = GlobalKey<FormState>();
  String _login, _password;
  FocusNode _loginFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _tryLogin() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.tryLogin(_login, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //TODO добавить картинку на экран авторизации
                        /*ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/images/logo.png')
                          ,),*/
                        Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  //style: textTheme.
                                  focusNode: _loginFocusNode,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      labelText: "логин",
                                      hintText: "введите логин"),
                                  validator: (val) {
                                    return val.trim().isEmpty
                                        ? "пожалуйста, добавте логин"
                                        : null;
                                  },
                                  onSaved: (val) => _login = val,
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context)
                                        .requestFocus(_passwordFocusNode);
                                  },
                                ),
                                TextFormField(
                                  obscureText: true,
                                  focusNode: _passwordFocusNode,
                                  onFieldSubmitted: (v) {
                                    _tryLogin();
                                  },
                                  decoration: InputDecoration(
                                      labelText: "пароль",
                                      hintText: "введите пароль"),
                                  validator: (val) {
                                    return val.trim().isEmpty
                                        ? "пароль не задан"
                                        : null;
                                  },
                                  onSaved: (val) => _password = val,
                                ),
                                RaisedButton(
                                  child: Text("войти"),
                                  //color: AppColors.accentColor,
                                  onPressed: _tryLogin,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
