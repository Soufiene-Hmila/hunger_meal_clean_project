import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/screen/screen_auth/widget/alert_dialog_permission.dart';
import 'package:hunger_meal/widget/field_action_button.dart';

@RoutePage()
class LocationSettingScreen extends StatefulWidget {
  const LocationSettingScreen({super.key});

  @override
  State<LocationSettingScreen> createState() => _LocationSettingScreenState();
}

class _LocationSettingScreenState extends State<LocationSettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeMode.thirdColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(),
            FieldActionButton(
              textButton: "Allow",
              onClickCallback: () {

                Geolocator.isLocationServiceEnabled().then((isLocationServiceEnabled) {
                  if(isLocationServiceEnabled){
                    Geolocator.checkPermission().then((permission) {
                      if([LocationPermission.whileInUse, LocationPermission.always].contains(permission)){
                        context.router.replace(LocationPickerRoute(voidCallback: (pickedData) {}));
                      } else if([LocationPermission.denied, LocationPermission.deniedForever].contains(permission)){
                        showDialog(context: context, builder: (BuildContext context) =>
                        const AlertDialogPermission(checkView: true,)
                        ).then((enablePermission) => enablePermission
                            ? Geolocator.openAppSettings()
                            : Geolocator.requestPermission()
                        );
                      } else {
                        Geolocator.requestPermission();
                      }
                    });
                  } else {
                    showDialog(context: context, builder: (BuildContext context) => const AlertDialogPermission()
                    ).then((enablePermission) => enablePermission
                        ? Geolocator.openLocationSettings()
                        : Geolocator.requestPermission()
                    );
                  }
                });
              },
            ),
            const SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }

}
