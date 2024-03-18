
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_auth/bloc/bloc_user.dart';
import 'package:hunger_meal/widget/default_action_button.dart';
import 'package:hunger_meal/widget/timer_controller.dart';
import 'package:hunger_meal/widget/timer_count_down.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_number_text_field/phone_number_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class CodePinScreen extends StatefulWidget {

  final String? verificationCode;
  final PhoneNumber? phoneNumber;
  const CodePinScreen({Key? key, this.phoneNumber, this.verificationCode}) : super(key: key);

  @override
  CodePinScreenState createState() => CodePinScreenState();
}

class CodePinScreenState extends State<CodePinScreen> {

  late PhoneNumber phoneNumber = PhoneNumber(isoCode: 'TN');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldPinKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  void onButtonClick(BuildContext context) async {
    showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(
      child: SpinKitCircle(size: 75, color: AppThemeMode.thirdColor,),));
    injector<BlocUser>().setVerificationService(VerificationParams(
        mobile: '${widget.phoneNumber?.phoneNumber}',
        code: textEditingController.text.trim()
      )
    ).forEach((element) {
      Navigator.of(context, rootNavigator: true).pop();
      if(element.data != null){

        injector<LocalStorageService>().setIsUserLoggedIn();
        injector<LocalStorageService>().setUser(element.data?.user);
        injector<LocalStorageService>().setUserToken("${element.data?.accessToken}");
        injector.reset().then((value) async => await configureInjection(Environment.prod));

        if((element.data?.user?.zoneId == null) && ![3, 4].contains(element.data?.role)){

          context.router.replace(RegisterRoute(userData: element.data?.user));

        } else {

          switch(element.data?.role) {
            case 3:
              context.router.replace(const HomeRestaurantRoute());
              break;
            case 4:
              context.router.replace(const HomeDriverRoute());
              break;
            default: context.router.replace(const HomeRoute());
          }
        }
      } else {

      }
    });
  }

  bool isLoadingProgress = false;
  bool isEnable = true;

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().subtract(const Duration(minutes: 2));

  CountdownController countdownController = CountdownController();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();


  String formatTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  String? verificationCode;

  @override
  void initState() {
    verificationCode = widget.verificationCode;
    /// "${widget.phoneNumber?.phoneNumber}".contains('56500757') &&
    if(widget.verificationCode != null) {
      textEditingController.text = verificationCode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, bottom: false,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 24, top: 80
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/hunger-icon.png", height: 120,),
                        const AutoSizeText('DroOl Over', style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 4,),
                        const AutoSizeText('Food Delivery',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 32,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: RichText(textAlign: TextAlign.center,
                      text: TextSpan(text: "We have sent the code verification to your number ",
                          style: const TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w400, color: AppThemeMode.textColorBlack,),
                          children: <TextSpan>[
                            TextSpan(text: "${widget.phoneNumber?.phoneNumber}".formatPhoneNumber(),
                              style: const TextStyle(color: AppThemeMode.textColorBlack,
                                  fontSize: 18, fontWeight: FontWeight.w600, height: 2,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: PinCodeTextField(appContext: context,
                        length: 6, obscureText: false, key: formFieldPinKey,
                        dialogConfig: DialogConfig(),
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        textStyle: const TextStyle(color: AppThemeMode.primaryColor),
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box, borderWidth: 0.5,
                            borderRadius: BorderRadius.circular(8),
                            activeColor: AppThemeMode.primaryColor,
                            activeFillColor: AppThemeMode.containerFieldColor,
                            selectedColor: AppThemeMode.primaryColor,
                            selectedFillColor: AppThemeMode.primaryColor.withOpacity(0.7),
                            disabledColor: AppThemeMode.containerFieldColor,
                            inactiveColor: AppThemeMode.containerFieldColor,
                            inactiveFillColor: AppThemeMode.containerFieldColor,
                            fieldHeight: MediaQuery.of(context).size.width * 0.12,
                            fieldWidth: MediaQuery.of(context).size.width * 0.12,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (value) {
                        if(value.contains('$verificationCode')){
                          setState(() => isEnable = true);
                        }
                        },
                        onChanged: (value) => debugPrint(value),
                        beforeTextPaste: (text) => true,
                      )
                  ),

                  Countdown(
                    seconds: 120,
                    controller: countdownController,
                    interval: const Duration(milliseconds: 100),
                    build: (_, double time) {
                      if (time == 0 || time == 120) {
                        return const Text('', style: TextStyle(color: AppThemeMode.primaryColor, fontSize: 14));
                      } else {
                        return Text(formatTime(timeInSecond: time.toInt()),
                            style: const TextStyle(color: AppThemeMode.primaryColor,
                                fontSize: 14, fontWeight: FontWeight.w600));
                      }
                    },
                    onFinished: () {
                      setState(() => isEnable = true);
                    },
                  ),

                  DefaultActionButton(
                    isClickable: isEnable,
                    isLoading: isLoadingProgress,
                    colorButton: AppThemeMode.secondaryColor,
                    textColor: AppThemeMode.thirdColor,
                    textButton: "Verification",
                    onClickCallback: () => onButtonClick(context),
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 32, bottom: 32,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RichText(textAlign: TextAlign.center,
                      text: TextSpan(text: "Did’t receive the code? ",
                          style: const TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w400, color: AppThemeMode.textColorBlack,),
                          children: <TextSpan>[
                            TextSpan(text: "Resend",
                              style: const TextStyle(color: AppThemeMode.primaryColor,
                                  fontSize: 16, decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                countdownController.restart();
                                injector<BlocUser>().setResetVerificationService(
                                    PhoneParams(mobile: '${widget.phoneNumber?.phoneNumber}',)
                                ).forEach((element) {
                                  setState(() => isEnable = false);
                                  if(element.data?.code != null){
                                    setState(() => verificationCode = "${element.data?.code}");
                                  }
                                });
                              },
                            ),
                          ]
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
