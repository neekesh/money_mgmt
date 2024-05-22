import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:oll2u/core/app_export.dart';
import 'package:oll2u/core/network/logger.dart';
import 'package:oll2u/presentation/dashboard_page/dashboard_page.dart';
import 'package:oll2u/presentation/notification_screen/notification_list.dart';
import 'package:oll2u/presentation/profile_details_screen/profile_details_screen.dart';

import '../../widgets/custom_bottom_bar.dart';

class EntryPage extends ConsumerStatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  EntryPageState createState() => EntryPageState();
}

class EntryPageState extends ConsumerState<EntryPage> {
  final databaseRef = FirebaseDatabase.instance.ref().child("notifications");
  bool isValidEmail = false;
  bool showNotificationIcon = false;
  ValueNotifier<bool> showBadge = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    checkNotification();

    // Schedule the post-frame callback
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Now it's safe to start listening to data changes

    //   // Call other initialization functions
    //   checkNotification();
    // });
  }

  checkNotification() {
    // databaseRef.child("email").onValue.listen((event) {
    //   isValidEmail = event.snapshot.value.toString() == PrefUtils().getEmail();
    // });
    databaseRef.child("show").onValue.listen((event) {
      showBadge.value = event.snapshot.value as bool;
      debugLog(message: "notification ${showBadge.value}");
    });
  }

  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomePage,
      activeIcon: ImageConstant.imgHomePage,
      type: BottomBarEnum.Homepage,
    ),
    BottomMenuModel(
        icon: ImageConstant.imgSms,
        activeIcon: ImageConstant.imgSms,
        type: BottomBarEnum.Sms,
        iconData: Icons.notification_important_outlined),
    BottomMenuModel(
      icon: ImageConstant.imgMaleUser,
      activeIcon: ImageConstant.imgMaleUser,
      type: BottomBarEnum.Maleuser,
    )
  ];

  List<Widget> bodyItems = [
    DashboardPage(),
    NotificationPage(),
    ProfileDetailsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: bodyItems[selectedIndex],
      bottomNavigationBar: Container(
        height: 70.v,
        decoration: BoxDecoration(
          color: appTheme.blueGray10000.withOpacity(0.85),
          borderRadius: BorderRadius.circular(
            30.h,
          ),
        ),
        child: ValueListenableBuilder<Object>(
            valueListenable: showBadge,
            builder: (context, notifierValue, snapshot) {
              return BottomNavigationBar(
                backgroundColor: Colors.transparent,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0,
                elevation: 0,
                currentIndex: selectedIndex,
                type: BottomNavigationBarType.fixed,
                items: List.generate(bottomMenuList.length, (index) {
                  return BottomNavigationBarItem(
                    icon: bottomMenuList[index].iconData != null
                        ? Stack(
                            children: [
                              Icon(
                                bottomMenuList[index].iconData,
                                size: 40,
                                color: Colors.black,
                              ),
                              showBadge.value
                                  ? Positioned(
                                      right: 0,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          )
                        : CustomImageView(
                            imagePath: bottomMenuList[index].icon,
                            height: 50.v,
                            width: 40.h,
                          ),
                    activeIcon: bottomMenuList[index].iconData != null
                        ? Stack(
                            children: [
                              Icon(
                                bottomMenuList[index].iconData,
                                size: 40,
                                color: Colors.black,
                              ),
                              showBadge.value
                                  ? Positioned(
                                      right: 0,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          )
                        : CustomImageView(
                            imagePath: bottomMenuList[index].activeIcon,
                            height: 50.v,
                            width: 40.h,
                          ),
                    label: '',
                  );
                }),
                onTap: (index) {
                  if (index == 1) {
                    if (showBadge.value) {
                      databaseRef.child("show").set(false);
                    }
                  }
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    // databaseRef.child("show").onDisconnect();
    databaseRef.child("show").onDisconnect();
    super.dispose();
  }
}
