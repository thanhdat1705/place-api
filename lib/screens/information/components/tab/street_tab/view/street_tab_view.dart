import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/street_tab/view%20model/street_tab_viewmodel.dart';

abstract class IStreetTabView extends IView {
  void refreshStreetTabService(StreetTabViewModel viewModel);
}