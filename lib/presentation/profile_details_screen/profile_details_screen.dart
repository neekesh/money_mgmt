import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_mgmt/core/utils/get_route.dart';
import 'package:money_mgmt/presentation/invoices_page_one_screen/notifier/invoices_page_one_notifier.dart';
import 'package:money_mgmt/presentation/profile_details_screen/notifier/profile_details_notifier.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
// import '../profile_invoice_page/profile_invoice_page.dart';

class ProfileDetailsScreen extends ConsumerStatefulWidget {
  const ProfileDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileDetailsScreenState createState() => ProfileDetailsScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ProfileDetailsScreenState extends ConsumerState<ProfileDetailsScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: SizeUtils.width,
              height: SizeUtils.height,
              decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 92.v),
                    Padding(
                      padding: EdgeInsets.only(left: 23.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // CustomImageView(
                          //   imagePath: ImageConstant.profile,
                          //   height: 49.v,
                          //   width: 46.h,
                          //   radius: BorderRadius.circular(
                          //     23.h,
                          //   ),
                          // ),
                          CircleAvatar(
                            radius: 19.v,
                            backgroundColor: appTheme.gray500,
                            child: Center(
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                          Container(
                            width: 140.h,
                            margin: EdgeInsets.only(
                              left: 13.h,
                              top: 8.v,
                              bottom: 11.v,
                            ),
                            child: ValueListenableBuilder<Object>(
                                valueListenable: ref
                                    .watch(profileDetailsNotifier)
                                    .userValues!,
                                builder: (context, userData, snapshot) {
                                  return RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "${ref.watch(profileDetailsNotifier).userValues!.value["username"]}\n",
                                          style: CustomTextStyles
                                              .labelLargePrimaryContainerSemiBold_1,
                                        ),
                                        TextSpan(
                                          text:
                                              "${ref.watch(profileDetailsNotifier).userValues!.value["company"]}\n"
                                                  .tr,
                                          style: CustomTextStyles
                                              .labelLargePrimaryContainer,
                                        )
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 52.v),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 39.v,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3FFF4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TabBar(indicatorColor: Colors.black, tabs: [
                              Tab(
                                icon: Text(
                                  "Details".tr,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  "History".tr,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  "Invoice".tr,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ]),
                            Expanded(
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    _profileDetails(context),
                                    _profileHistory(context),
                                    _invoiceHistory(context),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ),
      ),
    );
  }

  Widget _profileDetails(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: SizeUtils.width,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        alignment: Alignment.topLeft,
        child: FutureBuilder(
            future:
                ref.read(profileDetailsNotifier.notifier).getProfile(context),
            builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic>? userData = snapshot.data!;

                return Column(
                  children: [
                    SizedBox(height: 18.v),
                    SizedBox(height: 18.v),
                    SizedBox(height: 18.v),
                    Row(
                      children: [
                        Text(
                          "Name".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${userData["first_name"] + userData["last_name"]}"
                              .tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 18.v),
                    SizedBox(height: 18.v),
                    Row(
                      children: [
                        Text(
                          "Email".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${userData["email"]}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 18.v),
                    SizedBox(height: 18.v),
                    Row(
                      children: [
                        Text(
                          "Phone Number".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${userData["phone_number"]}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 18.v),
                    SizedBox(height: 18.v),
                    Row(
                      children: [
                        Text(
                          "Company Name".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${userData["company_name"]}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 18.v),
                    Row(
                      children: [
                        CustomElevatedButton(
                          height: 28.v,
                          width: 88.h,
                          text: "Edit".tr,
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL14,
                          buttonTextStyle:
                              CustomTextStyles.titleSmallOnErrorSemiBold,
                          onPressed: () {
                            onTapEdit(context);
                          },
                        ),
                      ],
                    ),
                  ],
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
            }),
      ),
    );
  }

  Widget _profileHistory(BuildContext context) {
    return FutureBuilder(
        future: ref.read(profileDetailsNotifier.notifier).getHistory(context),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> history = snapshot.data!;

            return ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                if (history[index]["type"] == "urgent_delivery") {
                  Map<String, dynamic> data = history[index]["data"];
                  return _buildUrgentDeliveryRow(data: data);
                }

                if (history[index]["type"] == "order") {
                  Map<String, dynamic> data = history[index]["data"];
                  return _buildScheduleRow(data: data);
                }

                if (history[index]["type"] == "maintainence") {
                  Map<String, dynamic> data = history[index]["data"];
                  return _buildRepairRow(data: data);
                }
                return SizedBox();
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
        });
  }

  Widget _buildUrgentDeliveryRow({required Map<String, dynamic> data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 36.v,
            ),
            Row(
              children: [
                Text(
                  "Urgent Delivery",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 21.fSize,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF63681B)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Date: ${data["date"]}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF63681B)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Quantity: ${data["quantity"]}L",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF63681B)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScheduleRow({required Map<String, dynamic> data}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 36.v,
        ),
        Row(
          children: [
            Text(
              "Schedule Delivery".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleLargeBold,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Date: ${data["start_date"]}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 15.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Quantity: ${data["quantity"]}L",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 15.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRepairRow({required Map<String, dynamic> data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 36.v,
            ),
            Row(
              children: [
                Text(
                  "Maintenance",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 21.fSize,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFCC7B29)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Date: ${data["date"]}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFCC7B29)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _invoiceHistory(BuildContext context) {
    return FutureBuilder(
        future:
            ref.read(invoicesPageOneNotifier.notifier).getAllInvoice(context),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = snapshot.data!;

            return data.isEmpty
                ? Text(
                    "NO DATA",
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: Colors.black),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      Map<String, dynamic>? urgentData =
                          data[index]["urgent_delivery"] ?? null;
                      Map<String, dynamic>? orderData =
                          data[index]["order"] ?? null;

                      bool isOrderData = orderData != null ? true : false;

                      String date = isOrderData
                          ? orderData["start_date"]
                          : urgentData!["date"];

                      String quanitity = isOrderData
                          ? orderData["quantity"]
                          : urgentData!["quantity"];
                      String? price = isOrderData
                          ? orderData["price"]
                          : urgentData!["price"];

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 18.v),
                          Container(
                            width: 215.h,
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: isOrderData
                                  ? Color(0xFFD9E591)
                                  : Color(0xFF63681B),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Schedule Delivery".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 21.fSize,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Date: ${date}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${quanitity} Litre",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                price != null
                                    ? Text(
                                        "${price} AUD",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                          fontSize: 15.fSize,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: data.length,
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
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        NavigatorService.pushNamed(
            getCurrentRoute(type, BottomBarEnum.Maleuser));
      },
    );
  }

  /// Navigates to the profileHistoryTabContainerScreen when the action is triggered.
  onTapTxtHistory(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileHistoryTabContainerScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapEdit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
