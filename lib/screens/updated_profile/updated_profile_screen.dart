import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/updated_profile/components/updated_profile_body.dart';
import 'package:project_places_api_mobile/screens/updated_profile/presenter/updated_profile_presenter.dart';
import 'package:project_places_api_mobile/screens/updated_profile/view/updated_profile_view.dart';
import 'package:project_places_api_mobile/screens/updated_profile/viewmodel/updated_profile_viewmodel.dart';
import 'package:project_places_api_mobile/shared/size/size_config.dart';

class UpdatedProfileScreen extends StatefulWidget {
  UpdatedProfileScreen({Key key}) : super(key: key);

  @override
  UpdatedProfileScreenState createState() => new UpdatedProfileScreenState();
}

class UpdatedProfileScreenState
    extends StateView<UpdatedProfileScreen, IUpdatedProfilePresenter>
    implements IUpdatedProfileView {
  @override
  void initState() {
    super.initState();
    this.presenter.updatedProfileView = this;
  }

  @override
  IUpdatedProfilePresenter createPresenter() {
    return new UpdatedProfilePresenter(context);
  }

  @override
  void refreshUpdateProfileScreen(UpdatedProfileViewModel viewModel) {
    setState(
      () {
        this.presenter.updatedProfileViewModel = viewModel;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (this.presenter.getAccountUser() == null) {
      return new Scaffold(
        body: Center(
          child: SizedBox(
            height: getProportionateScreenHeight(90),
            width: getProportionateScreenHeight(90),
            child: new CircularProgressIndicator(
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation(Colors.purpleAccent),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(body: new UpdatedProfileBody(this.presenter));
    }
  }
}
