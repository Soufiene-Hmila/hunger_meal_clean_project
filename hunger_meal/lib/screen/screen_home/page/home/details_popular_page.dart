import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_meal.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_restaurant.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_meals.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_popular.dart';
import 'package:hunger_meal/screen/screen_home/page/home/widgets/item_list_restaurants.dart';

@RoutePage()
class DetailsPopularPage extends StatelessWidget {
  const DetailsPopularPage({Key? key,}) : super(key: key);

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
            backgroundColor: Colors.transparent,
            title: const AutoSizeText('Most Popular',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
          ),
          body: StreamBuilder<DataState<List<MealData>?>>(
              stream: injector<BlocMeal>().getMealsService(),
              builder: (context, snapshot) {
                if(snapshot.data is DataSuccess){
                  return ListView.builder(
                      shrinkWrap: true, padding: EdgeInsets.zero,
                      itemCount: snapshot.data?.data?.length,
                      itemBuilder: (context, index) => ItemListPopular(
                        mealData: snapshot.data?.data?.elementAt(index),));
                }
                return const SizedBox();
            }
          )
      ),
    );
  }
}
