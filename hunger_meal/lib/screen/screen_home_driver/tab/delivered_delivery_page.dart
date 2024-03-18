import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home_driver/bloc/bloc_driver_order.dart';
import 'package:hunger_meal/screen/screen_home_driver/widgets/item_list_delivery_orders.dart';

class DeliveredDeliveryPage extends StatefulWidget {
  const DeliveredDeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveredDeliveryPage> createState() => _DeliveredDeliveryPageState();
}

class _DeliveredDeliveryPageState extends State<DeliveredDeliveryPage> {


  UserData? userData;

  @override
  void initState() {
    userData = injector<LocalStorageService>().userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<List<OrderData>?>>(
        stream: injector<BlocDriverOrder>().getDriverOrdersDeliveredService(userData?.id),
        builder: (context, snapshot) {
          if(snapshot.data is DataSuccess){
            return ListView.builder(
                shrinkWrap: true, padding: EdgeInsets.zero,
                itemCount: snapshot.data?.data?.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => context.router.navigate(DetailsDeliveryRoute(
                      orderData: snapshot.data?.data?.elementAt(index)
                  )),
                  child: ItemListDeliveryOrders(
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
