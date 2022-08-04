import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/street_segment_detail/viewmodel/street_segment_detail_screen_viewmodel.dart';

abstract class IStreetSegmentDetailScreenView extends IView {
  void refreshStreetSegmentService(StreetSegmentDetailScreenViewModel viewModel);
}