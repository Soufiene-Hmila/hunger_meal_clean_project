import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class RadioButton extends StatefulWidget {

  final double buttonSize;
  final bool initValue;
  final ValueChanged<bool> onClick;
  const RadioButton({Key? key, this.buttonSize = 14, required this.onClick, this.initValue = false,}) : super(key: key);

  @override
  RadioButtonState createState() => RadioButtonState();
}

class RadioButtonState extends State<RadioButton> {

  bool checkView = false;
  bool initValue = false;

  @override
  void didUpdateWidget(covariant RadioButton oldWidget) {
    if(widget.initValue != oldWidget.initValue){
      initValue = widget.initValue;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
          initValue = !initValue;
          widget.onClick(initValue);
        }),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppThemeMode.primaryColor,
          border: Border.all(width: 1, color: AppThemeMode.thirdColor),
        ),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 100),
          firstChild: Container(width: widget.buttonSize, height: widget.buttonSize,
            decoration: const BoxDecoration(color: AppThemeMode.thirdColor,
              shape: BoxShape.circle,),),
          secondChild: Container(width: widget.buttonSize, height: widget.buttonSize,
            decoration: const BoxDecoration(color: AppThemeMode.primaryColor,
              shape: BoxShape.circle,),),
          crossFadeState: initValue ? CrossFadeState.showSecond: CrossFadeState.showFirst,
        ),
      ),
    );
  }
}