import 'package:money_mgmt/core/utils/get_route.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'notifier/urgent_delivery_page_two_notifier.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class UrgentDeliveryPageTwoScreen extends ConsumerStatefulWidget {
  const UrgentDeliveryPageTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  UrgentDeliveryPageTwoScreenState createState() =>
      UrgentDeliveryPageTwoScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UrgentDeliveryPageTwoScreenState
    extends ConsumerState<UrgentDeliveryPageTwoScreen> {
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
                        SizedBox(height: 54.v),
                        Container(
                          height: SizeUtils.height - 146.v,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xD963681B), // First color
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
                              CustomImageView(
                                imagePath: ImageConstant.imgDeliverFood,
                                height: 115.v,
                                width: 393.h,
                              ),
                              SizedBox(height: 106.v),
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
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Color(0xFF4B984D);
                                  }),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  elevation: MaterialStateProperty.all(12.0),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.grey),
                                ),
                                onPressed: () {
                                  NavigatorService.pushNamedAndRemoveUntil(
                                      AppRoutes.dashboardPage);
                                },
                              ),
                              SizedBox(height: 33.v)
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
