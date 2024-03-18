import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/datasources/service/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/bloc/bloc_restaurant_order.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/widgets/item_list_orders.dart';

@RoutePage()
class PendingPage extends StatefulWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {


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
          title: const AutoSizeText('New Orders',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: StreamBuilder<DataState<List<OrderData>?>>(
            stream: injector<BlocRestaurantOrder>().getRestaurantOrdersWaitingService(userData?.id),
            builder: (context, snapshot) {
              if(snapshot.data is DataSuccess){
                return ListView.builder(
                    shrinkWrap: true, padding: EdgeInsets.zero,
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => context.router.navigate(DetailsPendingRoute(
                          orderData: snapshot.data?.data?.elementAt(index)
                      )),
                      child: ItemListOrders(
                        orderData: snapshot.data?.data?.elementAt(index),
                        index: (snapshot.data?.data?.length ?? 0) - index,
                      ),
                    )
                );
              }
              return const SizedBox();
            }
        ),
      ),
    );
  }
}
