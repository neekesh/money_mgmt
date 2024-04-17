import '../../core/app_export.dart';
import 'notifier/login_notifier.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
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
              colors: [Color(0xFFA3A8A2), Color(0XFF282828)],
            ),
          ),
          child: SizedBox(
            child: SingleChildScrollView(
              child: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.h,
                          vertical: 35.v,
                        ),
                        decoration:
                            AppDecoration.gradientBlueGrayToBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder50,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 36.h),
                                child: Text(
                                  "lbl_username".tr,
                                  style:
                                      CustomTextStyles.headlineMediumOnPrimary,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 36.h,
                                right: 34.h,
                              ),
                              child: Consumer(
                                builder: (context, ref, _) {
                                  return CustomTextFormField(
                                    controller: ref
                                        .watch(loginNotifier)
                                        .edittextController,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 27.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 36.h),
                                child: Text(
                                  "lbl_password".tr,
                                  style:
                                      CustomTextStyles.headlineMediumOnPrimary,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 36.h,
                                right: 34.h,
                              ),
                              child: Consumer(
                                builder: (context, ref, _) {
                                  return CustomTextFormField(
                                    controller: ref
                                        .watch(loginNotifier)
                                        .edittextoneController,
                                    textInputAction: TextInputAction.done,
                                    obscureText: true,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 31.v),
                            CustomElevatedButton(
                              width: 199.h,
                              text: "lbl_login".tr,
                              buttonTextStyle: theme.textTheme.headlineMedium!,
                              buttonStyle: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.green;
                                }),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                onTapLogin(context);
                              },
                            ),
                            SizedBox(height: 31.v),
                            Container(
                              decoration: AppDecoration.outlinePrimary,
                              child: Text(
                                "msg_forgot_your_password".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            SizedBox(height: 41.v)
                          ],
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgFrankEyesClosed394x393,
                      height: 394.v,
                      width: 393.h,
                      radius: BorderRadius.circular(
                        80.h,
                      ),
                      alignment: Alignment.topCenter,
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

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardPage,
    );
  }
}
