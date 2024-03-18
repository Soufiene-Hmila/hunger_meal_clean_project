import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/bloc/bloc_menu.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/widget/alert_dialog_meal.dart';


@RoutePage()
class DetailsMenuPage extends StatefulWidget {

  final RestaurantCategoryData? categoryData;
  const DetailsMenuPage({Key? key, this.categoryData}) : super(key: key);

  @override
  State<DetailsMenuPage> createState() => _DetailsMenuPageState();
}

class _DetailsMenuPageState extends State<DetailsMenuPage> {

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
        appBar: AppBar(centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const AutoSizeText('List Meals',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: StreamBuilder<DataState<List<RestaurantMealData>?>>(
            stream: injector<BlocMenu>().getRestaurantMealsService(
                RestaurantOrdersParams(
                  params: widget.categoryData?.id, id: userData?.id
                )
            ),
            builder: (context, snapshot) {
              if(snapshot.data is DataSuccess){
                return ListView.builder(shrinkWrap: true,
                    itemCount: snapshot.data?.data?.length,
                    padding: const EdgeInsets.only(
                        top: 16
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 18, left: 12, right: 12,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Container(width: 56, height: 56,
                                      margin: const EdgeInsets.only(
                                          bottom: 8, left: 4, right: 4
                                      ),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(fit: BoxFit.cover,
                                              image: NetworkImage("${Constant.kImageBaseUrl}"
                                                  "/${snapshot.data?.data?.elementAt(index).image}")),
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

                                          AutoSizeText('${snapshot.data?.data?.elementAt(index).name}',
                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                          const Text('Café  Western Food',
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
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
                                snapshot.data?.data?.elementAt(index).supplements?.isNotEmpty ?? false ?
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: Wrap(
                                    spacing: 6.0,
                                    runSpacing: 6.0,
                                    children: (snapshot.data?.data?.elementAt(index).supplements ?? []).map((suplm) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                        decoration: BoxDecoration(
                                            color: AppThemeMode.containerFieldColor,
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                        child: AutoSizeText('${suplm.name}', style: const TextStyle(fontSize: 12),),
                                      );
                                    }).toList(),
                                  ),
                                ) : const SizedBox(),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 16
                                  ),
                                  child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0, right: 0,
                              child: InkWell(
                                onTap: () {
                                  showDialog(context: context, builder: (context) {
                                    return AlertDialogMeal(mealData: snapshot.data?.data?.elementAt(index));
                                  }).then((value) {
                                    if(value == true){
                                      setState(() {

                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(shape: BoxShape.circle,
                                    color: snapshot.data?.data?.elementAt(index).state == 'active'
                                        ? AppThemeMode.primaryColor : AppThemeMode.borderColorBlack,
                                  ),
                                  child: Icon(snapshot.data?.data?.elementAt(index).state == 'active'
                                      ? CupertinoIcons.check_mark_circled_solid
                                      : CupertinoIcons.circle_fill,
                                    color: AppThemeMode.thirdColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
              return const SizedBox();
            }
        ),
      ),
    );
  }
}
