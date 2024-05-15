import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:money_mgmt/core/network/apis.dart';
import 'package:money_mgmt/core/network/logger.dart';

import '../../core/app_export.dart';
import '../../core/network/api_s.dart';
import '../../core/utils/flash_message.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';
import 'notifier/invoices_page_one_notifier.dart';

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
  void initState() {
    super.initState();
  }

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
                SizedBox(height: 59.v),
                Expanded(
                  child: Container(
                    height: SizeUtils.height - 146.v,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xD90F5323), // First color
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
                          imagePath: ImageConstant.imgInvoice,
                          height: 115.v,
                          width: 393.h,
                          color: Color.fromARGB(217, 11, 55, 24),
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: ref
                                .read(invoicesPageOneNotifier.notifier)
                                .getAllInvoice(context),
                            builder: (context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.hasData) {
                                debugLog(
                                    message:
                                        "snapshot data ${snapshot.data!.length}");
                                List<dynamic> data = snapshot.data!;

                                return data.isEmpty
                                    ? Text(
                                        "NO DATA",
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(color: Colors.black),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: data.length,
                                        itemBuilder: (context, index) {
                                          Map<String, dynamic>? urgentData =
                                              data[index]["urgent_delivery"] ??
                                                  null;
                                          Map<String, dynamic>? orderData =
                                              data[index]["order"] ?? null;

                                          bool isOrderData =
                                              orderData != null ? true : false;

                                          String date = isOrderData
                                              ? orderData["start_date"]
                                              : urgentData!["date"];

                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 81.h),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 24.h,
                                                  vertical: 4.v,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: isOrderData
                                                      ? appTheme.green600
                                                      : Color(0xFF63681B),
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: theme
                                                          .colorScheme.primary,
                                                      spreadRadius: 2.h,
                                                      blurRadius: 2.h,
                                                      offset: Offset(
                                                        6,
                                                        6,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 1.v),
                                                    SizedBox(
                                                      width: 179.h,
                                                      child: Text(
                                                        "Invoice from ${date}"
                                                            .tr,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: theme.textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              _buildRecentOrders(
                                                  context,
                                                  isOrderData,
                                                  data[index]["id"]),
                                              SizedBox(height: 34.v),
                                            ],
                                          );
                                        },
                                      );
                              }

                              return Center(
                                child: Container(
                                  height: 40.v,
                                  width: 40.v,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.orange,
                                    ),
                                    strokeWidth: 4,
                                  ),
                                ),
                              );
                            },
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
  Widget _buildRecentOrders(BuildContext context, bool isOrder, int orderID) {
    return GestureDetector(
      onTap: () {
        NavigatorService.pushNamed(
          AppRoutes.invoicesPageThreeScreen,
          arguments: {'invoiceID': orderID},
        );
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
              color: isOrder ? appTheme.green600 : Color(0xFF63681B)),
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
      case AppRoutes.urgentDeliveryPageOnePage:
        return UrgentDeliveryPageOnePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the invoicesPageThreeScreen when the action is triggered.
}
