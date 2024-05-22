import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oll2u/core/utils/get_route.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../dashboard_page/dashboard_page.dart';
import 'notifier/maintainence_notifier.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MaintenanceScreenState createState() => MaintenanceScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MaintenanceScreenState extends ConsumerState<MaintenanceScreen> {
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
    ref.read(maintenanceNotifier.notifier).setInitialValue();
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
          scrollDirection: Axis.vertical,
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height * 1.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [appTheme.gray1009e, appTheme.gray1009e],
              ),
            ),
            child: SizedBox(
              child: Form(
                key: ref.read(maintenanceNotifier).formKey,
                child: Column(
                  children: [
                    SizedBox(height: 13.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: 146.v,
                      width: 333.h,
                    ),
                    SizedBox(height: 100.v),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xD9C9C55E), // First color
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgWrench,
                            height: 71.v,
                            width: 393.h,
                            color: Color.fromARGB(255, 168, 165, 60),
                          ),
                          SizedBox(height: 8.v),
                          _buildRowEmail(context),
                          SizedBox(height: 27.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Phone Number".tr,
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.v),
                                  _buildPhoneNumberEditText(context),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address".tr,
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  SizedBox(height: 1.v),
                                  _buildAddressEditText(context)
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 27.v),
                          Text(
                            "Pick a Date".tr,
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 1.v),
                          _buildDate(context),
                          SizedBox(height: 29.v),
                          _buildQuantityColumn(context),
                          SizedBox(height: 26.v),
                          _buildConfirmButton(context),
                          SizedBox(height: 26.v)
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
        //   child: _buildBottomBar(context),
        // ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: SizeUtils.width - 70.v,
          contentPadding: EdgeInsets.all(6),
          controller: ref.watch(maintenanceNotifier).emailEditTextController,
          validator: (value) =>
              ref.read(maintenanceNotifier.notifier).validateEmail(value),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          contentPadding: EdgeInsets.all(6),
          controller: ref.watch(maintenanceNotifier).addressEditTextController,
          validator: (value) =>
              ref.read(maintenanceNotifier.notifier).validateAddress(value),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowEmail(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email".tr,
                style:
                    theme.textTheme.titleMedium!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 1.v),
              _buildEmailEditText(context)
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 151.h,
          textInputType: TextInputType.phone,
          controller:
              ref.watch(maintenanceNotifier).phoneNumberEditTextController,
          contentPadding: EdgeInsets.all(6),
          textInputAction: TextInputAction.done,
          validator: (value) =>
              ref.read(maintenanceNotifier.notifier).validatePhone(value),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildQuantityColumn(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Message".tr,
            style: theme.textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
          CustomTextFormField(
            width: 282.h,
            maxLines: 3,
            contentPadding: EdgeInsets.all(6),
            validator: (value) =>
                ref.watch(maintenanceNotifier.notifier).validateMessage(value),
            controller: ref.watch(maintenanceNotifier).messageTextController,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmButton(BuildContext context) {
    return CustomElevatedButton(
      width: 150.h,
      height: 46.h,
      text: "Confirm".tr,
      onPressed: () {
        ref.read(maintenanceNotifier.notifier).createMaintenance(context);
      },
      buttonTextStyle: theme.textTheme.headlineSmall!.copyWith(
        fontSize: 21.fSize,
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
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        NavigatorService.pushNamed(getCurrentRoute(type, BottomBarEnum.none));
      },
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
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
            ref.watch(maintenanceNotifier.notifier).setDate(value);
          },
        ),
      );
    });
  }
}
