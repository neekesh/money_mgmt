import 'package:flutter/material.dart';
import 'package:oll2u/core/utils/get_route.dart';
import 'package:oll2u/presentation/invoices_page_one_screen/notifier/invoices_page_one_notifier.dart';
import 'package:oll2u/widgets/custom_bottom_bar.dart';

import '../../core/app_export.dart';
import 'models/gridordertext_item_model.dart';
import 'notifier/dashboard_notifier.dart';
import 'widgets/gridordertext_item_widget.dart'; // ignore_for_file: must_be_immutable

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key})
      : super(
          key: key,
        );

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // StreamSubscription? _streamSubscription;

  static const routeName = "/dashbaord";

  @override
  void initState() {
    //_startFetchingNotifications();

    super.initState();
  }

  // void _startFetchingNotifications() {
  //   _streamSubscription = Stream.periodic(Duration(seconds: 10)).listen((_) =>
  //
  //
  // ref.read(invoicesPageOneNotifier.notifier).latestNotification(context));
  // }

  @override
  void dispose() {
    // _streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 146.v,
                width: 333.h,
              ),
              SizedBox(height: 120.v),
              Container(
                padding: EdgeInsets.only(left: 30.h, right: 30.h, top: 60.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xE6D8E989), Color(0xFFFFFF)],
                    stops: [0.0, 0.81], // Stop positions
                    begin: Alignment.topCenter, // Gradient start position
                    end: Alignment.bottomCenter, // Grad
                  ),
                ),
                child: _buildGridordertext(context),
              )
            ],
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
  Widget _buildGridordertext(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 123.v,
            crossAxisCount: 2,
            mainAxisSpacing: 51.h,
            crossAxisSpacing: 51.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: ref
                  .watch(dashboardNotifier)
                  .dashboardModelObj
                  ?.gridordertextItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            GridordertextItemModel model = ref
                    .watch(dashboardNotifier)
                    .dashboardModelObj
                    ?.gridordertextItemList[index] ??
                GridordertextItemModel();
            return GridordertextItemWidget(
              model,
              onTapColumnordertext: () {
                if (index == 0) {
                  onTapColumnordertext(
                    context,
                    AppRoutes.orderScreen,
                  );
                  return;
                }
                if (index == 1) {
                  onTapColumnordertext(
                    context,
                    AppRoutes.urgentDeliveryPageOneContainerScreen,
                  );
                  return;
                }
                if (index == 2) {
                  onTapColumnordertext(
                    context,
                    AppRoutes.invoicesPageOneScreen,
                  );
                  return;
                }
                if (index == 3) {
                  onTapColumnordertext(
                    context,
                    AppRoutes.maintainenceScreen,
                  );
                  return;
                }
              },
            );
          },
        );
      },
    );
  }

  /// Navigates to the maintenanceScreen when the action is triggered.
  onTapColumnordertext(BuildContext context, String path) {
    NavigatorService.pushNamed(path);
  }

  /// Navigates to the appointmentScreen when the action is triggered.
  onTapView(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.appointmentScreen,
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          if (type == BottomBarEnum.Sms) {
            ref.read(invoicesPageOneNotifier).notificationStatus!.value = {
              "id": PrefUtils().getNotificationID(),
              "status": "seen",
            };
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       backgroundColor: Color(0xE6D9D9D9),
            //       surfaceTintColor: Color(0xE6D9D9D9),
            //       title: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(
            //               top: 8.0,
            //               right: 8.0,
            //             ),
            //             child: GestureDetector(
            //               onTap: () => {
            //                 ref
            //                     .read(dashboardNotifier.notifier)
            //                     .handleNotificationState(),
            //                 Navigator.pop(context),
            //               },
            //               child: Icon(
            //                 Icons.close,
            //                 size: 25,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       titlePadding: EdgeInsets.zero,
            //       contentPadding: EdgeInsets.zero,
            //       content: Container(
            //         width: SizeUtils.width - 50,
            //         height: 300.v,
            //         child: Center(
            //           child: Text(
            //             "Your Order has been shipped, expect your delivery.",
            //             textAlign: TextAlign.center,
            //             style: theme.textTheme.headlineMedium!.copyWith(
            //               fontSize: 21,
            //               fontWeight: FontWeight.bold,
            //               color: Color(0xCC000000),
            //             ),
            //           ),
            //         ),
            //       ),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(0),
            //         ),
            //       ),
            //     );
            //   },
            // );
          }
          if (BottomBarEnum.Homepage == type) {
            return;
          }

          NavigatorService.pushNamed(
              getCurrentRoute(type, BottomBarEnum.Homepage));
        },
      );
    });
  }

  ///Handling route based on bottom click actions
}
