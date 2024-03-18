import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/widget/alert_dialog_order.dart';

class ItemListPopular extends StatelessWidget {

  final MealData? mealData;
  const ItemListPopular({Key? key, this.mealData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.navigate(DetailsProductRoute(
        mealData: mealData
      )),
      child: Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: MediaQuery.of(context).size.width, height: 175,
                margin: const EdgeInsets.only(
                    bottom: 10, left: 12, right: 12
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                        '${Constant.kImageBaseUrl}/${mealData?.image}',
                    )),
                    borderRadius: BorderRadius.circular(14)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 14
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    AutoSizeText('${mealData?.name}'.capitalize(),
                      style: const TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 18),),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.star_fill, size: 18,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: AutoSizeText('4.9', style: TextStyle(fontSize: 12,
                              color: AppThemeMode.primaryColor, fontWeight: FontWeight.w500),),
                        ),
                        AutoSizeText('Café  Western Food',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                        ),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),

          Positioned(
            top: 12, left: 24,
            child: Container(
              padding: const EdgeInsets.only(
                right: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppThemeMode.thirdColor
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5.5
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: AppThemeMode.primaryColor
                    ),
                    child: const AutoSizeText('-50 %',
                      style: TextStyle(fontSize: 14, color: AppThemeMode.thirdColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const AutoSizeText('2sd',
                    style: TextStyle(fontSize: 14, color: AppThemeMode.textColorBlack,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),

          Visibility(
            visible: mealData?.state == 'active',
            child: Positioned(
              bottom: 45, right: 24,
              child: FloatingActionButton(elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(56)
                ),
                backgroundColor: AppThemeMode.textColorBlack,
                child: const Icon(CupertinoIcons.shopping_cart,),
                onPressed: () {

                },
              ),
            ),
          )

          // const Positioned(
          //   top: 12, right: 24,
          //     child: Icon(CupertinoIcons.heart_fill,
          //       color: Colors.white, size: 28,)),

        ],
      ),
    );
  }
}
