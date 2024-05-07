import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/gridordertext_item_model.dart'; // ignore: must_be_immutable

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
            vertical: 8.v,
          ),
          decoration: BoxDecoration(
            color: gridordertextItemModelObj.color ?? Colors.green,
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
                SizedBox(height: 10.v),
                Text(
                  gridordertextItemModelObj.orderText!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    height: 1,
                  ),
                ),
                SizedBox(height: 9.v)
              ],
            ),
          )),
    );
  }
}
