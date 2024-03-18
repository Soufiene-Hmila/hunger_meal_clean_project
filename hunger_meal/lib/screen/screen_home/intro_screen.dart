import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/widget/default_action_button.dart';
import 'package:hunger_meal/widget/field_action_button.dart';

@RoutePage()
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  late Image image1;
  late Image image2;

  int currentIndexPage = 0;


  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/background.png");
    image2 = Image.asset("assets/images/intro-image-0.png",);
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
                  fit: BoxFit.cover, image: image1.image, opacity: 0.56)),),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 42, top: 32
              ),
              child: PageView(
                onPageChanged: (value){
                  setState(() => currentIndexPage = value);
                },
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 48),
                        child: Image.asset("assets/images/intro-image-0.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      DotsIndicator(dotsCount: 3,
                        position: currentIndexPage,
                        decorator: DotsDecorator(
                          color: AppThemeMode.primaryColor,
                          activeColor: AppThemeMode.secondaryColor,
                          size: const Size.square(9.0),
                          activeSize: const Size(9.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: const AutoSizeText('Find Food You Love',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 56),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const AutoSizeText('Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                      ),
                      FieldActionButton(
                        onClickCallback: () {

                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 48),
                        child: Image.asset("assets/images/intro-image-1.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      DotsIndicator(dotsCount: 3,
                        position: currentIndexPage,
                        decorator: DotsDecorator(
                          color: AppThemeMode.primaryColor,
                          activeColor: AppThemeMode.secondaryColor,
                          size: const Size.square(9.0),
                          activeSize: const Size(9.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: const AutoSizeText('Fast Delivery',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 56),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const AutoSizeText('Fast food delivery to your home, office wherever you are',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                      ),
                      FieldActionButton(
                        onClickCallback: () {

                        },
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 48),
                        child: Image.asset("assets/images/intro-image-2.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      DotsIndicator(dotsCount: 3,
                        position: currentIndexPage,
                        decorator: DotsDecorator(
                          color: AppThemeMode.primaryColor,
                          activeColor: AppThemeMode.secondaryColor,
                          size: const Size.square(9.0),
                          activeSize: const Size(9.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: const AutoSizeText('Live Tracking',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 56),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const AutoSizeText('Real time tracking of your food on the app once you placed the order',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                      ),
                      FieldActionButton(
                        onClickCallback: () {
                          context.router.replace(const HomeRoute());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
