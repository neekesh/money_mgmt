import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'notifier/invoices_page_three_notifier.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class InvoicesPageThreeScreen extends ConsumerStatefulWidget {
  const InvoicesPageThreeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  InvoicesPageThreeScreenState createState() => InvoicesPageThreeScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class InvoicesPageThreeScreenState
    extends ConsumerState<InvoicesPageThreeScreen> {
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
                        SizedBox(height: 59.v),
                        Container(
                          decoration: AppDecoration
                              .gradientOnPrimaryToErrorContainer
                              .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgInvoice,
                                height: 176.v,
                                width: 393.h,
                              ),
                              SizedBox(height: 9.v),
                              Container(
                                width: 327.h,
                                margin: EdgeInsets.symmetric(horizontal: 32.h),
                                child: Text(
                                  "msg_scheduled_delivery_date".tr,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.headlineSmallOnError,
                                ),
                              ),
                              SizedBox(height: 26.v),
                              CustomElevatedButton(
                                height: 78.v,
                                width: 174.h,
                                text: "lbl_pay".tr,
                                buttonTextStyle: theme.textTheme.headlineLarge!,
                              ),
                              SizedBox(height: 26.v)
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
        return AppRoutes.urgentDeliveryPageOnePage;
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
      case AppRoutes.urgentDeliveryPageOnePage:
        return UrgentDeliveryPageOnePage();
      default:
        return DefaultWidget();
    }
  }
}
