import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/config/utils/utils.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/screen/screen_auth/bloc/bloc_user.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/bloc/bloc_cart.dart';
import 'package:hunger_meal/screen/screen_home/page/profile/widget/item_profile_settings.dart';
import 'package:injectable/injectable.dart';

@RoutePage()
class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {

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
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: const AutoSizeText('Profile',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: 14, right: 14, bottom: 32
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                StreamBuilder<DataState<ProfileData?>>(
                    stream: injector<BlocUser>().getProfileService(userData?.id),
                    builder: (context, snapshot) {
                      if(snapshot.data is DataSuccess){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(radius: 22,
                                backgroundImage: AssetImage('assets/user-profile.png'),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText('${snapshot.data?.data?.username}'.capitalizeAllWords(),
                                      style: const TextStyle(color: AppThemeMode.primaryColor,
                                          fontSize: 16, fontWeight: FontWeight.w800),),
                                    AutoSizeText('${snapshot.data?.data?.email}',
                                      style: const TextStyle(color: AppThemeMode.primaryColor,
                                          fontSize: 12, fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () => context.router.navigate(const EditProfileRoute()),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: AppThemeMode.secondaryColor,
                                      borderRadius: BorderRadius.circular(24)
                                  ),
                                  child: const Text('Edit Profile',
                                    style: TextStyle(color: AppThemeMode.thirdColor,
                                        fontSize: 12, fontWeight: FontWeight.w400),),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(radius: 22,
                            backgroundImage: AssetImage('assets/user-profile.png'),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText('${userData?.username}'.capitalizeAllWords(),
                                  style: const TextStyle(color: AppThemeMode.primaryColor,
                                      fontSize: 16, fontWeight: FontWeight.w800),),
                                Text('${userData?.email}',
                                  style: const TextStyle(color: AppThemeMode.primaryColor,
                                      fontSize: 12, fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => context.router.navigate(const EditProfileRoute()),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: AppThemeMode.secondaryColor,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: const AutoSizeText('Edit Profile',
                                style: TextStyle(color: AppThemeMode.thirdColor,
                                    fontSize: 12, fontWeight: FontWeight.w400),),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),

                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: AutoSizeText('Settings',
                    style: TextStyle(color: AppThemeMode.secondaryColor,
                        fontSize: 20, fontWeight: FontWeight.w600),),
                ),

                const ItemProfileSettings(title: 'Change Phone', image: 'assets/profile/call.png',),
                const ItemProfileSettings(title: 'Language', image: 'assets/profile/globe.png',),
                const ItemProfileSettings(title: 'Notification', image: 'assets/profile/notification.png',),


                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: AutoSizeText('About Us',
                    style: TextStyle(color: AppThemeMode.secondaryColor,
                        fontSize: 20, fontWeight: FontWeight.w600),),
                ),

                const ItemProfileSettings(title: 'FAQ', image: 'assets/profile/help.png',),
                const ItemProfileSettings(title: 'Privacy Policy', image: 'assets/profile/security.png',),
                const ItemProfileSettings(title: 'Contact Us', image: 'assets/profile/team.png',),


                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: AutoSizeText('Other',
                    style: TextStyle(color: AppThemeMode.secondaryColor,
                        fontSize: 20, fontWeight: FontWeight.w600),),
                ),

                ItemProfileSettings(title: 'Get The Last Version', image: 'assets/profile/mobile.png',
                  voidCallback: () {

                  },
                ),

                ItemProfileSettings(title: 'Log out', image: 'assets/profile/share.png',
                  voidCallback: () {

                    injector<LocalStorageService>().logout();
                    injector.reset().then((value) async => await configureInjection(Environment.prod));
                    context.router.replace(const SplashRoute());
                  },
                ),

              ],
            ),
          )
      ),
    );
  }
}
