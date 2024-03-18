import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class ItemListMeals extends StatelessWidget {

  final MealData? mealData;
  const ItemListMeals({Key? key, this.mealData}) : super(key: key);

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
              Container(width: 250, height: 150,
                margin: const EdgeInsets.only(
                    bottom: 8, left: 4, right: 4
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                        '${Constant.kImageBaseUrl}/${mealData?.image}',
                    )),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    AutoSizeText('${mealData?.name}',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AutoSizeText('Café  Western Food',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: AutoSizeText('4.9', style: TextStyle(fontSize: 12,
                              color: AppThemeMode.primaryColor, fontWeight: FontWeight.w300),),
                        ),
                        Icon(CupertinoIcons.star_fill, size: 18,),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
          Positioned(
            top: 12, left: 12,
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
                    child: const Text('-50 %',
                      style: TextStyle(fontSize: 12, color: AppThemeMode.thirdColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Text('2sd',
                    style: TextStyle(fontSize: 12, color: AppThemeMode.textColorBlack,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: mealData?.state == 'active',
            child: const Positioned(
              bottom: 60, right: 12,
              child: CircleAvatar(
                backgroundColor: AppThemeMode.secondaryColor,
                child: Icon(CupertinoIcons.shopping_cart,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
