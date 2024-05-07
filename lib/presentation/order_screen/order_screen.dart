import 'package:flutter/widgets.dart';

import '../../core/app_export.dart';
import 'notifier/order_notifier.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OrderScreenState createState() => OrderScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OrderScreenState extends ConsumerState<OrderScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [appTheme.gray1009e, Colors.white],
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
                        SizedBox(height: 34.v),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
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
                                  height: 84.v,
                                  width: 393.h,
                                  color: Color.fromARGB(255, 3, 56, 5),
                                ),
                                SizedBox(height: 22.v),
                                _buildRowemail(context),
                                SizedBox(height: 26.v),
                                _buildRowquantity(context),
                                SizedBox(height: 26.v),
                                _buildRowstartdate(context),
                                SizedBox(height: 26.v),
                                _buildRowEnddate(
                                  context,
                                ),
                                SizedBox(height: 26.v),
                                _buildCreateAnOrderSection(context),
                                SizedBox(height: 60.v)
                              ],
                            ),
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
          child: _buildBottomBarSection(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 116.h,
          contentPadding: EdgeInsets.all(8),
          controller: ref.watch(orderNotifier).emailSectionController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 177.h,
          contentPadding: EdgeInsets.all(8),
          controller: ref.watch(orderNotifier).phoneNumberSectionController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowemail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email".tr,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.v),
              _buildEmailSection(context)
            ],
          ),
          Column(
            children: [
              Text(
                "Phone Number".tr,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.v),
              _buildPhoneNumberSection(context)
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDurationSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          contentPadding: EdgeInsets.all(8),
          controller: ref.watch(orderNotifier).durationSectionController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowquantity(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quantity".tr,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                ),
                CustomTextFormField(
                  width: 141.h,
                  contentPadding: EdgeInsets.all(8),
                  controller: ref.watch(orderNotifier).quantityController,
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Address".tr,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.v),
              _buildDurationSection(context)
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 169.h,
          controller: ref.watch(orderNotifier).dateController,
          contentPadding: EdgeInsets.all(8),
          prefix: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 10.v,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 17.adaptSize,
              width: 17.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 39.v,
          ),
          suffix: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 10.v,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 17.adaptSize,
              width: 17.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 39.v,
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildIntervalsSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          controller: ref.watch(orderNotifier).intervalsSectionController,
          textInputAction: TextInputAction.done,
          contentPadding: EdgeInsets.all(8),
          hintText: "In Weeks",
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowstartdate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "Start Date".tr,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 1.v),
              _buildDate(context)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Intervals".tr,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 1.v),
                _buildIntervalsSection(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowEnddate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "End Date".tr,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 1.v),
              _buildDate(context)
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAnOrderSection(BuildContext context) {
    return CustomElevatedButton(
      width: 220.h,
      text: "Create an order",
      buttonTextStyle: theme.textTheme.headlineSmall!.copyWith(
        fontSize: 21,
        color: Colors.white,
      ),
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return Color(0xFF4B984D);
        }),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Colors.transparent,
          ),
        ),
        elevation: MaterialStateProperty.all(12.0),
        shadowColor: MaterialStateProperty.all(Colors.grey),
      ),
      onPressed: () => {
        {NavigatorService.pushNamed(AppRoutes.orderPayment)},
      },
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
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
