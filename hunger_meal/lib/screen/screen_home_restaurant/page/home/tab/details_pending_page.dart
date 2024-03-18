import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/bloc/bloc_restaurant_order.dart';
import 'package:hunger_meal/widget/default_action_button.dart';

@RoutePage()
class DetailsPendingPage extends StatefulWidget {

  final OrderData? orderData;
  const DetailsPendingPage({super.key, this.orderData});

  @override
  State<DetailsPendingPage> createState() => _DetailsPendingPageState();
}

class _DetailsPendingPageState extends State<DetailsPendingPage> {

  OrderData? orderData;

  @override
  void initState() {
    orderData = widget.orderData;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<OrderData?>>(
        stream: injector<BlocRestaurantOrder>().getRestaurantOrderService(orderData?.id),
        builder: (context, snapshot) {
          if(snapshot.data is DataSuccess){
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(fit: BoxFit.fill,
                    image: AssetImage("assets/background.png"), opacity: 0.56),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(centerTitle: true,
                  backgroundColor: Colors.transparent,
                  title: AutoSizeText('${snapshot.data?.data?.reference}',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12
                        ),
                        decoration: BoxDecoration(
                            color: AppThemeMode.containerFieldColor,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(minRadius: 18,
                              backgroundImage: AssetImage('assets/user-profile.png'),
                            ),
                            const SizedBox(width: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('${snapshot.data?.data?.client?.username}', textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0,),
                                  child: Row(
                                    children: [
                                      const Icon(CupertinoIcons.phone_fill, size: 14,),
                                      const SizedBox(width: 8,),
                                      Text('${snapshot.data?.data?.clientPhone}'.formatPhoneNumber(), textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(width: 8,),
                                      const Icon(CupertinoIcons.location_solid, size: 14,),
                                      const SizedBox(width: 8,),
                                      Text(snapshot.data?.data?.clientLocation != null
                                          ? '${snapshot.data?.data?.clientLocation}'
                                          : snapshot.data?.data?.client?.address != null
                                          ? '${snapshot.data?.data?.client?.address}'
                                          : 'unknown', textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(CupertinoIcons.clock_solid, size: 14,),
                                      const SizedBox(width: 8,),
                                      Text('${snapshot.data?.data?.createdAt}'.formatDate(), textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ListView.builder(shrinkWrap: true,
                          itemCount: snapshot.data?.data?.meals?.length,
                          padding: const EdgeInsets.only(
                              top: 16
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 12, right: 12
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(width: 45, height: 45,
                                    margin: const EdgeInsets.only(
                                        bottom: 8, left: 4, right: 4
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.cover,
                                            image: NetworkImage('${Constant.kImageBaseUrl}'
                                                '/${snapshot.data?.data?.meals?.elementAt(index).image}')),
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

                                        AutoSizeText('${snapshot.data?.data?.meals?.elementAt(index).pivot?.quantity}'
                                            ' X ${snapshot.data?.data?.meals?.elementAt(index).name}',
                                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),

                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          width: MediaQuery.of(context).size.width * 0.56,
                                          child: Wrap(
                                            spacing: 6.0,
                                            runSpacing: 6.0,
                                            children: (snapshot.data?.data?.meals?.elementAt(index).orderSupplements??[]).map((suplmt) {
                                              return Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                                decoration: BoxDecoration(
                                                    color: AppThemeMode.containerFieldColor,
                                                    borderRadius: BorderRadius.circular(24)
                                                ),
                                                child: AutoSizeText('${suplmt.name}',
                                                  style: const TextStyle(fontSize: 12),),
                                              );
                                            }).toList(),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),


                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 10, left: 12, right: 12,
                        ),
                        child: Column(
                          children: [
                            const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 14, bottom: 14
                                  ),
                                  child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 14
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const AutoSizeText('Sub Total',
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                  AutoSizeText('${snapshot.data?.data?.price} DT', style: const TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.primaryColor),),

                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AutoSizeText('Delivery Cost',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),

                                    AutoSizeText('${snapshot.data?.data?.shippingCost} DT', style: const TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.primaryColor),),

                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 14, bottom: 14
                                  ),
                                  child: Divider(indent: 4, endIndent: 4, thickness: 0.1,),
                                )
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const AutoSizeText('Total',
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),

                                  AutoSizeText('${snapshot.data?.data?.totalPrice} DT', style: const TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16, color: AppThemeMode.primaryColor),),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Visibility(
                        visible: ['waiting', 'accept', 'inProgress',].contains(snapshot.data?.data?.stateRestaurant),
                        child: DefaultActionButton(
                          isLoading: false,
                          colorButton: AppThemeMode.secondaryColor,
                          textColor: AppThemeMode.thirdColor,
                          textButton: "${snapshot.data?.data?.stateRestaurant?.getRestaurantState()}",
                          onClickCallback: () {
                            showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(
                              child: SpinKitCircle(size: 75, color: AppThemeMode.thirdColor,),));
                            injector<BlocRestaurantOrder>().setStatusRestaurantOrderService(
                                StateOrderParams(
                                    id: snapshot.data?.data?.id,
                                    state: snapshot.data?.data?.stateRestaurant?.setRestaurantState()
                                )
                            ).forEach((element) {
                              Navigator.of(context, rootNavigator: true).pop();
                              setState(() {

                              });
                            });

                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
      }
    );
  }
}
