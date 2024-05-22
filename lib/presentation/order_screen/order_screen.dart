import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oll2u/core/network/logger.dart';
import 'package:oll2u/core/utils/get_route.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'notifier/order_notifier.dart';

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
  final List<Map<String, dynamic>> frequency = [
    {
      "label": "WEEKLY",
      "value": "weekly",
    },
    {
      "label": "FORTNIGHT",
      "value": "fortnight",
    }
  ];

  DateTime initialDate = DateTime.now();

  void onDateChange(DateTime? date) {
    if (date != null) {
      setState(() {
        initialDate = date;
      });
    }
  }

  @override
  void initState() {
    ref.read(orderNotifier.notifier).setInitialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height + 600,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [appTheme.gray1009e, Colors.white],
              ),
            ),
            child: Form(
              key: ref.read(orderNotifier).formKey,
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
                                      imagePath:
                                          ImageConstant.imgFlowerDelivery,
                                      height: 84.v,
                                      width: 393.h,
                                      color: Color.fromARGB(255, 3, 56, 5),
                                    ),
                                    SizedBox(height: 22.v),
                                    _firstFields(context),
                                    SizedBox(height: 26.v),
                                    _buildQuanityField(context),
                                    SizedBox(height: 26.v),
                                    _secondFields(context),
                                    SizedBox(height: 26.v),
                                    _thirdFields(context),
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
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.only(right: 4.h),
        //   child: _buildBottomBarSection(context),
        // ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: SizeUtils.width - 70.v,
          contentPadding: EdgeInsets.all(8),
          controller: ref.watch(orderNotifier).emailSectionController,
          validator: (value) =>
              ref.read(orderNotifier.notifier).validateEmail(value),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          contentPadding: EdgeInsets.all(8),
          controller: ref.watch(orderNotifier).phoneNumberSectionController,
          validator: (value) =>
              ref.read(orderNotifier.notifier).validatePhone(value),
          textInputType: TextInputType.number,
        );
      },
    );
  }

  /// Section Widget
  Widget _firstFields(BuildContext context) {
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
        ],
      ),
    );
  }

  Widget _secondFields(BuildContext context) {
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
                  textInputType: TextInputType.number,
                  width: 141.h,
                  contentPadding: EdgeInsets.all(8),
                  controller: ref.watch(orderNotifier).quantityController,
                  hintText: "In Litre",
                  hintStyle: theme.textTheme.titleMedium!
                      .copyWith(color: Color.fromARGB(255, 91, 88, 88)),
                  validator: (value) =>
                      ref.read(orderNotifier.notifier).validateQuantity(value),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Duration".tr,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                ),
                CustomTextFormField(
                  textInputType: TextInputType.number,
                  width: 141.h,
                  contentPadding: EdgeInsets.all(8),
                  controller: ref.watch(orderNotifier).durationCtrl,
                  validator: (value) =>
                      ref.read(orderNotifier.notifier).validateDuration(value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildQuanityField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address".tr,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 1.v),
              CustomTextFormField(
                width: 141.h,
                contentPadding: EdgeInsets.all(8),
                controller: ref.watch(orderNotifier).addressCtrl,
                validator: (value) =>
                    ref.read(orderNotifier.notifier).validateAddress(value),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Phone Number".tr,
                textAlign: TextAlign.start,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              _buildPhoneNumberSection(context)
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _thirdFields(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Consumer(builder: (context, ref, _) {
                return Container(
                  width: 141.h,
                  child: DateTimeField(
                    mode: DateTimeFieldPickerMode.date,
                    dateFormat: DateFormat('yyyy-MM-dd'),
                    firstDate: DateTime.now(),
                    value: initialDate,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                        ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(6),
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
                      ref.watch(orderNotifier.notifier).setStartDate(value);
                    },
                  ),
                );
              })
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
                Container(
                  width: 141.h,
                  child: DropdownButtonFormField(
                      value: frequency.first['value'],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(6),
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
                      items: frequency.map((item) {
                        return DropdownMenuItem<String>(
                          value: item['value'],
                          child: Text(
                            item['label'],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        );
                      }).toList(),
                      onChanged: ((selectedValue) {
                        ref
                            .watch(orderNotifier.notifier)
                            .setFrequency(selectedValue.toString());
                      })),
                )
              ],
            ),
          )
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
        ref.read(orderNotifier.notifier).createOrder(context),
      },
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        NavigatorService.pushNamed(getCurrentRoute(type, BottomBarEnum.none));
      },
    );
  }

  ///Handling page based on route
}
