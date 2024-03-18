import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_meal.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_restaurant.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_categories.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_meals.dart';

@RoutePage()
class DetailsRestaurantPage extends StatelessWidget {

  final RestaurantData? restaurantData;
  const DetailsRestaurantPage({Key? key, this.restaurantData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(centerTitle: true,
            toolbarHeight: 125,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(height: 180,
              decoration: BoxDecoration(color: AppThemeMode.primaryColor,
                  image: DecorationImage(fit: BoxFit.cover,
                    image: NetworkImage('${Constant.kImageBaseUrl}/${restaurantData?.image}'),
                  ),
                  backgroundBlendMode: BlendMode.clear
              ),
            ),
          ),
          body: StreamBuilder<DataState<RestaurantData?>>(
              stream: injector<BlocRestaurant>().getRestaurantService(restaurantData?.userId),
              builder: (context, snapshot) {
                if(snapshot.data is DataSuccess){
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(
                              left: 24, right: 12, bottom: 10, top: 12
                          ),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: AutoSizeText("${snapshot.data?.data?.username}",
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
                            child: AutoSizeText(snapshot.data?.data?.description ?? Constant.textData,
                              style: const TextStyle(fontWeight: FontWeight.w500,
                                  color: AppThemeMode.textColorBlack, fontSize: 16),),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(bottom: 18, right: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: AppThemeMode.containerNavigator,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Text("Italian", style: TextStyle(fontWeight: FontWeight.w400,
                                      color: AppThemeMode.thirdColor, fontSize: 16),)
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: AppThemeMode.containerFieldColor,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: AppThemeMode.textColorBlack, width: 0.5)
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(CupertinoIcons.star,
                                        color: AppThemeMode.textColorBlack, size: 18,),
                                      SizedBox(width: 12,),
                                      Text("3.7", style: TextStyle(fontWeight: FontWeight.w400,
                                          color: AppThemeMode.textColorBlack, fontSize: 14),),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),

                        const Divider(indent: 24, endIndent: 24, thickness: 0.25,),

                        Visibility(
                          visible: snapshot.data?.data?.categories?.isNotEmpty ?? false,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 10, left: 12, right: 12, top: 12
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AutoSizeText('Categories',
                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

                                    InkWell(
                                      onTap: () => context.router.navigate(const DetailsPopularRoute()),
                                      child: const AutoSizeText('View all', style: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 18, color: AppThemeMode.primaryColor),),
                                    ),
                                  ],
                                ),
                              ),
                              Container(height: 175,
                                margin: const EdgeInsets.only(top: 6),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data?.data?.categories?.length,
                                    itemBuilder: (context, index) => ItemListCategories(
                                      categoryData: snapshot.data?.data?.categories?.elementAt(index),)),
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
                                          const AutoSizeText('Popular Meals',
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
                  );
                }
                return const SizedBox();
              }
          )
      ),
    );
  }
}
