import 'package:money_mgmt/core/utils/get_route.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'notifier/order_page_two_notifier.dart';
import '../../widgets/custom_elevated_button.dart';
// import '../profile_invoice_page/profile_invoice_page.dart';

class OrderPageTwoScreen extends ConsumerStatefulWidget {
  const OrderPageTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OrderPageTwoScreenState createState() => OrderPageTwoScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OrderPageTwoScreenState extends ConsumerState<OrderPageTwoScreen> {
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
                                Color(0xD94B984D), // First color
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
                                imagePath: ImageConstant.imgFlowerDelivery,
                                height: 170.v,
                                width: 393.h,
                                color: Color(0xD94B984D),
                              ),
                              SizedBox(height: 113.v),
                              Container(
                                width: 316.h,
                                margin: EdgeInsets.symmetric(horizontal: 38.h),
                                child: Text(
                                  "Thank you for creating your order".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style:
                                      theme.textTheme.headlineSmall!.copyWith(
                                    color: Colors.black,
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
        NavigatorService.pushNamed(getCurrentRoute(type, BottomBarEnum.none));
      },
    );
  }
}
