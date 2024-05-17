import 'package:money_mgmt/routes/app_routes.dart';
import 'package:money_mgmt/widgets/custom_bottom_bar.dart';

String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Homepage:
      return AppRoutes.dashboardPage;
    case BottomBarEnum.Sms:
      return AppRoutes.notificationScreen;
    case BottomBarEnum.Maleuser:
      return AppRoutes.profileDetailsScreen;
    default:
      return "/";
  }
}
