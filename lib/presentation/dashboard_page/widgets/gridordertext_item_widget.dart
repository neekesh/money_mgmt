import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/gridordertext_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class GridordertextItemWidget extends StatelessWidget {
  GridordertextItemWidget(this.gridordertextItemModelObj,
      {Key? key, this.onTapColumnordertext})
      : super(
          key: key,
        );

  GridordertextItemModel gridordertextItemModelObj;

  VoidCallback? onTapColumnordertext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnordertext?.call();
      },
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 15.v,
          ),
          decoration: AppDecoration.fillGreen.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: gridordertextItemModelObj.orderImage!,
                  height: 50.v,
                  width: 90.h,
                ),
                SizedBox(height: 16.v),
                Text(
                  gridordertextItemModelObj.orderText!,
                  style: CustomTextStyles.titleMediumSemiBold,
                ),
                SizedBox(height: 9.v)
              ],
            ),
          )),
    );
  }
}
