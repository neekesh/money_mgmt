import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
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
                          height: SizeUtils.height - 146.v,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xD90F5323), // First color
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
                                imagePath: ImageConstant.imgInvoice,
                                height: 115.v,
                                width: 393.h,
                                color: Color.fromARGB(217, 11, 55, 24),
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
                                        "Invoice from 2024/12/01".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                          color: Colors.white,
                                        ),
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
                                        "Invoice from 2024/12/04".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {onTapRecentOrders(context)},
                                child: Container(
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
                                    "View".tr,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
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
                                        "Invoice from 2024/12/08".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {onTapRecentOrders(context)},
                                child: Container(
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
                                    "View".tr,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
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
            "View".tr,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
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
