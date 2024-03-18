import 'package:auto_size_text/auto_size_text.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home_driver/tab/accept_delivery_page.dart';
import 'package:hunger_meal/screen/screen_home_driver/tab/delivered_delivery_page.dart';
import 'package:hunger_meal/screen/screen_home_driver/tab/pending_delivery_page.dart';
import 'package:hunger_meal/screen/screen_home_driver/tab/rejected_delivery_page.dart';
import 'package:injectable/injectable.dart';


@RoutePage()
class HomeDriverScreen extends StatefulWidget {
  const HomeDriverScreen({super.key});

  @override
  State<HomeDriverScreen> createState() => _HomeDriverScreenState();
}

class _HomeDriverScreenState extends State<HomeDriverScreen>  with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

                    AutoSizeText('Hello, Driver', textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),

                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: AutoSizeText('Delivery for Today', textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),

                  ],
                ),

                InkWell(
                  onTap: () {
                    context.router.navigate(ProfileDriverRoute(
                      voidCallback: () {
                        injector<LocalStorageService>().logout();
                        injector.reset().then((value) async => await configureInjection(Environment.prod));
                        context.router.replace(const SplashRoute());
                      }
                    ));
                  },
                  child: const CircleAvatar(radius: 18,
                    backgroundColor: AppThemeMode.primaryColor,
                    backgroundImage: AssetImage('assets/user-profile.png'),
                  ),
                )
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
                    Tab(text: 'Waiting'),
                    Tab(text: 'In progress'),
                    Tab(text: 'Delivered'),
                    Tab(text: 'Rejected'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    PendingDeliveryPage(),
                    AcceptDeliveryPage(),
                    DeliveredDeliveryPage(),
                    RejectedDeliveryPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
