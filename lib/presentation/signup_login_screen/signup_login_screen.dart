import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/signup_login_notifier.dart';
import '../../widgets/custom_elevated_button.dart';

class SignupLoginScreen extends ConsumerStatefulWidget {
  const SignupLoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupLoginScreenState createState() => SignupLoginScreenState();
}

class SignupLoginScreenState extends ConsumerState<SignupLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(226, 226, 226, 1),
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
                          horizontal: 97.h,
                          vertical: 167.v,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                            color: Color(0xFFF3FFF4)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              height: 63.v,
                              width: 199.h,
                              text: "lbl_signup".tr,
                              buttonTextStyle: theme.textTheme.headlineMedium!,
                              buttonStyle: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
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
                              onPressed: () {
                                onTapSignUp(context);
                              },
                            ),
                            SizedBox(height: 39.v),
                            Text(
                              "lbl_or".tr,
                              style: CustomTextStyles
                                  .headlineMediumPrimaryContainer,
                            ),
                            SizedBox(height: 40.v),
                            CustomElevatedButton(
                              height: 63.v,
                              width: 199.h,
                              text: "lbl_login".tr,
                              buttonTextStyle: theme.textTheme.headlineMedium!,
                              buttonStyle: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
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
                              onPressed: () {
                                onTapLogin(context);
                              },
                            )
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
      AppRoutes.loginScreen,
    );
  }

  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
