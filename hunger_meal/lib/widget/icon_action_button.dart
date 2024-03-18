import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class IconActionButton extends StatelessWidget {


  final Color colorButton;
  final String textButton;
  final String iconButton;
  final VoidCallback onClickCallback;

  const IconActionButton({Key? key, required this.textButton, required this.onClickCallback,
    required this.iconButton, required this.colorButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () => onClickCallback.call(),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Container(
          height: 50, width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(color: colorButton,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(AssetImage(iconButton,), color: Colors.white,),
              const SizedBox(width: 10,),
              AutoSizeText(textButton, style: const TextStyle(
                  color: AppThemeMode.thirdColor,
                  fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      )
    );
  }
}
