import '../core/app_export.dart';
import 'package:flutter/material.dart';

enum BottomBarEnum { Homepage, Sms, Maleuser }
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
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
    ),
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
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 50.v,
              width: 40.h,
            ),
            activeIcon: CustomImageView(
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
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon, required this.activeIcon, required this.type});

  String icon;

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
