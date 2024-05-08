import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:money_mgmt/widgets/custom_text_form_field.dart';

import '../../core/app_export.dart';

import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class OrderPayment extends ConsumerStatefulWidget {
  const OrderPayment({Key? key})
      : super(
          key: key,
        );

  @override
  OrderPaymentState createState() => OrderPaymentState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OrderPaymentState extends ConsumerState<OrderPayment> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  TextEditingController? accountTxtCtrl = TextEditingController();
  TextEditingController? cardExpiryCtrl = TextEditingController();
  TextEditingController? cvvCtrl = TextEditingController();

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
                            height: SizeUtils.height - 146.v,
                            padding: EdgeInsets.all(25),
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
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "<-Back",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50.v,
                                ),
                                Container(
                                  width: SizeUtils.width,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x334B984D),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "PAYMENT CHECKOUT",
                                        style: theme.textTheme.headlineMedium!
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 26.v,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.payment,
                                            size: 18,
                                            color: Color(0xFF4C4C4C),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Pay with Card",
                                            style: theme
                                                .textTheme.headlineMedium!
                                                .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF4C4C4C),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 36.v,
                                      ),
                                      Text(
                                        "Enter your card details to pay",
                                        style: theme.textTheme.headlineMedium!
                                            .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF535353),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 26.v,
                                      ),
                                      Container(
                                        height: 50.v,
                                        width: SizeUtils.width,
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          left: 8,
                                          right: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: Color(0xFFE4E4E4),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "CARD NUMBER",
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                fontSize: 9,
                                                color: Color(0xFFA7A7A7),
                                              ),
                                            ),
                                            CustomTextFormField(
                                              width: SizeUtils.width,
                                              fillColor: Colors.transparent,
                                              contentPadding:
                                                  EdgeInsets.all(-1),
                                              controller: accountTxtCtrl,
                                              hintText: "0000 0000 0000 0000",
                                              hintStyle: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                fontSize: 14,
                                                color: Color(0xFF9E9E9E),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 26.v,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 50.v,
                                              width: SizeUtils.width,
                                              padding: EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(4),
                                                ),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFFE4E4E4),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    "CARD EXPIRY",
                                                    style: theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                      fontSize: 9,
                                                      color: Color(0xFFA7A7A7),
                                                    ),
                                                  ),
                                                  CustomTextFormField(
                                                    width: SizeUtils.width,
                                                    fillColor:
                                                        Colors.transparent,
                                                    contentPadding:
                                                        EdgeInsets.all(-1),
                                                    controller: cardExpiryCtrl,
                                                    hintText: "MM/YY",
                                                    hintStyle: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: Color(0xFF9E9E9E),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Container(
                                              height: 50.v,
                                              width: SizeUtils.width,
                                              padding: EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(4),
                                                ),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFFE4E4E4),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "CVV",
                                                        style: theme.textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                          fontSize: 9,
                                                          color:
                                                              Color(0xFFA7A7A7),
                                                        ),
                                                      ),
                                                      Text(
                                                        "HELP?",
                                                        style: theme.textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                          fontSize: 9,
                                                          color:
                                                              Color(0xFFA7A7A7),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  CustomTextFormField(
                                                    width: SizeUtils.width,
                                                    fillColor:
                                                        Colors.transparent,
                                                    contentPadding:
                                                        EdgeInsets.all(-1),
                                                    controller: cvvCtrl,
                                                    hintText: "123",
                                                    hintStyle: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: Color(0xFF9E9E9E),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 26.v,
                                      ),
                                      CustomElevatedButton(
                                        width: SizeUtils.width,
                                        height: 54.v,
                                        text: "Pay".tr,
                                        buttonTextStyle: theme
                                            .textTheme.headlineMedium!
                                            .copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        buttonStyle: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                            (states) {
                                              return Color.fromARGB(
                                                  153, 98, 227, 143);
                                            },
                                          ),
                                          side: MaterialStateProperty.all<
                                              BorderSide>(
                                            BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          NavigatorService.pushNamed(
                                              AppRoutes.orderPageTwoScreen);
                                        },
                                      ),
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

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homepage:
        return AppRoutes.urgentDeliveryPageOnePage;
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

  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        NavigatorService.pushNamed(getCurrentRoute(type));
      },
    );
  }
}
