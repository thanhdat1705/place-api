import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/profile/components/profile_body.dart';
import 'package:project_places_api_mobile/screens/profile/presenter/profile_presenter.dart';
import 'package:project_places_api_mobile/screens/profile/view/profile_view.dart';
import 'package:project_places_api_mobile/screens/profile/viewmodel/profile_viewmodel.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class ProfileScreen extends StatefulWidget {
  final Account userAccount;
  ProfileScreen(this.userAccount, {Key key}) : super(key: key);

  @override
  ProfileScreenState createState() => new ProfileScreenState();
}

class ProfileScreenState extends StateView<ProfileScreen, IProfilePresenter>
    implements IProfileView {
  @override
  void initState() {
    super.initState();
    this.presenter.profileView = this;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ProfileBody(this.presenter),
    );
  }

  @override
  IProfilePresenter createPresenter() {
    return new ProfilePresenter(this.widget.userAccount);
  }

  @override
  void refreshProfile(ProfileViewModel viewModel) {
    this.presenter.profileViewModel = viewModel;
  }
}
