import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/bloc/bloc_cart.dart';

class ItemListCartOrder extends StatefulWidget {

  final MealData? mealData;
  final VoidCallback voidCallback;
  const ItemListCartOrder({Key? key, this.mealData,
    required this.voidCallback}) : super(key: key);

  @override
  State<ItemListCartOrder> createState() => _ItemListCartOrderState();
}

class _ItemListCartOrderState extends State<ItemListCartOrder> {

  int? quantity;
  MealData? mealData;

  @override
  void initState() {
    mealData = widget.mealData;
    quantity = mealData?.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12, left: 12, right: 12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 56, height: 56,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,
                        image: NetworkImage('${Constant.kImageBaseUrl}'
                            '/${mealData?.image}'
                        )), borderRadius: BorderRadius.circular(12)
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.7 - 100,
                padding: const EdgeInsets.only(
                    left: 12
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    AutoSizeText('${mealData?.name}'.capitalize(),
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                    const Text('Café  Western Food',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),

                    AutoSizeText('${mealData?.price} DT',
                      style: const TextStyle(fontWeight: FontWeight.w800,
                          fontSize: 14, color: AppThemeMode.primaryColor),),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          quantity = (quantity ?? 1) + 1;
                          injector<BlocCart>().setQuantityMealService(QuantityParams(mealId: mealData?.id, quantity: quantity));
                        });
                        widget.voidCallback();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppThemeMode.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add, size: 18, color: AppThemeMode.thirdColor,))
                  ),
                  const SizedBox(width: 10,),
                  Text('$quantity', style: const TextStyle(
                      color: AppThemeMode.textColorBlack, fontSize: 20),),
                  const SizedBox(width: 10,),
                  InkWell(
                      onTap: () {
                        if((quantity ?? 1) > 1){
                          setState(() {
                            quantity = (quantity ?? 1) + -1;
                            injector<BlocCart>().setQuantityMealService(QuantityParams(mealId: mealData?.id, quantity: quantity));
                          });
                          widget.voidCallback();
                        } else {
                          injector<BlocCart>().deleteMealService(mealData?.id);
                          widget.voidCallback();
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppThemeMode.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.remove, size: 18, color: AppThemeMode.thirdColor,))
                  ),
                ],
              ),
            ],
          ),

          Visibility(
            visible: mealData?.supplements?.isNotEmpty ?? false,
            child: Container(
              margin: const EdgeInsets.only(top: 14, bottom: 12),
              width: MediaQuery.of(context).size.width * 0.9 - 24,
              child: Wrap(
                spacing: 6.0, runSpacing: 6.0,
                children: (mealData?.supplements ?? []).takeWhile((value) => value.inCart == 1).map((suplm) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                        color: AppThemeMode.containerFieldColor,
                        borderRadius: BorderRadius.circular(24)
                    ),
                    child: AutoSizeText('${suplm.name} +${suplm.price} DT',
                      style: const TextStyle(fontSize: 12,
                        color: AppThemeMode.textColorBlack,
                      ),),
                  );
                }).toList(),
              ),
            ),
          ),

          const Divider(indent: 4, endIndent: 4, thickness: 0.1,),
        ],
      ),
    );
  }
}

