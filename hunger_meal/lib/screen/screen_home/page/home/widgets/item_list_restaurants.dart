import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/utils/constants.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';

class ItemListRestaurants extends StatelessWidget {

  final RestaurantData? restaurantDatata;
  const ItemListRestaurants({Key? key, this.restaurantDatata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.navigate(DetailsRestaurantRoute(
          restaurantData: restaurantDatata
      )),
      child: Container(
        margin: const EdgeInsets.only(
            bottom: 14
        ),
        child: Stack(
          children: [
            Column(
              children: [

                Container(height: 180,
                  margin: const EdgeInsets.only(
                      bottom: 8, left: 8, right: 8
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                        '${Constant.kImageBaseUrl}/${restaurantDatata?.image}'
                    )),
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

                      AutoSizeText('${restaurantDatata?.username}'.capitalize(),
                        style: const TextStyle(fontWeight: FontWeight.w600,
                            fontSize: 18),),

                      const Row(
                        children: [
                          Icon(CupertinoIcons.star_fill, size: 18,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: AutoSizeText('4.9', style: TextStyle(fontSize: 12,
                                color: AppThemeMode.primaryColor, fontWeight: FontWeight.w300),),
                          ),
                          AutoSizeText('(124 ratings) Café  Western Food',
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
              top: 12, right: 24,
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
                          color: AppThemeMode.secondaryColor
                      ),
                      child: const AutoSizeText('FREE',
                        style: TextStyle(fontSize: 14, color: AppThemeMode.thirdColor,
                            fontWeight: FontWeight.w500),
                      )
                    ),
                    const Icon(Icons.directions_bike_rounded,
                      color: AppThemeMode.secondaryColor, size: 20,)
                  ],
                ),
              ),
            ),

            Positioned(
              top: 12, left: 18,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppThemeMode.secondaryColor
                ),
                child: const CircleAvatar(radius: 24,
                  backgroundColor: AppThemeMode.secondaryColor,
                  backgroundImage: AssetImage('assets/images/logo-restaurant.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
