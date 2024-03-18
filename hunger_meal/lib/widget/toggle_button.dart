import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class ToggleButton extends StatefulWidget {

  final bool initValue;
  final ValueChanged<bool> onClick;
  const ToggleButton({Key? key, required this.onClick, required this.initValue}) : super(key: key);

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

class ToggleButtonState extends State<ToggleButton> {

  bool checkView = false;

  @override
  void initState() {
    checkView = widget.initValue;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToggleButton oldWidget) {
    if(widget.initValue != oldWidget.initValue){
      checkView = widget.initValue;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
          checkView = !checkView;
          widget.onClick(checkView);
        }),
      child: Container(width: 40, height: 24,
        decoration: BoxDecoration(
            color: AppThemeMode.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(50.0),),
            border: Border.all(color: AppThemeMode.containerFieldColor, width: 0.5)
        ),
        child: AnimatedAlign(
          alignment: Alignment(checkView? 1 : -1, 0),
          duration: const Duration(milliseconds: 100),
          child: Container(width: 24, height: 24,
            decoration: const BoxDecoration(
              color: AppThemeMode.thirdColor,
              shape: BoxShape.circle,),),
        ),
      ),
    );
  }
}