import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'notifier/invoices_page_one_notifier.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class InvoicesPageOneScreen extends ConsumerStatefulWidget {
  const InvoicesPageOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  InvoicesPageOneScreenState createState() => InvoicesPageOneScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class InvoicesPageOneScreenState extends ConsumerState<InvoicesPageOneScreen> {
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
                                height: 115.v,
                                width: 393.h,
                              ),
                              SizedBox(height: 24.v),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 81.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 4.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 1.v),
                                    SizedBox(
                                      width: 179.h,
                                      child: Text(
                                        "msg_invoice_from_2024_12_01".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              _buildRecentOrders(context),
                              SizedBox(height: 34.v),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 81.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 4.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary2.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 1.v),
                                    SizedBox(
                                      width: 179.h,
                                      child: Text(
                                        "msg_invoice_from_2024_12_04".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 128.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.h,
                                  vertical: 2.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary2.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Text(
                                  "lbl_request".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                              SizedBox(height: 34.v),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 81.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 4.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 1.v),
                                    SizedBox(
                                      width: 179.h,
                                      child: Text(
                                        "msg_invoice_from_2024_12_08".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 129.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.h,
                                  vertical: 2.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Text(
                                  "lbl_request".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                              )
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
  Widget _buildRecentOrders(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRecentOrders(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 128.h),
        child: Container(
          width: 130.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 2.v,
          ),
          decoration: AppDecoration.outlinePrimary1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Text(
            "lbl_request".tr,
            style: theme.textTheme.titleLarge,
          ),
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

  /// Navigates to the invoicesPageThreeScreen when the action is triggered.
  onTapRecentOrders(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.invoicesPageThreeScreen,
    );
  }
}
