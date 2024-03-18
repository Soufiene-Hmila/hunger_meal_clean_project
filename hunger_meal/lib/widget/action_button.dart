import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  final Color colorAction;
  final String iconDataAction;
  final Function() clickAction;

  const ActionButton({Key? key, required this.clickAction,
    required this.iconDataAction, required this.colorAction,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () => clickAction(),
          child: Container(
              decoration: BoxDecoration(color: colorAction,
                borderRadius: const BorderRadius.all(Radius.circular(10)),),
              child: Center(child: ImageIcon(AssetImage(iconDataAction),
                  size: 20, color: Colors.black,),
              )),
        ),
      ),
    );
  }
}


