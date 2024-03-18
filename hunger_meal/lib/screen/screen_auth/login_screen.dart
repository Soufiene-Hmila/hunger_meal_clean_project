
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/screen/screen_auth/bloc/bloc_user.dart';
import 'package:hunger_meal/widget/icon_action_button.dart';
import 'package:intl/intl.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/widget/default_action_button.dart';
import 'package:hunger_meal/widget/radio_button.dart';
import 'package:hunger_meal/widget/toggle_button.dart';
import 'package:phone_number_text_field/phone_number_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


@RoutePage()
class LoginScreen extends StatefulWidget {
  final PhoneNumber? phoneNumber;
  const LoginScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  bool hidePassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey<FormState> formFieldNumberKey = GlobalKey<FormState>();

  TextEditingController phoneNumberTextEditingController = TextEditingController();

  bool isLoadingProgress = false;
  bool isCheckCondition = false;

  late PhoneNumber phoneNumber;

  void onButtonClick(BuildContext context) async {
    showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(
      child: SpinKitCircle(size: 75, color: AppThemeMode.thirdColor,),));

    injector<BlocUser>().setPhoneService(PhoneParams(
      mobile: '${phoneNumber.phoneNumber}',)
    ).forEach((element) {
      Navigator.of(context, rootNavigator: true).pop();
      if(element.data != null){
        context.router.replace(CodePinRoute(
            phoneNumber: phoneNumber, verificationCode: "${element.data?.code}"
        ));
      } else {

      }
    });
  }

  @override
  void initState() {
    phoneNumber = widget.phoneNumber ?? PhoneNumber(isoCode: 'TN');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeMode.thirdColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 24
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/hunger-icon.png", height: 156,),
                        const AutoSizeText('DroOl Over', style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 4,),
                        const AutoSizeText('Use your phone number to log in',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: InternationalPhoneNumberInput(
                      key: formFieldNumberKey,
                      onInputChanged: (PhoneNumber number) {
                        phoneNumber = number;
                        debugPrint("Phone Number : ${number.phoneNumber}");
                      },
                      countries: const ['TN'],
                      selectorConfig: const SelectorConfig(
                        setSelectorButtonAsPrefixIcon: true, leadingPadding: 15,
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: true, autoValidateMode: AutovalidateMode.always,
                      selectorTextStyle: const TextStyle(color: AppThemeMode.textColorBlack,),
                      initialValue: phoneNumber, textFieldController: phoneNumberTextEditingController,
                      textStyle: const TextStyle(color: AppThemeMode.textColorBlack, wordSpacing: 12),
                      inputDecoration: InputDecoration(
                        filled: true, fillColor: AppThemeMode.containerFieldColor,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                        border: InputBorder.none, hintText: "00 000 000",
                        hintStyle: const TextStyle(color: AppThemeMode.textColorBlack, wordSpacing: 12),
                        focusedBorder: AppThemeMode.greyOutlineInputBorder,
                        enabledBorder: AppThemeMode.greyOutlineInputBorder,
                        disabledBorder: AppThemeMode.greyOutlineInputBorder,
                        errorBorder: AppThemeMode.greyOutlineInputBorder,
                        focusedErrorBorder: AppThemeMode.greyOutlineInputBorder,
                        errorStyle: const TextStyle(fontSize: 7.5),
                        prefixIcon: const Icon(Icons.phone,
                          size: 20, color: AppThemeMode.primaryColor,),
                      ),
                    ),
                  ),

                  DefaultActionButton(
                    isLoading: isLoadingProgress,
                    colorButton: AppThemeMode.secondaryColor,
                    textColor: AppThemeMode.thirdColor,
                    textButton: "Login",
                    onClickCallback: () {
                      onButtonClick(context);
                    },
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 24, top: 32
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const AutoSizeText("or Login With", textAlign: TextAlign.center,
                      style: TextStyle(color: AppThemeMode.textColorBlack, fontSize: 16),),
                  ),

                  IconActionButton(
                    colorButton: const Color(0xFF367FC0),
                    iconButton: 'assets/facebook-letter-logo.png',
                    textButton: "Login with Facebook",
                    onClickCallback: () {

                    },
                  ),

                  IconActionButton(
                    colorButton: const Color(0xFFDD4B39),
                    iconButton: 'assets/google-plus-logo.png',
                    textButton: "Login with Google",
                    onClickCallback: () {

                    },
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 32, bottom: 20
                  //   ),
                  //   child: RichText(
                  //     text: TextSpan(text: "Don't have an Account?",
                  //         style: const TextStyle(color: AppThemeMode.textColorBlack, fontSize: 14),
                  //         children: <TextSpan>[
                  //           TextSpan(text: " Sign Up", style: const TextStyle(
                  //               color: AppThemeMode.primaryColor, fontSize: 14),
                  //             recognizer: TapGestureRecognizer()..onTap = () {
                  //               injector<AppRouter>().replace(const CodePinRoute());
                  //             },
                  //           )
                  //         ]
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 32,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
