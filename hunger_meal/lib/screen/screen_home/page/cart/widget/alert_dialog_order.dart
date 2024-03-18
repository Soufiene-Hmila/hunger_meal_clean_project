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
import 'package:hunger_meal/widget/default_action_button.dart';

class AlertDialogOrder extends StatefulWidget {

  final MealData? mealData;
  const AlertDialogOrder({Key? key, this.mealData}) : super(key: key);

  @override
  State<AlertDialogOrder> createState() => _AlertDialogOrderState();
}

class _AlertDialogOrderState extends State<AlertDialogOrder> {

  int? quantity;
  MealData? mealData;
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
    quantity = widget.mealData?.quantity;
    listSupplementData = widget.mealData?.supplements;
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

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 8, left: 10
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText("Price: ${mealData?.price} DT",
                        style: const TextStyle(fontWeight: FontWeight.w800,
                            color: AppThemeMode.textColorBlack, fontSize: 16),),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              quantity = (quantity ?? 1) + 1;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: AppThemeMode.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add, size: 22, color: AppThemeMode.thirdColor,))
                      ),
                      const SizedBox(width: 12,),
                      Text('$quantity', style: const TextStyle(color: AppThemeMode.textColorBlack, fontSize: 20),),
                      const SizedBox(width: 12,),
                      InkWell(
                          onTap: () {
                            if((quantity ?? 1) > 1){
                              setState(() {
                                quantity = (quantity ?? 1) + -1;
                              });
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: AppThemeMode.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.remove, size: 22, color: AppThemeMode.thirdColor,))
                      ),

                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 12
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const AutoSizeText("Supplements",
                    style: TextStyle(fontWeight: FontWeight.w500,
                        color: AppThemeMode.textColorBlack, fontSize: 16),),
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: listSupplementData?.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 6
                      ),
                      padding: const EdgeInsets.only(
                        left: 12, top: 2, bottom: 2
                      ),
                      decoration: BoxDecoration(
                        color: AppThemeMode.containerFieldColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText('${listSupplementData?.elementAt(index).name} +${listSupplementData?.elementAt(index).price} DT'.capitalize(),
                            style: TextStyle(fontSize: 18, color: AppThemeMode.textColorBlack,
                              fontWeight:  listSupplementData?.elementAt(index).inCart == 1
                                  ? FontWeight.w800: FontWeight.w500,
                            ),
                          ),
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(width: 0.5,)
                              ),
                              value: listSupplementData?.elementAt(index).inCart == 1,
                              onChanged: (value) {
                                setState(() {
                                  listSupplementData?.fillRange(index, index + 1, SupplementModel(
                                    id: listSupplementData?.elementAt(index).id ?? 0,
                                    name: listSupplementData?.elementAt(index).name,
                                    mealId: listSupplementData?.elementAt(index).mealId ?? 0,
                                    price: listSupplementData?.elementAt(index).price,
                                    mandatory: listSupplementData?.elementAt(index).mandatory,
                                    max: listSupplementData?.elementAt(index).max,
                                    inCart: (value ?? false) ? 1 : 0,
                                  ));
                                });
                              }
                          )
                        ],
                      ),
                    );
              }),

              Padding(
                padding: const EdgeInsets.only(
                    bottom: 12, left: 12, right: 12, top: 12
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const AutoSizeText('Total',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),

                    AutoSizeText('${calculateTotalPrice(mealData, quantity, listSupplementData)} DT', style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.textColorBlack),),

                  ],
                ),
              ),

              DefaultActionButton(
                isLoading: false,
                colorButton: AppThemeMode.secondaryColor,
                textColor: AppThemeMode.thirdColor,
                textButton: "Add To Cart",
                onClickCallback: () {
                  injector<BlocCart>().setMealService(MealData(
                    id: mealData?.id ?? 0,
                    restaurantId: mealData?.restaurantId ?? 0,
                    categoryId: mealData?.categoryId ?? 0,
                    name: mealData?.name,
                    approved: mealData?.approved ?? 1,
                    available: mealData?.available ?? 1,
                    price: mealData?.price,
                    image: mealData?.image,
                    rating: mealData?.rating,
                    ratingTotal: mealData?.ratingTotal,
                    ratingNumber: mealData?.ratingNumber,
                    description: mealData?.description,
                    state: mealData?.state,
                    zoneId: mealData?.zoneId ?? 1,
                    maxSupplement: mealData?.maxSupplement,
                    supplements: listSupplementData,
                    quantity: quantity ?? 1,
                  ));
                  Navigator.of(context).pop<bool>(true);
                },
              ),

            ],
          ),
        )
    );
  }
}
