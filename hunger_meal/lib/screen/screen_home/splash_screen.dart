import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data/datasources/service/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:phone_number_text_field/phone_number_text_field.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Image image1;
  late Image image2;

  UserData? userData;

  @override
  void initState() {
    userData = injector<LocalStorageService>().userData;
    injector<LocalStorageService>().isUserLoggedIn().then((value) {
      if(value == true){

        switch(userData?.roleId) {
          case 3:
            Future.delayed(const Duration(seconds: 3), () {
              context.router.replace(const HomeRestaurantRoute());
            });
            break;
          case 4:
            Future.delayed(const Duration(seconds: 3), () {
              context.router.replace(const HomeDriverRoute());
            });
          case 5:
            Future.delayed(const Duration(seconds: 3), () {
              if(injector<LocalStorageService>().userData?.zoneId != null) {
                context.router.replace(const HomeRoute());
              } else {
                context.router.replace(const ChoiceRoute());
              }
            });
            break;
          default: Future.delayed(const Duration(seconds: 3), () {
            context.router.replace(const ChoiceRoute());
          });
        }

      } else {
        Future.delayed(const Duration(seconds: 3), () {
          context.router.replace(const ChoiceRoute());
        });
      }
    });
    image1 = Image.asset("assets/background.png");
    image2 = Image.asset("assets/hunger-logo.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThemeMode.thirdColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(
                fit: BoxFit.cover, image: image1.image, opacity: 0.56)),
            ),
            Image.asset("assets/hunger-icon.png", height: 180,),
          ],
        )
    );

  }


}
