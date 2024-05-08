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
                  height: SizeUtils.height - 250.v,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xD9C9C55E), // First color
                        Color(0x66D9D9D9), // Second color
                      ],
                      stops: [0.0, 0.81], // Stop positions
                      begin: Alignment.topCenter, // Gradient start position
                      end: Alignment.bottomCenter, // Gradient end position
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgWrench,
                        height: 99.v,
                        width: 393.h,
                        color: Color.fromARGB(255, 168, 165, 60),
                      ),
                      SizedBox(height: 66.v),
                      SizedBox(
                        width: 206.h,
                        child: Text(
                          "Thank you for ordering".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(height: 33.v),
                      CustomElevatedButton(
                        text: "Back to Dashboard".tr,
                        margin: EdgeInsets.only(
                          left: 58.h,
                          right: 57.h,
                        ),
                        buttonTextStyle:
                            theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 21.fSize,
                          color: Colors.white,
                        ),
                        buttonStyle: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            return Color(0xFF4B984D);
                          }),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          elevation: MaterialStateProperty.all(12.0),
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                        ),
                        onPressed: () {
                          NavigatorService.pushNamedAndRemoveUntil(
                              AppRoutes.dashboardPage);
                        },
                      ),
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
        NavigatorService.pushNamed(getCurrentRoute(type));
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
        return AppRoutes.profileDetailsScreen;
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
