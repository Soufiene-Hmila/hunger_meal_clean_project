import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class OutlineActionButton extends StatelessWidget {

  final VoidCallback onClickCallback;
  final String textButton;

  const OutlineActionButton({Key? key, this.textButton = "Next",
    required this.onClickCallback, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () => onClickCallback.call(),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Container(
          height: 50, width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(color: AppThemeMode.thirdColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(color: AppThemeMode.primaryColor, width: 1)
          ),
          child: Center(child: AutoSizeText(textButton, style: const TextStyle(
              color: AppThemeMode.primaryColor, fontSize: 24, fontWeight: FontWeight.w500),),
          ),
        ),
      )
    );
  }
}
