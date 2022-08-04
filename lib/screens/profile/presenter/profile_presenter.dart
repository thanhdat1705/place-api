import 'package:flutter/cupertino.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/profile/view/profile_view.dart';
import 'package:project_places_api_mobile/screens/profile/viewmodel/profile_viewmodel.dart';
import 'package:project_places_api_mobile/screens/updated_profile/components/updated_profile_body.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';

/// The interface the view will use to communicate with the presenter.
abstract class IProfilePresenter extends IPresenter {
  // navigateToUpdateProfile(BuildContext context, Account accountProfile);

  ProfileViewModel get profileViewModel;

  set profileViewModel(ProfileViewModel viewModel);

  IProfileView get profileView;

  set profileView(IProfileView view);
}

class ProfilePresenter extends Presenter<IProfileView>
    implements IProfilePresenter {
  ProfileViewModel _profileViewModel;
  IProfileView _profileView;

  ProfilePresenter(Account userAccount) {
    this._profileViewModel = new ProfileViewModel(userAccount);
  }

  // @override
  // navigateToUpdateProfile(BuildContext context, Account accountProfile) {
  //   GeneralHelper.navigateToScreen(
  //       context, new UpdatedProfileBody(accountProfile), false);
  // }

  @override
  ProfileViewModel get profileViewModel {
    return this._profileViewModel;
  }

  @override
  void set profileViewModel(ProfileViewModel viewModel) {
    this._profileViewModel = viewModel;
  }

  @override
  IProfileView get profileView {
    return this._profileView;
  }

  @override
  void set profileView(IProfileView view) {
    this._profileView = view;
  }
}
