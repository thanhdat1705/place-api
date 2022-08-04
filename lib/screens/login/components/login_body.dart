import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/login/presenter/login_presenter.dart';
import 'package:project_places_api_mobile/screens/login/view/login_view.dart';
import 'package:project_places_api_mobile/screens/login/viewmodel/login_viewmodel.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/shared_variables/contants.dart';
import 'package:project_places_api_mobile/screens/login/components/login_background.dart';
import 'package:project_places_api_mobile/shared/shared_components/already_have_an_account_check.dart';
import 'package:project_places_api_mobile/shared/shared_variables/shared_variables.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:project_places_api_mobile/widgets/widgets.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends StateView<LoginBody, ILoginPresenter>
    implements ILoginView {
  LoginViewModel _loginViewModel;
  LoginPresenter _loginPresenter;
  @override
  void initState() {
    super.initState();
    this._loginPresenter = createPresenter();
    this._loginPresenter.loginView = this;
  }

  @override
  ILoginPresenter createPresenter() {
    // TODO: implement createPresenter
    return new LoginPresenter();
  }

  @override
  void refreshLoginViewModel(LoginViewModel viewModel) {
    // TODO: implement refreshLoginViewModel
    setState(() {
      this._loginViewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(childs: <Widget>[
      Text(
        "LOGIN",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: kPrimaryColor),
      ),
      SizedBox(height: size.height * 0.06),
      Image.network(BACKGROUNDLOGINURL),
      SizedBox(height: size.height * 0.07),
      FacebookSignInButton(
          onPressed: () {
            // call authentication logic
            this._loginPresenter.onLogin(0, context);
          },
          borderRadius: 10,
          text: 'Login with Facebook',
          centered: true),
      SizedBox(height: size.height * 0.03),
      GoogleSignInButton(
        onPressed: () {
          // call authentication logic
          this._loginPresenter.onLogin(1, context);
        },
        darkMode: false,
        text: 'Login with Google   ',
        borderRadius: 10,
        centered: true, // default: false
      ),
      SizedBox(height: size.height * 0.05),
      // AlreadyHaveAnAccountCheck(),
    ]);
  }
}
