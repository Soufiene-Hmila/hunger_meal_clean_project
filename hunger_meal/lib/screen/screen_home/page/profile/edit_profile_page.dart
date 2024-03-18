import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/utils/string_type_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldNickNameKey = GlobalKey<FormState>();

  GlobalKey<FormState> formFieldNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldEmailKey = GlobalKey<FormState>();
  GlobalKey<FormState> formFieldNumberKey = GlobalKey<FormState>();


  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController nameTextEditingController = TextEditingController();
  final TextEditingController phoneNumberTextEditingController = TextEditingController();


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
          title: const AutoSizeText('Edit Profile',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  margin: const EdgeInsets.only(
                      top: 32
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                      style: AppThemeMode.elevatedButtonStyle,
                      child: const Text('Save Changes',
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 22)),
                      onPressed: (){

                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
