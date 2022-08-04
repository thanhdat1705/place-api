import 'package:mvp_core/mvp_core.dart';
import 'package:project_places_api_mobile/screens/information/components/tab/brand_store_tab/view%20model/brand_store_tab_viewmodel.dart';

abstract class IBrandStoreTabView extends IView {
  void refreshBrandStoreTabService(BrandStoreTabViewModel viewModel);
}