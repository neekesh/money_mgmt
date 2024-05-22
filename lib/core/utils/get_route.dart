import 'package:oll2u/routes/app_routes.dart';
import 'package:oll2u/widgets/custom_bottom_bar.dart';

String getCurrentRoute(BottomBarEnum type, BottomBarEnum currentType) {
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
