import 'package:money_mgmt/core/utils/get_route.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../dashboard_page/dashboard_page.dart';
import 'notifier/appointment_one_notifier.dart';
import '../../widgets/custom_elevated_button.dart';

class AppointmentOneScreen extends ConsumerStatefulWidget {
  const AppointmentOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppointmentOneScreenState createState() => AppointmentOneScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppointmentOneScreenState extends ConsumerState<AppointmentOneScreen> {
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
                  decoration: AppDecoration.gradientYellowToBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgInvoice,
                        height: 69.v,
                        width: 393.h,
                      ),
                      SizedBox(height: 96.v),
                      SizedBox(
                        width: 198.h,
                        child: Text(
                          "msg_thank_you_for_booking".tr,
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
