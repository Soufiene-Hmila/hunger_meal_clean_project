import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/datasources/service/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_meal.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_restaurant.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_categories.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_meals.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_restaurants.dart';
@RoutePage()
class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {

  UserData? userData;

  @override
  void initState() {
    userData = injector<LocalStorageService>().userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text('Good Morning', maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
              ),

              const Padding(
                padding: EdgeInsets.only(
                  top: 8
                ),
                child: AutoSizeText('Delivering to',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),

              // InkWell(
              //   onTap: () => context.router.replace(LocationPickerRoute(voidCallback: (pickedData){})),
              //   child: const Row(
              //     children: [
              //       AutoSizeText('Current Location',
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 12),
              //         child: Icon(Icons.expand_more_outlined, size: 22, color: AppThemeMode.primaryColor,),
              //       ),
              //     ],
              //   ),
              // ),

              DropdownButtonHideUnderline(
                child: DropdownButton<ZoneAddressData?>(
                    elevation: 1, borderRadius: BorderRadius.circular(12),
                    icon: const Icon(Icons.expand_more_outlined, size: 22, color: AppThemeMode.primaryColor,),
                    onChanged: (ZoneAddressData? newValue){

                    },
                    items: const [
                      DropdownMenuItem(child: AutoSizeText('Sousse Governorate',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),),

                    ]
                ),
              )

            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<DataState<List<CategoryData>?>>(
                stream: injector<BlocCategory>().getCategoriesService(),
                builder: (context, snapshot) {
                  if(snapshot.data is DataSuccess){
                    return Container(height: 175,
                      margin: const EdgeInsets.only(top: 6),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.data?.length,
                          itemBuilder: (context, index) => ItemListCategories(
                            categoryData: snapshot.data?.data?.elementAt(index),)),
                    );
                  }
                  return const SizedBox();
                }
              ),

              StreamBuilder<DataState<List<RestaurantData>?>>(
                  stream: injector<BlocRestaurant>().getRestaurantsService(),
                  builder: (context, snapshot) {
                    if(snapshot.data is DataSuccess){
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10, left: 12, right: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText('Popular Restaurents',
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

                                InkWell(
                                  onTap: () => context.router.navigate(const DetailsRestaurantsRoute()),
                                  child: const AutoSizeText('View all', style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18, color: AppThemeMode.primaryColor),),
                                ),

                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true, padding: EdgeInsets.zero,
                              itemCount: (snapshot.data?.data?.length ?? 0) < 3
                                  ? snapshot.data?.data?.length : 2,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ItemListRestaurants(
                                restaurantDatata: snapshot.data?.data?.elementAt(index),)),
                        ],
                      );
                    }
                    return const SizedBox();
                }
              ),

              StreamBuilder<DataState<List<MealData>?>>(
                  stream: injector<BlocMeal>().getMealsService(),
                  builder: (context, snapshot) {
                    if(snapshot.data is DataSuccess){
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10, left: 12, right: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText('Most Popular',
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
        ),
      ),
    );
  }
}
