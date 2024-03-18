import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';

class ItemListDeliveryOrders extends StatelessWidget {

  final int index;
  final OrderData? orderData;
  const ItemListDeliveryOrders({Key? key, this.orderData, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12, vertical: 16
      ),
      margin: const EdgeInsets.symmetric(
          vertical: 4, horizontal: 8
      ),
      decoration: BoxDecoration(
        color: AppThemeMode.containerFieldColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 12.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(minRadius: 22,
                  backgroundImage: AssetImage('assets/user-profile.png'),
                ),
                const SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('${orderData?.reference}', textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.clock_solid, size: 18,),
                          const SizedBox(width: 8,),
                          AutoSizeText('${orderData?.createdAt}'.formatDate(), textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 8,),
                          const Icon(CupertinoIcons.person_solid, size: 18,),
                          const SizedBox(width: 8,),
                          AutoSizeText('${orderData?.client?.username}', textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.phone_fill, size: 18,),
                          const SizedBox(width: 8,),
                          AutoSizeText('${orderData?.clientPhone}'.formatPhoneNumber(), textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 8,),
                          const Icon(CupertinoIcons.location_solid, size: 18,),
                          const SizedBox(width: 8,),
                          AutoSizeText('${orderData?.clientLocation}', textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText('${orderData?.totalPrice} TND', textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppThemeMode.textColorBlack),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
