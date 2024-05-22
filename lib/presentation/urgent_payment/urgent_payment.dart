import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oll2u/core/network/api_s.dart';
import 'package:oll2u/core/network/logger.dart';
import 'package:oll2u/core/utils/flash_message.dart';
import 'package:oll2u/core/utils/get_route.dart';
import 'package:oll2u/widgets/custom_text_form_field.dart';

import '../../core/app_export.dart';
import '../../core/network/apis.dart';
import '../../core/utils/space_card.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class UrgentPayment extends ConsumerStatefulWidget {
  const UrgentPayment({Key? key, required this.orderData})
      : super(
          key: key,
        );
  final Map<String, dynamic> orderData;
  @override
  UrgentPaymentState createState() => UrgentPaymentState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UrgentPaymentState extends ConsumerState<UrgentPayment> {
  TextEditingController? accountTxtCtrl = TextEditingController();
  TextEditingController? cardExpiryCtrl = TextEditingController();
  TextEditingController? cvvCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? validateCCV(String? value) {
    if (value == null || value.isEmpty) {
      return "CCV is required";
    } else if (!RegExp(r'^[0-9]{3}$').hasMatch(value)) {
      return "Invalid CVV format. Please enter a 3-digit number.";
    }
    return null;
  }

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Card number is required";
    } else {
      // Remove spaces from the input before validation
      String cleanedValue = value.replaceAll(RegExp(r'\s'), '');
      if (!RegExp(r'^\d{16}$').hasMatch(cleanedValue)) {
        return "Invalid card number format. Please enter a valid card number.";
      }
    }

    return null;
  }

  String? validateCardExpiry(String? date) {
    if (date == null || date.isEmpty) {
      return "Card expiry is required ";
    }

    // Check if the format is DD/MM
    RegExp regExp = RegExp(r'^\d{2}/\d{2}$');
    if (!regExp.hasMatch(date)) {
      return "Invalid card expiry"; // Or return an error message
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height * 1.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [appTheme.gray1009e, Colors.white],
              ),
            ),
            child: Form(
              key: formKey,
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(height: 13.v),
                    Expanded(
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
                                    Color(0xD963681B), // First color
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          height: 65.v,
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
                                                style: theme
                                                    .textTheme.bodySmall!
                                                    .copyWith(
                                                  fontSize: 9,
                                                  color: Color(0xFFA7A7A7),
                                                ),
                                              ),
                                              CustomTextFormField(
                                                width: SizeUtils.width,
                                                fillColor: Colors.transparent,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  CardNumberFormatter()
                                                ],
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
                                                validator: (value) =>
                                                    validateCardNumber(value),
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
                                                height: 65.v,
                                                width: SizeUtils.width,
                                                padding: EdgeInsets.only(
                                                  top: 4,
                                                  left: 4,
                                                  right: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4),
                                                  ),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Color(0xFFE4E4E4),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                        color:
                                                            Color(0xFFA7A7A7),
                                                      ),
                                                    ),
                                                    CustomTextFormField(
                                                      width: SizeUtils.width,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly,
                                                        DateFormatInputFormatter()
                                                      ],
                                                      fillColor:
                                                          Colors.transparent,
                                                      contentPadding:
                                                          EdgeInsets.all(-1),
                                                      controller:
                                                          cardExpiryCtrl,
                                                      hintText: "MM/YY",
                                                      hintStyle: theme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF9E9E9E),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      validator: (value) =>
                                                          validateCardExpiry(
                                                              value),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Container(
                                                height: 65.v,
                                                width: SizeUtils.width,
                                                padding: EdgeInsets.only(
                                                  top: 4,
                                                  left: 4,
                                                  right: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4),
                                                  ),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Color(0xFFE4E4E4),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                            color: Color(
                                                                0xFFA7A7A7),
                                                          ),
                                                        ),
                                                        Text(
                                                          "HELP?",
                                                          style: theme.textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                            fontSize: 9,
                                                            color: Color(
                                                                0xFFA7A7A7),
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
                                                        color:
                                                            Color(0xFF9E9E9E),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      validator: ((value) =>
                                                          validateCCV(value)),
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
                                                MaterialStateProperty
                                                    .resolveWith(
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
                                            onTapConfirm(context);
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.only(right: 4.h),
        //   child: _buildBottomBarSection(context),
        // ),
      ),
    );
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
        NavigatorService.pushNamed(getCurrentRoute(type, BottomBarEnum.none));
      },
    );
  }

  Future<void> onPayment(int orderID) async {
    debugLog(message: "orderID.toString() ${orderID.toString()}");
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> paymentData = {
        "order_id": orderID,
        "type": "urgent"
      };
      debugLog(message: paymentData.toString());

      try {
        final request = await dio.post(APIs.payOrder, data: paymentData);
        if (request.statusCode == 200 || request.statusCode == 201) {
          showSuccess("Your payment was Successful", context);

          NavigatorService.pushNamed(
            AppRoutes.urgentDeliveryPageTwoScreen,
          );
        }
      } on Exception catch (e) {
        if (e is DioException) {
          showError("${e.response?.data ?? "Failed to payment!!"}", context);
          return;
        }
        showError("error occurred:$e", context);
      }
    }
  }

  onTapConfirm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> urgentParams = widget.orderData;

      try {
        final request = await dio.post(
          APIs.createUrgentOrder,
          data: urgentParams,
        );
        debugLog(message: "statuscode ${request.statusCode}");
        if (request.statusCode == 200 || request.statusCode == 201) {
          debugLog(
              message: "orderID.toString() ${request.data["id"].toString()}");
          onPayment(int.tryParse(request.data["id"].toString()) ?? -1);
        }
      } on Exception catch (e) {
        if (e is DioException) {
          showError("${e.response?.data ?? "Urgent order creation failed!!"}",
              context);
          return;
        }
        showError("error occurred:$e", context);
      }
    }
  }
}
