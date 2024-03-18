import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_auth/bloc/bloc_user.dart';
import 'package:hunger_meal/screen/screen_auth/widget/alert_dialog_permission.dart';
import 'package:hunger_meal/widget/field_action_button.dart';
import 'package:phone_number_text_field/phone_number_text_field.dart';

@RoutePage()
class ZoneChoiceScreen extends StatefulWidget {

  final PhoneNumber? phoneNumber;
  final int? userId;
  final String? userName;
  final String? userEmail;

  const ZoneChoiceScreen({super.key, this.phoneNumber, this.userId, this.userName, this.userEmail});

  @override
  State<ZoneChoiceScreen> createState() => _ZoneChoiceScreenState();
}

class _ZoneChoiceScreenState extends State<ZoneChoiceScreen> {


  void onButtonClick(BuildContext context, int? zone) async {
    showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(
      child: SpinKitCircle(size: 75, color: AppThemeMode.thirdColor,),));
    injector<BlocUser>().setInfoService(
        InfoParams(
          username: widget.userName ?? 'Unknown user',
          email: widget.userEmail ?? 'unknown.user@gmail.com',
          id: widget.userId,
          zoneId: zone,
    )).forEach((element) {
      Navigator.of(context, rootNavigator: true).pop();
      if(element.data != null){
        context.router.replace(const HomeRoute());
      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeMode.thirdColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const AutoSizeText('Governorates', style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
        ),
        child: StreamBuilder<DataState<List<ZoneAddressData>?>>(
            stream: injector<BlocUser>().getZonesService(),
            builder: (context, snapshot) {
              if(snapshot.data is DataSuccess){
                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      top: 130
                    ),
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () => onButtonClick(context, snapshot.data?.data?.elementAt(index).id),
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 8, left: 10, right: 10
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12
                          ),
                          decoration: BoxDecoration(
                              color: AppThemeMode.containerFieldColor,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: AutoSizeText('${snapshot.data?.data?.elementAt(index).name}',
                            style: const TextStyle(fontSize: 18,
                              color: AppThemeMode.textColorBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    });
              }
              return const SizedBox();
          }
        ),
      ),
    );
  }

}
