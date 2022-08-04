import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/updated_profile/viewmodel/updated_profile_viewmodel.dart';

abstract class IUpdatedProfileView extends IView {
  void refreshUpdateProfileScreen(UpdatedProfileViewModel viewModel);
}
