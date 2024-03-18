import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/utils/constants.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';

class ItemListCategories extends StatelessWidget {

  final CategoryData? categoryData;
  const ItemListCategories({Key? key, this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.navigate(DetailsMealsRoute(categoryData: categoryData)),
      child: Column(
        children: [
          Container(width: 125, height: 125,
            margin: const EdgeInsets.only(
                bottom: 8, left: 4, right: 4
            ),
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                    '${Constant.kImageBaseUrl}/${categoryData?.image}'
                )),
                borderRadius: BorderRadius.circular(12)
            ),
          ),
          AutoSizeText('${categoryData?.name}',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),

        ],
      ),
    );
  }
}
