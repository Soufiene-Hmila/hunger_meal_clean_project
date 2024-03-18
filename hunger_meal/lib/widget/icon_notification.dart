import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class IconNotification extends StatelessWidget {

  final bool checkDirection;
  final String? textData;
  final Color colorData;
  final String imageData;
  final double imageSize;
  final VoidCallback voidCallback;
  const IconNotification({Key? key, required this.voidCallback,
    required this.imageData, this.textData, required this.colorData,
    this.imageSize = 28, this.checkDirection = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => voidCallback.call(),
        customBorder: const CircleBorder(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: checkDirection?25:0, right: checkDirection?0:25),
              child: ImageIcon(AssetImage(imageData),
                size: imageSize, color: AppThemeMode.textColorBlack,),
            ),
            textData!=null && textData != '0'?
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(shape: BoxShape.circle, color: colorData),
              child: Align(alignment: Alignment.center, child: Text("$textData",
                    style: const TextStyle(fontSize: 12, color: Colors.white),)),
            ): const SizedBox(),
          ],
        ));
  }
}
