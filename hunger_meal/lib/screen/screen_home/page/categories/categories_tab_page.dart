import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';

@RoutePage()
class CategoriesTabPage extends StatefulWidget {
  const CategoriesTabPage({super.key});

  @override
  State<CategoriesTabPage> createState() => _CategoriesTabPageState();
}

class _CategoriesTabPageState extends State<CategoriesTabPage> {
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
          title: const AutoSizeText('Categories',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: StreamBuilder<DataState<List<CategoryData>?>>(
            stream: injector<BlocCategory>().getCategoriesService(),
            builder: (context, snapshot) {
              if(snapshot.data is DataSuccess){
                return GridView.builder(
                  itemCount: snapshot.data?.data?.length,
                  padding: const EdgeInsets.only(top: 14),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => context.router.navigate(DetailsMealsRoute(
                        categoryData: snapshot.data?.data?.elementAt(index)
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 145,
                            margin: const EdgeInsets.only(
                                bottom: 8, left: 4, right: 4
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
