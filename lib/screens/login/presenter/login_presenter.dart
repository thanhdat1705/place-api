import 'package:flutter/cupertino.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/home/home_screen.dart';
import 'package:project_places_api_mobile/screens/login/services/login_service.dart';
import 'package:project_places_api_mobile/screens/login/view/login_view.dart';
import 'package:project_places_api_mobile/screens/login/viewmodel/login_viewmodel.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/storages/memory_storage.dart';

abstract class ILoginPresenter extends IPresenter {
  void onLogin(int provider, BuildContext context);
}

class LoginPresenter extends Presenter<ILoginView> implements ILoginPresenter {
  LoginViewModel _loginViewModel;
  ILoginView _loginView;
  LoginPresenter() {
    this._loginViewModel = new LoginViewModel(false);
  }
  @override
  void onLogin(int provider, BuildContext context) {
    this._loginViewModel.isLogin = true;
    this._loginView.refreshLoginViewModel(this._loginViewModel);

    GeneralHelper.showDialogLoading(context).show();
    onLoginToServer(provider, context).then((value) {
      if (value == true) {
        Account userAccount = MemoryStorage.get("AccountUser");
        GeneralHelper.navigateToScreen(
            context, new HomeScreen(userAccount), true);
      } else {
        //show error login
      }
    });
  }

  @override
  void set loginView(ILoginView value) {
    // TODO: implement counterView
    this._loginView = value;
    this._loginView.refreshLoginViewModel(this._loginViewModel);
  }
}
