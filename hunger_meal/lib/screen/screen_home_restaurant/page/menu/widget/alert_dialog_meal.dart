import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/models/client/meals/supplement_model.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/bloc/bloc_cart.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/bloc/bloc_menu.dart';
import 'package:hunger_meal/widget/default_action_button.dart';

class AlertDialogMeal extends StatefulWidget {

  final RestaurantMealData? mealData;
  const AlertDialogMeal({Key? key, this.mealData}) : super(key: key);

  @override
  State<AlertDialogMeal> createState() => _AlertDialogMealState();
}

class _AlertDialogMealState extends State<AlertDialogMeal> {

  int? quantity;
  RestaurantMealData? mealData;
  List<SupplementData>? listSupplementData;

  double calculateTotalPrice(MealData? meal, int? quantity, List<SupplementData>? supplements) {
    double total = 0.0;
    total += double.parse("${meal?.price}") * (quantity ?? 1);
    supplements?.forEach((supplement) {
      if(supplement.inCart == 1) {
        total += double.parse("${supplement.price}");
      }
    });
    return double.parse(total.toStringAsFixed(2));
  }

  @override
  void initState() {
    mealData = widget.mealData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(backgroundColor: AppThemeMode.textColorWhite,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0))
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 14
        ),
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 18, horizontal: 12
          ),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: AppThemeMode.thirdColor,
              borderRadius: BorderRadius.all(Radius.circular(18.0))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(width: 65, height: 65,
                    margin: const EdgeInsets.only(
                        bottom: 8, left: 4, right: 4
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage('${Constant.kImageBaseUrl}/${mealData?.image}'
                            )), borderRadius: BorderRadius.circular(12)
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        AutoSizeText('${mealData?.name}'.capitalize(),
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),

                        const Text('Café  Western Food',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),

                        const Row(
                          children: [
                            Icon(CupertinoIcons.star_fill, size: 12,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text('4.9', style: TextStyle(fontSize: 12,
                                  color: AppThemeMode.primaryColor, fontWeight: FontWeight.w300),),
                            ),
                            Text('(124 ratings)',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),

              Container(
                margin: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 12, right: 12
                ),
                child: const AutoSizeText("Lorem Ipsum is simplyf type and scrambled it to make a type specimen book ?",
                  style: TextStyle(fontSize: 16),),
              ),

              DefaultActionButton(
                isLoading: false,
                colorButton: AppThemeMode.secondaryColor,
                textColor: AppThemeMode.thirdColor,
                textButton: "Change",
                onClickCallback: () {
                  injector<BlocMenu>().changeRestaurantMealStateService(
                      StateParams(
                        id: mealData?.id,
                        state: mealData?.state == 'active' ? 'not_active' : 'active',
                      )
                  ).forEach((element) {
                    Navigator.of(context).pop<bool>(true);
                  });

                },
              ),

            ],
          ),
        )
    );
  }
}
