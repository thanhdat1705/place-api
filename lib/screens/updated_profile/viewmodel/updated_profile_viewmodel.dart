import 'package:flutter/cupertino.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/requests/update_profile_request/update_profile_request.dart';
import 'package:project_places_api_mobile/shared/services/summary_service.dart';

class UpdatedProfileViewModel {
  dynamic _avatarDisplay;
  Account _userAccount;
  UpdateProfileRequest _updateAccountRequest;

  UpdatedProfileViewModel();
  // UpdatedProfileViewModel(this._updateAccountRequest, this._avatarDisplay);

  TextEditingController _displayNameController = new TextEditingController();
  TextEditingController _userEmailController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _userDescriptionController =
      new TextEditingController();
  TextEditingController _serviceProviderController =
      new TextEditingController();

  dynamic get avatarDisplay {
    return _avatarDisplay;
  }

  set avatarDisplay(dynamic avatarDisplay) {
    this._avatarDisplay = avatarDisplay;
  }

  UpdateProfileRequest get updateAccountRequest {
    return _updateAccountRequest;
  }

  set updateAccounRequest(UpdateProfileRequest updateRequest) {
    this._updateAccountRequest = updateRequest;
  }

  TextEditingController get displayNameController {
    return _displayNameController;
  }

  set displayNameController(TextEditingController displayNameController) {
    this._displayNameController = displayNameController;
  }

  TextEditingController get userEmailController {
    return _userEmailController;
  }

  set userEmailController(TextEditingController userEmailController) {
    this._userEmailController = userEmailController;
  }

  TextEditingController get phoneNumberController {
    return _phoneNumberController;
  }

  set phoneNumberController(TextEditingController phoneNumberController) {
    this._phoneNumberController = phoneNumberController;
  }

  TextEditingController get userDescriptionController {
    return _userDescriptionController;
  }

  set userDescriptionController(
      TextEditingController userDescriptionController) {
    this._userDescriptionController = userDescriptionController;
  }

  TextEditingController get serviceProviderController {
    return _serviceProviderController;
  }

  set serviceProviderController(TextEditingController phoneNumberController) {
    this._serviceProviderController = phoneNumberController;
  }

  set userAccount(Account userAccount) {
    this._userAccount = userAccount;
  }

  Account get userAccount {
    return _userAccount;
  }

  Future<ResponseServer> getProfileOfUser(
    BuildContext context,
  ) async {
    return await getProfileUser(context);
  }

  Future<ResponseServer> onUpdateProfileUser(
      BuildContext context, UpdateProfileRequest _updateAccountRequest) async {
    return await updateProfileUser(context, _updateAccountRequest);
  }
}
