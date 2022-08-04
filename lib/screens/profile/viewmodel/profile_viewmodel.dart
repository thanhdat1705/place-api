import 'package:project_places_api_mobile/shared/models/account/account.dart';

class ProfileViewModel {
  Account _userAccount;
  ProfileViewModel(this._userAccount);

  Account get userAccount {
    return this._userAccount;
  }

  set userAccount(Account userAccount) {
    this._userAccount = userAccount;
  }
}
