import 'package:flutter/material.dart';
import 'package:money_mgmt/core/utils/get_route.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class NotificationSucess extends ConsumerStatefulWidget {
  const NotificationSucess({Key? key})
      : super(
          key: key,
        );

  @override
  NotificationSucessState createState() => NotificationSucessState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NotificationSucessState extends ConsumerState<NotificationSucess> {
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 146.v,
                          width: 333.h,
                        ),
                        SizedBox(height: 38.v),
                        Container(
                          height: SizeUtils.height - 146.v,
                          padding: EdgeInsets.symmetric(vertical: 7.v),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(
                                    217, 229, 247, 93), // First color
                                Color(0x66D9D9D9), // Second color
                              ],
                              stops: [0.0, 0.81], // Stop positions
                              begin: Alignment
                                  .topCenter, // Gradient start position
                              end: Alignment
                                  .bottomCenter, // Gradient end position
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Color.fromARGB(217, 11, 55, 24),
                                size: 115.v,
                              ),
                              SizedBox(height: 113.v),
                              Container(
                                width: 316.h,
                                margin: EdgeInsets.symmetric(horizontal: 38.h),
                                child: Text(
                                  "SHIPPED *".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style:
                                      theme.textTheme.headlineSmall!.copyWith(
                                    color: appTheme.green600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 42.v),
                              CustomElevatedButton(
                                text: "Back to Dashboard".tr,
                                margin: EdgeInsets.only(
                                  left: 54.h,
                                  right: 61.h,
                                ),
                                height: 46.v,
                                width: 333.h,
                                buttonTextStyle:
                                    theme.textTheme.headlineMedium!.copyWith(
                                  fontSize: 21,
                                  color: Colors.white,
                                ),
                                buttonStyle: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) {
                                      return Color(0xFF4B984D);
                                    },
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  NavigatorService.pushNamedAndRemoveUntil(
                                      AppRoutes.dashboardPage);
                                },
                              ),
                              SizedBox(height: 42.v)
                            ],
                          ),
                        )
                      ],
                    ),
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
}
