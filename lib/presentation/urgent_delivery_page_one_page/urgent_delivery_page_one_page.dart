import 'package:date_field/date_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_mgmt/core/network/apis.dart';
import 'package:money_mgmt/core/network/logger.dart';
import 'package:money_mgmt/core/utils/flash_message.dart';

import '../../core/app_export.dart';
import '../../core/network/api_s.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class UrgentDeliveryPageOnePage extends ConsumerStatefulWidget {
  const UrgentDeliveryPageOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  UrgentDeliveryPageOnePageState createState() =>
      UrgentDeliveryPageOnePageState();
}

class UrgentDeliveryPageOnePageState
    extends ConsumerState<UrgentDeliveryPageOnePage> {
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  TextEditingController? addressCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  DateTime initialDate = DateTime.now();

  void onDateChange(DateTime? date) {
    if (date != null) {
      setState(() {
        initialDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [appTheme.gray1009e, appTheme.gray1009e],
              ),
            ),
            child: Form(
              key: formKey,
              child: Container(
                decoration: AppDecoration.gradientGrayEToGrayE,
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
                          SizedBox(height: 54.v),
                          Container(
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
                            padding: EdgeInsets.symmetric(horizontal: 30.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgDeliverFood,
                                  height: 115.v,
                                  width: 393.h,
                                  color: Color(0xFF63681B),
                                ),
                                SizedBox(height: 5.v),
                                _buildRowemail(context),
                                SizedBox(height: 27.v),
                                _buildQuantitySection(context),
                                SizedBox(height: 27.v),
                                _buildPhoneSection(context),
                                SizedBox(height: 27.v),
                                Text(
                                  "Pick a Date".tr,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 1.v),
                                _buildDate(context),
                                SizedBox(height: 26.v),
                                CustomElevatedButton(
                                  width: 150.h,
                                  height: 46.h,
                                  text: "Confirm".tr,
                                  onPressed: () {
                                    onTapConfirm(context);
                                  },
                                  buttonTextStyle:
                                      theme.textTheme.headlineSmall!.copyWith(
                                    fontSize: 21.fSize,
                                    color: Colors.white,
                                  ),
                                  buttonStyle: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      return Color(0xFF4B984D);
                                    }),
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(12.0),
                                    shadowColor:
                                        MaterialStateProperty.all(Colors.grey),
                                  ),
                                ),
                                SizedBox(height: 26.v)
                              ],
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
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneSection(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phone Number".tr,
            style: theme.textTheme.titleMedium!.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1.v),
          Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                textInputType: TextInputType.phone,
                width: 141.h,
                contentPadding: EdgeInsets.all(6),
                controller: phoneNumberCtrl,
                validator: (value) => validatePhone(value),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySection(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quantity".tr,
            style: theme.textTheme.titleMedium!.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1.v),
          Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                textInputType: TextInputType.number,
                width: 141.h,
                contentPadding: EdgeInsets.all(6),
                controller: qtyCtrl,
                validator: (value) => validateQuantity(value),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Navigates to the urgentDeliveryPageTwoScreen when the action is triggered.
  onTapConfirm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> urgentParams = {
        "email": emailCtrl.text,
        "phone_number": phoneNumberCtrl.text,
        "address": addressCtrl!.text,
        "date": DateFormat('yyyy-MM-dd').format(initialDate),
        "quantity": qtyCtrl.text
      };
      debugLog(message: urgentParams.toString());
      try {
        final request = await dio.post(
          APIs.createUrgentOrder,
          data: urgentParams,
        );
        if (request.statusCode == 200 || request.statusCode == 201) {
          showSuccess(
              "Urgent delivery Placed Successfully!! Please proceed payment",
              context);
        }
        NavigatorService.pushNamed(
          AppRoutes.urgentPayment,
          arguments: {'orderID': request.data["id"]},
        );
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

  /// Section Widget
  Widget _buildRowemail(BuildContext context) {
    return Row(
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
            _buildEmailSection(context)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Address".tr,
              style: theme.textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            _buildAddressSection(context)
          ],
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 116.h,
          contentPadding: EdgeInsets.all(6),
          controller: emailCtrl,
          validator: (value) => validateEmail(value),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAddressSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          contentPadding: EdgeInsets.all(6),
          controller: addressCtrl,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Container(
          width: 141.h,
          height: 40.v,
          child: DateTimeField(
            mode: DateTimeFieldPickerMode.date,
            dateFormat: DateFormat('yyyy-MM-dd'),
            firstDate: DateTime.now(),
            value: initialDate,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 20.v, left: 6),
              fillColor: appTheme.gray500,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (DateTime? value) {
              onDateChange(value);
            },
          ),
        );
      },
    );
  }

  validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return "Invalid email address";
    }
    return null;
  }

  validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Address is  required";
    }
    return null;
  }

  validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    return null;
  }

  validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return "Quantity is required";
    }
    if (int.tryParse(value)! < 1) {
      return "Invalid quantity";
    }
    return null;
  }
}
