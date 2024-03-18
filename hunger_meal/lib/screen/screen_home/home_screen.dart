import 'package:auto_size_text/auto_size_text.dart';
import 'package:data/datasources/service/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home/bloc/bloc_nav.dart';
import 'package:hunger_meal/src/awesome_bottom_bar.dart';
import 'package:hunger_meal/src/widgets/inspired/inspired.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int currantPageIndex = 0;

  GlobalKey bottomNavigationKey = GlobalKey();
  PageStorageBucket pageStorage = PageStorageBucket();

  List<TabItem> tabItems = [
    const TabItem(
      icon: AssetImage("assets/icon/icon-home.png"),
    ),

    const TabItem(
      icon: AssetImage("assets/icon/icon-menu.png"),
    ),

    const TabItem(
      icon: AssetImage("assets/icon/icon-order.png"),
    ),
    const TabItem(
      icon: AssetImage("assets/icon/icon-profile.png"),
    ),

  ];


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeDefaultRoute(),
        CategoriesDefaultRoute(),
        CartDefaultRoute(),
        ProfileDefaultRoute(),
      ],
      backgroundColor: AppThemeMode.thirdColor,
      bottomNavigationBuilder: (BuildContext context, TabsRouter tabsRouter) {
        return BottomBarInspiredOutside(iconSize: 34, elevation: 10,
          items: tabItems, color: AppThemeMode.thirdColor,
          backgroundColor: AppThemeMode.secondaryColor,
          colorSelected: AppThemeMode.thirdColor,
          chipStyle: const ChipStyle(
            background: AppThemeMode.primaryColor,
            notchSmoothness: NotchSmoothness.softEdge,
          ),
          indexSelected: tabsRouter.activeIndex,
          onTap: (index) {

            tabsRouter.setActiveIndex(index);
            tabsRouter.stackRouterOfIndex(index)?.popTop();

          },
          itemStyle: ItemStyle.circle, sizeInside: 56, top: -45, height: 40,
          countStyle: const CountStyle(background: AppThemeMode.textTitleRedColor),
        );
      },
    );
  }
}
