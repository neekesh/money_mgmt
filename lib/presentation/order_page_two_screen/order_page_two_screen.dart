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
                          padding: EdgeInsets.symmetric(vertical: 7.v),
                          decoration:
                              AppDecoration.gradientGreenToBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgFlowerDelivery,
                                height: 170.v,
                                width: 393.h,
                              ),
                              SizedBox(height: 113.v),
                              Container(
                                width: 316.h,
                                margin: EdgeInsets.symmetric(horizontal: 38.h),
                                child: Text(
                                  "msg_thank_you_for_creating".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                              SizedBox(height: 42.v),
                              CustomElevatedButton(
                                text: "msg_back_to_dashboard".tr,
                                margin: EdgeInsets.only(
                                  left: 54.h,
                                  right: 61.h,
                                ),
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
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homepage:
        return AppRoutes.profileInvoicePage;
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
      case AppRoutes.profileInvoicePage:
      // return ProfileInvoicePage();
      default:
        return DefaultWidget();
    }
  }
}
