import 'package:dio/dio.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../core/network/api_s.dart';
import '../../core/network/apis.dart';
import '../../core/utils/flash_message.dart';
import 'notifier/edit_profile_notifier.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen(
      {required this.firstname,
      required this.lastname,
      required this.companyName,
      required this.phoneNumber,
      required this.email,
      required this.address,
      Key? key})
      : super(
          key: key,
        );
  final String firstname;
  final String lastname;
  final String companyName;
  final String phoneNumber;
  final String email;
  final String address;

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController firstNameCtrl = TextEditingController();

  TextEditingController lastNameCtrl = TextEditingController();

  TextEditingController companyCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController addresCtrl = TextEditingController();

  @override
  void initState() {
    firstNameCtrl.text = widget.firstname;
    lastNameCtrl.text = widget.lastname;
    companyCtrl.text = widget.companyName;
    phoneCtrl.text = widget.phoneNumber;
    emailCtrl.text = widget.email;
    addresCtrl.text = widget.email;

    super.initState();
  }

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
              colors: [appTheme.gray1009e, appTheme.gray1009e],
            ),
          ),
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: 53.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Text(
                            "Edit Profile".tr,
                            style: theme.textTheme.headlineLarge,
                          ),
                          SizedBox(height: 5.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 79.h,
                              vertical: 35.v,
                            ),
                            decoration: AppDecoration.gradientBlueGrayToBlueGray
                                .copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder50,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildEditProfileFirstName(context),
                                SizedBox(height: 35.v),
                                _buildEditProfileLastName(context),
                                SizedBox(height: 37.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "lbl_company_name".tr,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                                Consumer(
                                  builder: (context, ref, _) {
                                    return CustomTextFormField(
                                      controller: companyCtrl,
                                      contentPadding: EdgeInsets.all(8),
                                    );
                                  },
                                ),
                                SizedBox(height: 34.v),
                                _buildEditProfilePhoneNumber(context),
                                SizedBox(height: 34.v),
                                _buildEditProfileEmail(context),
                                SizedBox(height: 34.v),
                                _buildEditProfilePassword(context),
                                SizedBox(height: 40.v),
                                CustomElevatedButton(
                                  height: 39.v,
                                  width: 120.h,
                                  text: "Update".tr,
                                  buttonStyle: CustomButtonStyles.fillGreen,
                                  buttonTextStyle:
                                      CustomTextStyles.titleSmallOnError,
                                  onPressed: () {
                                    onUpdate(context);
                                  },
                                ),
                                SizedBox(height: 40.v)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditProfileFirstName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_first_name".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                contentPadding: EdgeInsets.all(8),
                controller: firstNameCtrl,
                validator: (value) => validateFirstName(value),
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfileLastName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_last_name".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                contentPadding: EdgeInsets.all(8),
                controller: lastNameCtrl,
                validator: (value) => validateLastName(value),
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfilePhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_phone_number".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                contentPadding: EdgeInsets.all(8),
                controller: phoneCtrl,
                validator: (value) => validatePhone(value),
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfileEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_email".tr,
          style: theme.textTheme.titleLarge,
        ),
        Consumer(
          builder: (context, ref, _) {
            return CustomTextFormField(
              contentPadding: EdgeInsets.all(8),
              controller: emailCtrl,
              validator: (value) => validateEmail(value),
            );
          },
        )
      ],
    );
  }

  Widget _buildEditProfileAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address".tr,
          style: theme.textTheme.titleLarge,
        ),
        Consumer(
          builder: (context, ref, _) {
            return CustomTextFormField(
              contentPadding: EdgeInsets.all(8),
              controller: addresCtrl,
              validator: (value) => validateAddress(value),
            );
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfilePassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_password".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                controller: passwordCtrl,
                textInputAction: TextInputAction.done,
                obscureText: true,
                validator: (value) => validatePassword(value),
                contentPadding: EdgeInsets.all(8),
              );
            },
          ),
        )
      ],
    );
  }

  /// Navigates to the profileDetailsScreen when the action is triggered.
  onTapUpdate(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileDetailsScreen,
    );
  }

  validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    return null;
  }

  validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    return null;
  }

  validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    return null;
  }

  validateCompany(String? value) {
    if (value == null || value.isEmpty) {
      return "Company name is  required";
    }
    return null;
  }

  validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Address is  required";
    }
    return null;
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

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be greater or equal to 6 characters";
    }
    return null;
  }

  Future<void> onUpdate(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      Map<String, dynamic> user = {
        "first_name": firstNameCtrl.text,
        "last_name": lastNameCtrl.text,
        "phone_number": phoneCtrl.text,
        "company_name": companyCtrl.text,
        "email": emailCtrl.text,
        "password": passwordCtrl.text.isEmpty ?? null,
        "address": addresCtrl.text
      };
      try {
        final request = await dio.put(APIs.editUser, data: user);
        if (request.statusCode == 200 || request.statusCode == 201) {
          showSuccess("Profile Updated successful!!", context);

          NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashboardPage);
        }
      } on Exception catch (e) {
        if (e is DioException) {
          if (e.response!.statusCode == 400) {
            showError("${e.response?.data ?? "something went wrong"}", context);
            return;
          }
          showError("${e.response?.data ?? "$e"}", context);
        }
        showError("error occurred:$e", context);
      }
    }
  }
}
