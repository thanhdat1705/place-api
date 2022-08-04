import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/store_detail/viewmodel/store_detail_screen_viewmodel.dart';

abstract class IStoreDetailScreenView extends IView {
  void refreshStoreService(StoreDetailScreenViewModel viewModel);
}