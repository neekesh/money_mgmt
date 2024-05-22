import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/signup_notifier.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
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
            height: SizeUtils.height * 1.5,
            decoration: BoxDecoration(
              color: Color.fromRGBO(226, 226, 226, 1),
            ),
            child: SizedBox(
              child: Form(
                key: ref.read(signupNotifier).formKey,
                child: Column(
                  children: [
                    SizedBox(height: 57.v),
                    Text(
                      "lbl_signup".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: 1.v),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: SizeUtils.height * 1.3,
                            padding: EdgeInsets.symmetric(
                              horizontal: 79.h,
                              vertical: 35.v,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildSignupForm(context),
                                SizedBox(height: 20.v),
                                _buildLastnameForm(context),
                                SizedBox(height: 20.v),
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
                                      contentPadding: EdgeInsets.all(8),
                                      validator: (value) => ref
                                          .read(signupNotifier.notifier)
                                          .validateCompany(value),
                                      controller:
                                          ref.watch(signupNotifier).companyCtrl,
                                    );
                                  },
                                ),
                                SizedBox(height: 20.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Address".tr,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                                Consumer(
                                  builder: (context, ref, _) {
                                    return CustomTextFormField(
                                      contentPadding: EdgeInsets.all(8),
                                      validator: (value) => ref
                                          .read(signupNotifier.notifier)
                                          .validateAddress(value),
                                      controller:
                                          ref.watch(signupNotifier).addressCtrl,
                                    );
                                  },
                                ),
                                SizedBox(height: 20.v),
                                _buildPhonenumberForm(context),
                                SizedBox(height: 20.v),
                                _buildEmailForm(context),
                                SizedBox(height: 20.v),
                                _buildPasswordForm(context),
                                SizedBox(height: 20.v),
                                CustomElevatedButton(
                                  text: "lbl_update".tr,
                                  height: 39.v,
                                  width: 118.h,
                                  buttonTextStyle: theme
                                      .textTheme.headlineMedium!
                                      .copyWith(fontSize: 15),
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
                                  ),
                                  isDisabled:
                                      ref.watch(signupNotifier).isLoading,
                                  onPressed: () {
                                    ref
                                        .read(signupNotifier.notifier)
                                        .onSignup(context);
                                  },
                                ),
                                SizedBox(height: 70.v)
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
  Widget _buildSignupForm(BuildContext context) {
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
                controller: ref.watch(signupNotifier).firstNameCtrl,
                validator: (value) =>
                    ref.read(signupNotifier.notifier).validateFirstName(value),
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildLastnameForm(BuildContext context) {
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
                validator: (value) =>
                    ref.read(signupNotifier.notifier).validateLastName(value),
                controller: ref.watch(signupNotifier).lastNameCtrl,
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPhonenumberForm(BuildContext context) {
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
                borderDecoration: null,
                contentPadding: EdgeInsets.all(8),
                textInputType: TextInputType.phone,
                controller: ref.watch(signupNotifier).phoneCtrl,
                validator: (value) =>
                    ref.read(signupNotifier.notifier).validatePhone(value),
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEmailForm(BuildContext context) {
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
              controller: ref.watch(signupNotifier).emailCtrl,
              validator: (value) =>
                  ref.read(signupNotifier.notifier).validateEmail(value),
            );
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPasswordForm(BuildContext context) {
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
                contentPadding: EdgeInsets.all(8),
                controller: ref.watch(signupNotifier).passwordCtrl,
                validator: ((value) =>
                    ref.watch(signupNotifier.notifier).validatePassword(value)),
                textInputAction: TextInputAction.done,
                obscureText: true,
              );
            },
          ),
        )
      ],
    );
  }

  onTapUpdate(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardPage,
    );
  }
}
