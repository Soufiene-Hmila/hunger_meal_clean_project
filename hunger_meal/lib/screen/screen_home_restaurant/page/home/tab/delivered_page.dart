import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:data/datasources/service/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/bloc/bloc_restaurant_order.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/widgets/item_list_orders.dart';

class DeliveredPage extends StatefulWidget {
  const DeliveredPage({Key? key}) : super(key: key);

  @override
  State<DeliveredPage> createState() => _DeliveredPageState();
}

class _DeliveredPageState extends State<DeliveredPage> {


  UserData? userData;

  @override
  void initState() {
    userData = injector<LocalStorageService>().userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<List<OrderData>?>>(
        stream: injector<BlocRestaurantOrder>().getRestaurantOrdersDeliveredService(userData?.id),
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
    );
  }
}
