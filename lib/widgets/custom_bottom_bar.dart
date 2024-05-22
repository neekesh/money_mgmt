import 'package:flutter/widgets.dart';
import 'package:oll2u/presentation/invoices_page_one_screen/notifier/invoices_page_one_notifier.dart';

import '../core/app_export.dart';
import 'package:flutter/material.dart';

enum BottomBarEnum { Homepage, Sms, Maleuser, none }
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBar extends ConsumerStatefulWidget {
  CustomBottomBar({
    this.onChanged,
  });

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends ConsumerState<CustomBottomBar> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.v,
      decoration: BoxDecoration(
        color: appTheme.blueGray10000.withOpacity(0.85),
        borderRadius: BorderRadius.circular(
          30.h,
        ),
      ),
      child: ValueListenableBuilder<Object>(
          valueListenable:
              ref.watch(invoicesPageOneNotifier).notificationStatus!,
          builder: (context, notificationValue, snapshot) {
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
                            bottomMenuList[index].iconData ==
                                        Icons.notification_important_outlined &&
                                    ref
                                            .watch(invoicesPageOneNotifier)
                                            .notificationStatus!
                                            .value["status"] ==
                                        "unseen"
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
                            bottomMenuList[index].iconData ==
                                        Icons.notification_important_outlined &&
                                    ref
                                            .watch(invoicesPageOneNotifier)
                                            .notificationStatus!
                                            .value["status"] ==
                                        "unseen"
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
                selectedIndex = index;
                widget.onChanged?.call(bottomMenuList[index].type);
                setState(() {});
              },
            );
          }),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      required this.type,
      this.iconData});

  String icon;
  IconData? iconData;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
