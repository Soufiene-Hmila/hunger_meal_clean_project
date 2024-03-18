import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hunger_meal/config/routes/custom_auto_router_observer.dart';
import 'package:hunger_meal/config/routes/routes.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/injection.dart';
import 'package:hunger_meal/widget/custom_scroll_behavior.dart';
import 'package:injectable/injectable.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key,}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {

  Key keyedSubtree = UniqueKey();
  final appRouter = injector<AppRouter>();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: KeyedSubtree(key: keyedSubtree,
        child: MaterialApp.router(
          title: Constant.kMaterialAppTitle,
          locale: const Locale('en', ''),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            /// AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', ''),
            Locale('en', ''),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          scrollBehavior: CustomScrollBehavior(),
          theme: AppThemeMode.light, themeMode: ThemeMode.light,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(appRouter,
            navigatorObservers: () => [CustomAutoRouterObserver()],
          ),
        ),
      ),
    );
  }
}

