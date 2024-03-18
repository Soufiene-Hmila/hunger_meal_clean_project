import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/bloc/bloc_cart.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/widget/alert_dialog_order.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_meal.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_meals.dart';

@RoutePage()
class DetailsProductPage extends StatefulWidget {

  final MealData? mealData;
  final CategoryData? categoryData;
  const DetailsProductPage({Key? key, this.mealData, this.categoryData}) : super(key: key);

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {

  int quantite = 0;
  int amount = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
      ),
      child: StreamBuilder<DataState<MealData?>>(
          stream: injector<BlocMeal>().getMealService(widget.mealData?.id),
          builder: (context, snapshot) {
            if(snapshot.data is DataSuccess){
              return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(centerTitle: true,
                    backgroundColor: Colors.transparent,
                    toolbarHeight: 120,
                    flexibleSpace: Container(height: 175,
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 14
                      ),
                      decoration: BoxDecoration(
                          color: AppThemeMode.primaryColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          ),
                          image: DecorationImage(fit: BoxFit.cover,
                            image: NetworkImage('${Constant.kImageBaseUrl}/${snapshot.data?.data?.image}'),
                          ),
                          backgroundBlendMode: BlendMode.clear
                      ),
                    ),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
                  floatingActionButton: Visibility(
                    visible: widget.mealData?.state == 'active',
                    child: StreamBuilder<MealData?>(
                        stream: injector<BlocCart>().getMealService(widget.mealData?.id,),
                        builder: (context, localSnapshot) {
                          if(localSnapshot.data != null){
                            return InkWell(
                              onTap: () {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialogOrder(mealData: localSnapshot.data);
                                }).then((value) {
                                  setState(() {

                                  });
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10
                                ),
                                decoration: BoxDecoration(
                                    color: AppThemeMode.secondaryColor,
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(CupertinoIcons.shopping_cart,),
                                    const SizedBox(width: 10,),
                                    AutoSizeText("${localSnapshot.data?.quantity} X ${localSnapshot.data?.price} DT",
                                      style: const TextStyle(fontWeight: FontWeight.w900,
                                          color: AppThemeMode.thirdColor, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialogOrder(mealData: snapshot.data?.data);
                              }).then((value) {
                                setState(() {

                                });
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10
                              ),
                              decoration: BoxDecoration(
                                  color: AppThemeMode.secondaryColor,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(CupertinoIcons.shopping_cart,),
                                  SizedBox(width: 10,),
                                  AutoSizeText("Add To Cart",
                                    style: TextStyle(fontWeight: FontWeight.w900,
                                        color: AppThemeMode.thirdColor, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(
                              left: 24, right: 12, top: 16, bottom: 10
                          ),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: AutoSizeText("${snapshot.data?.data?.name}".capitalize(),
                            style: const TextStyle(fontWeight: FontWeight.w800,
                                color: AppThemeMode.textColorBlack, fontSize: 30),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 10
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: AutoSizeText("${snapshot.data?.data?.description}",
                              style: const TextStyle(fontWeight: FontWeight.w500,
                                  color: AppThemeMode.textColorBlack, fontSize: 16),),
                          ),
                        ),

                        const Divider(indent: 24, endIndent: 24, thickness: 0.25,),

                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 24),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Servings", style: TextStyle(fontWeight: FontWeight.w400,
                                      color: AppThemeMode.textColorBlack, fontSize: 12),),
                                  SizedBox(height: 4,),
                                  Text("3.7", style: TextStyle(fontWeight: FontWeight.w800,
                                      color: AppThemeMode.textColorBlack, fontSize: 14),),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Time", style: TextStyle(fontWeight: FontWeight.w400,
                                      color: AppThemeMode.textColorBlack, fontSize: 12),),
                                  SizedBox(height: 4,),
                                  Text("1h 15 min", style: TextStyle(fontWeight: FontWeight.w800,
                                      color: AppThemeMode.textColorBlack, fontSize: 14),),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Calories", style: TextStyle(fontWeight: FontWeight.w400,
                                      color: AppThemeMode.textColorBlack, fontSize: 12),),
                                  SizedBox(height: 4,),
                                  Text("450", style: TextStyle(fontWeight: FontWeight.w800,
                                      color: AppThemeMode.textColorBlack, fontSize: 14),),
                                ],
                              ),
                            ],
                          ),
                        ),

                        StreamBuilder<DataState<List<MealData>?>>(
                            stream: injector<BlocMeal>().getMealsService(),
                            builder: (context, snapshot) {
                              if(snapshot.data is DataSuccess){
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10, left: 12, right: 12, top: 12
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const AutoSizeText('Other Meals',
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

                                          InkWell(
                                            onTap: () => context.router.navigate(const DetailsPopularRoute()),
                                            child: const AutoSizeText('View all', style: TextStyle(
                                                fontWeight: FontWeight.w500, fontSize: 18, color: AppThemeMode.primaryColor),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 230,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data?.data?.length,
                                          itemBuilder: (context, index) => ItemListMeals(
                                            mealData: snapshot.data?.data?.elementAt(index),)),
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox();
                            }
                        ),

                      ],
                    ),
                  )
              );
            }
            return const SizedBox();
        }
      ),
    );
  }
}
