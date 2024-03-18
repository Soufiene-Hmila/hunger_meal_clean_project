import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';


@RoutePage()
class DetailsMealsPage extends StatelessWidget {

  final CategoryData? categoryData;
  const DetailsMealsPage({Key? key, this.categoryData}) : super(key: key);

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
          title: const AutoSizeText('List meals',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: StreamBuilder<DataState<CategoryData?>>(
            stream: injector<BlocCategory>().getCategoryService(categoryData?.id),
            builder: (context, snapshot) {
              if(snapshot.data is DataSuccess){
                return ListView.builder(shrinkWrap: true,
                    itemCount: snapshot.data?.data?.meals?.length,
                    padding: const EdgeInsets.only(
                        top: 16
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => context.router.navigate(
                          DetailsProductRoute(categoryData: snapshot.data?.data,
                            mealData: snapshot.data?.data?.meals?.elementAt(index),
                        )),
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 12, left: 12, right: 12,
                          ),
                          child: Column(
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
                                            image: NetworkImage('${Constant.kImageBaseUrl}/'
                                                '${snapshot.data?.data?.meals?.elementAt(index).image}')
                                        ),
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

                                        AutoSizeText('${snapshot.data?.data?.meals?.elementAt(index).name}'.capitalize(),
                                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

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

                                  const Spacer(),

                                  Visibility(
                                    visible: snapshot.data?.data?.meals?.elementAt(index).state == 'active',
                                    child: const Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(radius: 18,
                                        backgroundColor: AppThemeMode.primaryColor,
                                        child: Icon(CupertinoIcons.shopping_cart, size: 20,),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                            ],
                          ),
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
