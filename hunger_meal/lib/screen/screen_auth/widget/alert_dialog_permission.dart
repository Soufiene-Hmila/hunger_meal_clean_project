import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class AlertDialogPermission extends StatefulWidget{

  final bool checkView;
  const AlertDialogPermission({super.key, this.checkView = false,});

  @override
  State<StatefulWidget> createState() => AlertDialogPermissionState();
  
}
class AlertDialogPermissionState extends State<AlertDialogPermission>{

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppThemeMode.textColorWhite,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: const Icon(Icons.warning_rounded, size: 50, color: AppThemeMode.primaryColor,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.checkView ?
            "L'autorisation de localisation est refusée. Veuillez autoriser la permission de localisation !":
            "Le service de localisation est désactivé. Veuillez activer le service !",),
          const SizedBox(height: 10,),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppThemeMode.textColorWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset.fromDirection(1.1, 1.0),
                          blurRadius: 2.0),],
                  ),
                  child: const Center(
                    child: Text("No", textAlign: TextAlign.center,
                      style: TextStyle(color: AppThemeMode.primaryColor),),
                  )),
              onTap: () => Navigator.of(context).pop<bool>(false),
            ),
            const SizedBox(width: 10,),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppThemeMode.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset.fromDirection(1.1,3.0),
                          blurRadius: 8.0),],
                  ),
                  child: const Center(
                    child: Text('Open Settings', textAlign: TextAlign.center,
                      style: TextStyle(color: AppThemeMode.textColorWhite),),
                  )),
              onTap: () => Navigator.of(context).pop<bool>(true),
            ),
          ],
        ),
      ],
    );
  }

}