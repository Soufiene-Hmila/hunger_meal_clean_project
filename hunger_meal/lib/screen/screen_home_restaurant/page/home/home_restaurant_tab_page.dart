import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/tab/accept_page.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/tab/delivered_page.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/tab/pending_page.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/tab/rejected_page.dart';


@RoutePage()
class HomeRestaurantTabPage extends StatefulWidget {
  const HomeRestaurantTabPage({super.key});

  @override
  State<HomeRestaurantTabPage> createState() => _HomeRestaurantTabPageState();
}

class _HomeRestaurantTabPageState extends State<HomeRestaurantTabPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          toolbarHeight: 80, centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  AutoSizeText('Hello, Plan B', textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),

                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: AutoSizeText('Orders for Today', textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),

                ],
              ),
              InkWell(
                onTap: () => context.router.navigate(const PendingRoute()),
                  child: const Icon(CupertinoIcons.bell_solid, color: AppThemeMode.primaryColor, size: 28,))
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 6
              ),
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelColor: AppThemeMode.primaryColor,
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16
                ),
                indicator: const BoxDecoration(),
                tabs: const [
                  Tab(text: 'Accepted'),
                  Tab(text: 'In progress'),
                  Tab(text: 'Delivered'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const AcceptPage(),
                  Container(),
                  const DeliveredPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
