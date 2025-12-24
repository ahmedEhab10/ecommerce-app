import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatelessWidget {
  final void Function()? onTap;
  HeartButton({super.key, required this.onTap, required this.isFav});

  String heartIcon = IconsAssets.icHeart;

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: onTap,
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(
              AssetImage(
                isFav ? IconsAssets.icClickedHeart : IconsAssets.icHeart,
              ),
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
