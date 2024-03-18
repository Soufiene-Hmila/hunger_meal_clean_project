import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/widget/default_action_button.dart';
import 'package:hunger_meal/widget/field_action_button.dart';
import 'package:hunger_meal/widget/outline_action_button.dart';

@RoutePage()
class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {

  late Image image1;

  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/background.png");
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 45
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Image.asset("assets/hunger-icon.png", height: 156,),
                  const AutoSizeText('DroOl Over', style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 4,),
                  const AutoSizeText('Food Delivery',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),

                  Container(
                    margin: const EdgeInsets.only(bottom: 24, top: 12),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const AutoSizeText('Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                  ),


                  FieldActionButton(
                    textButton: "Connect",
                    onClickCallback: () {
                      context.router.replace(LoginRoute());
                    },
                  ),

                  // OutlineActionButton(
                  //   textButton: "Create an Account",
                  //   onClickCallback: () {
                  //     context.router.replace(RegisterRoute());
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ));
  }

}
