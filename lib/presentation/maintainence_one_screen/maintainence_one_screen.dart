import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../dashboard_page/dashboard_page.dart';
import './notifier/maintenance_one_notifier.dart';
import '../../widgets/custom_elevated_button.dart';

class MaintenanceOneScreen extends ConsumerStatefulWidget {
  const MaintenanceOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MaintenanceOneScreenState createState() => MaintenanceOneScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MaintenanceOneScreenState extends ConsumerState<MaintenanceOneScreen> {
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
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: 13.v),
                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 146.v,
                  width: 333.h,
                ),
                SizedBox(height: 44.v),
                Container(
                  decoration: AppDecoration.gradientLimeToBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgWrench,
                        height: 99.v,
                        width: 393.h,
                      ),
                      SizedBox(height: 66.v),
                      SizedBox(
                        width: 206.h,
                        child: Text(
                          "msg_thank_you_for_ordering".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(height: 33.v),
                      CustomElevatedButton(
                        text: "msg_back_to_dashboard".tr,
                        margin: EdgeInsets.only(
                          left: 58.h,
                          right: 57.h,
                        ),
                        onPressed: () {
                          onTapBackto(context);
                        },
                      ),
                      SizedBox(height: 33.v)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homepage:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Sms:
        return "/";
      case BottomBarEnum.Maleuser:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the dashboardPage when the action is triggered.
  onTapBackto(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardPage,
    );
  }
}
