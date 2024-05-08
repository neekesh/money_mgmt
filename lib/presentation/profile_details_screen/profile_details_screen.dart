import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'notifier/profile_details_notifier.dart';
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
                          CustomImageView(
                            imagePath: ImageConstant.profile,
                            height: 49.v,
                            width: 46.h,
                            radius: BorderRadius.circular(
                              23.h,
                            ),
                          ),
                          Container(
                            width: 140.h,
                            margin: EdgeInsets.only(
                              left: 13.h,
                              top: 8.v,
                              bottom: 11.v,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Manish Pandey\n".tr,
                                    style: CustomTextStyles
                                        .labelLargePrimaryContainerSemiBold_1,
                                  ),
                                  TextSpan(
                                    text: "XYZ Company".tr,
                                    style: CustomTextStyles
                                        .labelLargePrimaryContainer,
                                  )
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
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
        child: Column(
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
                  "Manish Pandey".tr,
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
                  "abcd@gmail.com".tr,
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
                  "9800965652".tr,
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
                  "XYZ".tr,
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
                  buttonTextStyle: CustomTextStyles.titleSmallOnErrorSemiBold,
                  onPressed: () {
                    onTapEdit(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileHistory(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    "Date: 2022/12/01",
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
                    "Quantity: 100L",
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
          ),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                        "Date: 2022/12/04",
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
                        "Quantity: 50L",
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
          ),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    "Date: 2022/12/08",
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
                    "Quantity: 100L",
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
          ),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                        "Date: 2022/12/11",
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
          ),
        ],
      ),
    );
  }

  Widget _invoiceHistory(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Container(
            width: 215.h,
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFD9E591),
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
                  "Date: 2022/12/01",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "100 Liters",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "1000 AUD",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Container(
            width: 215.h,
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF63681B),
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
                  "Urgent Delivery".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 21.fSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "2022/12/04",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F5323),
                  ),
                ),
                Text(
                  "50 Liters",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F5323),
                  ),
                ),
                Text(
                  "500 AUD",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F5323),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          SizedBox(height: 18.v),
          Container(
            width: 215.h,
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF63681B),
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
                  "Date: 2022/12/01",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F5323),
                  ),
                ),
                Text(
                  "100 Liters",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F5323),
                  ),
                ),
                Text(
                  "1000 AUD",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0F5323),
                  ),
                ),
              ],
            ),
          )
        ],
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
      case AppRoutes.profileInvoicePage:
      // return ProfileInvoicePage();
      default:
        return DefaultWidget();
    }
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
