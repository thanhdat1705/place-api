import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/profile/profile_screen.dart';
import 'package:project_places_api_mobile/screens/updated_profile/view/updated_profile_view.dart';
import 'package:project_places_api_mobile/screens/updated_profile/viewmodel/updated_profile_viewmodel.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/requests/update_profile_request/update_profile_request.dart';

abstract class IUpdatedProfilePresenter extends IPresenter {
  onUploadImg(File imageFile);
  onUpdateProfile(UpdateProfileRequest data, BuildContext context);
  Account getAccountUser();

  UpdatedProfileViewModel get updatedProfileViewModel;
  set updatedProfileViewModel(UpdatedProfileViewModel viewModel);
  IUpdatedProfileView get updatedProfileView;
  set updatedProfileView(IUpdatedProfileView value);
}

class UpdatedProfilePresenter extends Presenter<IUpdatedProfileView>
    implements IUpdatedProfilePresenter {
  UpdatedProfileViewModel _updateProfileViewModel;
  IUpdatedProfileView _updateProfileView;

  UpdatedProfilePresenter(BuildContext context) {
    this._updateProfileViewModel = new UpdatedProfileViewModel();
    this.getProfileUser(context);
  }

  getProfileUser(BuildContext context) async {
    ResponseServer res =
        await this._updateProfileViewModel.getProfileOfUser(context);
    this._updateProfileViewModel.userAccount = res.data;
    this
        ._updateProfileView
        .refreshUpdateProfileScreen(this._updateProfileViewModel);
  }

  IUpdatedProfileView get updateProfileView {
    return this._updateProfileView;
  }

  @override
  void onUpdateProfile(UpdateProfileRequest request, BuildContext context) {
    GeneralHelper.showDialogLoading(context).show();
    this._updateProfileViewModel.onUpdateProfileUser(context, request).then(
      (res) {
        GeneralHelper.showDialogLoading(context).hide();
        GeneralHelper.navigateToScreen(
            context, new ProfileScreen(res.data), true);
      },
    );
  }

  @override
  set updatedProfileViewModel(UpdatedProfileViewModel viewModel) {
    this._updateProfileViewModel = viewModel;
  }

  @override
  UpdatedProfileViewModel get updatedProfileViewModel {
    return this._updateProfileViewModel;
  }

  @override
  IUpdatedProfileView get updatedProfileView {
    return this._updateProfileView;
  }

  @override
  set updatedProfileView(IUpdatedProfileView value) {
    this._updateProfileView = value;
    this
        ._updateProfileView
        .refreshUpdateProfileScreen(this._updateProfileViewModel);
  }

  @override
  Account getAccountUser() {
    return this._updateProfileViewModel.userAccount;
  }

  @override
  onUploadImg(File imageFile) {
    this._updateProfileViewModel.avatarDisplay = new FileImage(imageFile);

    this
        ._updateProfileView
        .refreshUpdateProfileScreen(this._updateProfileViewModel);
    @override
    onUploadImg(File chosenImage, Size size) {
      return new Container(
        width: size.width / 3,
        height: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: FileImage(chosenImage),
          ),
        ),
      );
    }
  }
}
