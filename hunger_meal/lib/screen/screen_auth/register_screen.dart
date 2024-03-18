
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/datasources/service/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hunger_meal/screen/screen_auth/bloc/bloc_user.dart';
import 'package:intl/intl.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/widget/default_action_button.dart';
import 'package:hunger_meal/widget/radio_button.dart';
import 'package:hunger_meal/widget/toggle_button.dart';
import 'package:phone_number_text_field/phone_number_text_field.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {

  final PhoneNumber? phoneNumber;
  final UserData? userData;
  const RegisterScreen({Key? key, this.phoneNumber, this.userData}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {

  bool hidePassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldNickNameKey = GlobalKey<FormState>();

  GlobalKey<FormState> formFieldNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldEmailKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldNumberKey = GlobalKey<FormState>();


  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController phoneNumberTextEditingController = TextEditingController();

  late PhoneNumber phoneNumber;

  @override
  void initState() {
    phoneNumber = widget.phoneNumber ?? PhoneNumber(isoCode: 'TN');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppThemeMode.thirdColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: (){
                context.router.push(
                    ZoneChoiceRoute(
                        userId: widget.userData?.id
                    )
                );
              },
              child: const AutoSizeText('Skip',
                style: TextStyle(fontSize: 20,
                    color: AppThemeMode.secondaryColor,
                    fontWeight: FontWeight.w500),))
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
        ),

        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 24, top: 120
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/hunger-icon.png", height: 65,),
                          const AutoSizeText('DroOl Over', style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 4,),
                          const AutoSizeText('Food Delivery',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(maxLines: 1,
                        keyboardType: TextInputType.name, key: formFieldNickNameKey,
                        style: const TextStyle(color: AppThemeMode.textColorBlack),
                        decoration: InputDecoration(
                            filled: true, fillColor: AppThemeMode.containerFieldColor,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none, hintText: "Full Name",
                            hintStyle: const TextStyle(color: AppThemeMode.textColorBlack),
                            focusedBorder: AppThemeMode.greyOutlineInputBorder,
                            enabledBorder: AppThemeMode.greyOutlineInputBorder,
                            errorBorder: AppThemeMode.greyOutlineInputBorder,
                            focusedErrorBorder: AppThemeMode.greyOutlineInputBorder,
                            errorStyle: const TextStyle(fontSize: 7.5),
                          prefixIcon: const Icon(Icons.person_3_rounded,
                            size: 20, color: AppThemeMode.primaryColor,),
                        ),
                        controller: nameTextEditingController,
                        validator: (v) {
                          if (v!.isNotEmpty) {
                            return null;
                          } else {
                            return '*Please enter a valid name';
                          }
                        },
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(maxLines: 1, key: formFieldEmailKey,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: AppThemeMode.textColorBlack),
                        decoration: InputDecoration(
                            filled: true, fillColor: AppThemeMode.containerFieldColor,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                          border: InputBorder.none, hintText: "E-mail",
                          hintStyle: const TextStyle(color: AppThemeMode.textColorBlack),
                          focusedBorder: AppThemeMode.greyOutlineInputBorder,
                          enabledBorder: AppThemeMode.greyOutlineInputBorder,
                          errorBorder: AppThemeMode.greyOutlineInputBorder,
                          focusedErrorBorder: AppThemeMode.greyOutlineInputBorder,
                          errorStyle: const TextStyle(fontSize: 7.5),
                          prefixIcon: const Icon(Icons.email_rounded,
                            size: 20, color: AppThemeMode.primaryColor,),
                        ),
                        controller: emailTextEditingController,
                        validator: (v) {
                          if (v!.isValidEmail) {
                            return null;
                          } else {
                            return '*Please enter a valid email';
                          }
                        },
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 15, top: 32,),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ToggleButton(
                          //   initValue: isCheckCondition,
                          //   onClick: (bool isEnable) {
                          //     setState(() => isCheckCondition = !isCheckCondition);
                          //   },),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: const AutoSizeText("By Signing Up, you agree to the terms of service & privacy policy", style: TextStyle(
                                  color: AppThemeMode.textColorBlack, fontSize: 14),),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(top: 35, bottom: 35),
                    child:  DefaultActionButton(isLoading: false,
                      colorButton: AppThemeMode.secondaryColor,
                      textColor: AppThemeMode.thirdColor,
                      textButton: "Next",
                      onClickCallback: () => context.router.push(
                          ZoneChoiceRoute(
                              userEmail: emailTextEditingController.text,
                              userName: nameTextEditingController.text,
                              userId: widget.userData?.id
                          )
                      ),),),
              ),
            )
          ],
        ),
      ),
    );
  }

}
