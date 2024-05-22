import 'package:flutter/material.dart';
import 'package:oll2u/core/utils/get_route.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class UrgentDeliveryPageOneContainerScreen extends ConsumerStatefulWidget {
  const UrgentDeliveryPageOneContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  UrgentDeliveryPageOneContainerScreenState createState() =>
      UrgentDeliveryPageOneContainerScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UrgentDeliveryPageOneContainerScreenState
    extends ConsumerState<UrgentDeliveryPageOneContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [appTheme.gray1009e, appTheme.gray1009e],
            ),
          ),
          child: Navigator(
            key: navigatorKey,
            initialRoute: AppRoutes.urgentDeliveryPageOnePage,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) =>
                  getCurrentPage(context, routeSetting.name!),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.only(right: 4.h),
        //   child: _buildBottomBarSection(context),
        // ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        NavigatorService.pushNamed(getCurrentRoute(type, BottomBarEnum.none));
      },
    );
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.urgentDeliveryPageOnePage:
        return UrgentDeliveryPageOnePage();
      default:
        return DefaultWidget();
    }
  }
}
