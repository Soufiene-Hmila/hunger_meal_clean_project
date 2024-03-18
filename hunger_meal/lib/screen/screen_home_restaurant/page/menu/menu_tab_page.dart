import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/bloc/bloc_menu.dart';

@RoutePage()
class MenuTabPage extends StatefulWidget {
  const MenuTabPage({super.key});

  @override
  State<MenuTabPage> createState() => _MenuTabPageState();
}

class _MenuTabPageState extends State<MenuTabPage> {

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
          title: const AutoSizeText('Menu',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: StreamBuilder<DataState<List<RestaurantCategoryData>?>>(
            stream: injector<BlocMenu>().getRestaurantCategoriesService(userData?.id),
            builder: (context, snapshot) {
              if(snapshot.data is DataSuccess){
                return GridView.builder(
                  itemCount: snapshot.data?.data?.length,
                  padding: const EdgeInsets.only(top: 14),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1,
                    mainAxisExtent: 175
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => context.router.navigate(DetailsMenuRoute(
                          categoryData: snapshot.data?.data?.elementAt(index)
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            margin: const EdgeInsets.only(
                                bottom: 8, left: 8, right: 8
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                                    '${Constant.kImageBaseUrl}/${snapshot.data?.data?.elementAt(index).image}'
                                )),
                                borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14
                            ),
                            child: AutoSizeText('${snapshot.data?.data?.elementAt(index).name}',
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          ),

                        ],
                      ),
                    );
                  },);
              }
              return const SizedBox();
            }
        ),
      ),
    );
  }
}
