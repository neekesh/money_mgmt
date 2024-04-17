import '../../core/app_export.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'notifier/get_started_page_notifier.dart';
import '../../widgets/custom_outlined_button.dart';

class GetStartedPageScreen extends ConsumerStatefulWidget {
  const GetStartedPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  GetStartedPageScreenState createState() => GetStartedPageScreenState();
}

class GetStartedPageScreenState extends ConsumerState<GetStartedPageScreen> {
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
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [Color(0xFFA3A8A2), Color(0XFF282828)],
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.v),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFrankEyesClosed,
                  height: 388.v,
                  width: 393.h,
                  radius: BorderRadius.circular(
                    80.h,
                  ),
                ),
                SizedBox(height: 54.v),
                Container(
                  width: 346.h,
                  margin: EdgeInsets.symmetric(horizontal: 23.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_welcome".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                        TextSpan(
                          text: "msg_a_better_sustainable".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: "msg_our_exclusive_100".tr,
                          style: theme.textTheme.labelLarge,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 44.v),
                CustomOutlinedButton(
                  height: 68.v,
                  width: 203.h,
                  text: "lbl_get_started".tr,
                  buttonTextStyle: theme.textTheme.titleLarge!,
                  buttonStyle: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      return Colors.green;
                    }),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  onPressed: () {
                    onTapGetstarted(context);
                  },
                ),
                SizedBox(height: 5.v)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the signupLoginScreen when the action is triggered.
  onTapGetstarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupLoginScreen,
    );
  }
}
