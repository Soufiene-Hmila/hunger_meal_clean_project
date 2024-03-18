// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i42;
import 'package:domain/domain.dart' as _i44;
import 'package:flutter/cupertino.dart' as _i43;
import 'package:flutter/material.dart' as _i45;
import 'package:hunger_meal/screen/screen_auth/choice_screen.dart' as _i12;
import 'package:hunger_meal/screen/screen_auth/code_pin_screen.dart' as _i11;
import 'package:hunger_meal/screen/screen_auth/limited_map_screen.dart' as _i13;
import 'package:hunger_meal/screen/screen_auth/location_picker_screen.dart'
    as _i6;
import 'package:hunger_meal/screen/screen_auth/location_setting_screen.dart'
    as _i7;
import 'package:hunger_meal/screen/screen_auth/login_screen.dart' as _i10;
import 'package:hunger_meal/screen/screen_auth/register_screen.dart' as _i9;
import 'package:hunger_meal/screen/screen_auth/zone_choice_screen.dart' as _i8;
import 'package:hunger_meal/screen/screen_home/home_screen.dart' as _i30;
import 'package:hunger_meal/screen/screen_home/intro_screen.dart' as _i31;
import 'package:hunger_meal/screen/screen_home/page/cart/cart_default_page.dart'
    as _i24;
import 'package:hunger_meal/screen/screen_home/page/cart/cart_tab_page.dart'
    as _i23;
import 'package:hunger_meal/screen/screen_home/page/categories/categories_default_page.dart'
    as _i26;
import 'package:hunger_meal/screen/screen_home/page/categories/categories_tab_page.dart'
    as _i25;
import 'package:hunger_meal/screen/screen_home/page/categories/details_default_page.dart'
    as _i27;
import 'package:hunger_meal/screen/screen_home/page/categories/details_meals_page.dart'
    as _i28;
import 'package:hunger_meal/screen/screen_home/page/categories/details_product_page.dart'
    as _i29;
import 'package:hunger_meal/screen/screen_home/page/home/details_popular_page.dart'
    as _i16;
import 'package:hunger_meal/screen/screen_home/page/home/details_restaurant_page.dart'
    as _i14;
import 'package:hunger_meal/screen/screen_home/page/home/details_restaurants_page.dart'
    as _i15;
import 'package:hunger_meal/screen/screen_home/page/home/home_tab_page.dart'
    as _i17;
import 'package:hunger_meal/screen/screen_home/page/more/more_default_page.dart'
    as _i19;
import 'package:hunger_meal/screen/screen_home/page/more/more_tab_page.dart'
    as _i18;
import 'package:hunger_meal/screen/screen_home/page/profile/edit_profile_page.dart'
    as _i20;
import 'package:hunger_meal/screen/screen_home/page/profile/profile_default_page.dart'
    as _i21;
import 'package:hunger_meal/screen/screen_home/page/profile/profile_tab_page.dart'
    as _i22;
import 'package:hunger_meal/screen/screen_home/splash_screen.dart' as _i32;
import 'package:hunger_meal/screen/screen_home_driver/home_driver_screen.dart'
    as _i4;
import 'package:hunger_meal/screen/screen_home_driver/profile_driver_page.dart'
    as _i5;
import 'package:hunger_meal/screen/screen_home_driver/tab/details_delivery_page.dart'
    as _i2;
import 'package:hunger_meal/screen/screen_home_restaurant/home_restaurnt_screen.dart'
    as _i41;
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/home_default_page.dart'
    as _i3;
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/home_restaurant_tab_page.dart'
    as _i35;
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/tab/details_pending_page.dart'
    as _i34;
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/tab/pending_page.dart'
    as _i33;
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/details_menu_page.dart'
    as _i39;
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/menu_default_page.dart'
    as _i38;
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/menu_tab_page.dart'
    as _i40;
import 'package:hunger_meal/screen/screen_home_restaurant/page/restaurant/restaurant_default_page.dart'
    as _i36;
import 'package:hunger_meal/screen/screen_home_restaurant/page/restaurant/restaurant_tab_page.dart'
    as _i37;
import 'package:hunger_meal/src/map/open_street_map_search_and_pick.dart'
    as _i46;
import 'package:hunger_meal/widget/default_page_router.dart' as _i1;
import 'package:phone_number_text_field/phone_number_text_field.dart' as _i47;

abstract class $AppRouter extends _i42.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i42.PageFactory> pagesMap = {
    DefaultRouteRouter.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DefaultPageRouter(),
      );
    },
    DetailsDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsDeliveryRouteArgs>(
          orElse: () => const DetailsDeliveryRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailsDeliveryPage(
          key: args.key,
          orderData: args.orderData,
        ),
      );
    },
    HomeDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeDefaultPage(),
      );
    },
    HomeDriverRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeDriverScreen(),
      );
    },
    ProfileDriverRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileDriverRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProfileDriverPage(
          key: args.key,
          voidCallback: args.voidCallback,
        ),
      );
    },
    LocationPickerRoute.name: (routeData) {
      final args = routeData.argsAs<LocationPickerRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LocationPickerScreen(
          key: args.key,
          navigatorSource: args.navigatorSource,
          voidCallback: args.voidCallback,
        ),
      );
    },
    LocationSettingRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LocationSettingScreen(),
      );
    },
    ZoneChoiceRoute.name: (routeData) {
      final args = routeData.argsAs<ZoneChoiceRouteArgs>(
          orElse: () => const ZoneChoiceRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ZoneChoiceScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          userId: args.userId,
          userName: args.userName,
          userEmail: args.userEmail,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RegisterScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          userData: args.userData,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.LoginScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    CodePinRoute.name: (routeData) {
      final args = routeData.argsAs<CodePinRouteArgs>(
          orElse: () => const CodePinRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.CodePinScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          verificationCode: args.verificationCode,
        ),
      );
    },
    ChoiceRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ChoiceScreen(),
      );
    },
    LimitedMapRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LimitedMapScreen(),
      );
    },
    DetailsRestaurantRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRestaurantRouteArgs>(
          orElse: () => const DetailsRestaurantRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.DetailsRestaurantPage(
          key: args.key,
          restaurantData: args.restaurantData,
        ),
      );
    },
    DetailsRestaurantsRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.DetailsRestaurantsPage(),
      );
    },
    DetailsPopularRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.DetailsPopularPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.HomeTabPage(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.MoreTabPage(),
      );
    },
    MoreDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.MoreDefaultPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.EditProfilePage(),
      );
    },
    ProfileDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ProfileDefaultPage(),
      );
    },
    ProfileTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ProfileTabPage(),
      );
    },
    CartTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.CartTabPage(),
      );
    },
    CartDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.CartDefaultPage(),
      );
    },
    CategoriesTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.CategoriesTabPage(),
      );
    },
    CategoriesDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.CategoriesDefaultPage(),
      );
    },
    DetailsDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.DetailsDefaultPage(),
      );
    },
    DetailsMealsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsMealsRouteArgs>(
          orElse: () => const DetailsMealsRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.DetailsMealsPage(
          key: args.key,
          categoryData: args.categoryData,
        ),
      );
    },
    DetailsProductRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsProductRouteArgs>(
          orElse: () => const DetailsProductRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.DetailsProductPage(
          key: args.key,
          mealData: args.mealData,
          categoryData: args.categoryData,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.HomeScreen(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.IntroScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.SplashScreen(),
      );
    },
    PendingRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.PendingPage(),
      );
    },
    DetailsPendingRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsPendingRouteArgs>(
          orElse: () => const DetailsPendingRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.DetailsPendingPage(
          key: args.key,
          orderData: args.orderData,
        ),
      );
    },
    HomeRestaurantTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.HomeRestaurantTabPage(),
      );
    },
    RestaurantDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.RestaurantDefaultPage(),
      );
    },
    RestaurantTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.RestaurantTabPage(),
      );
    },
    MenuDefaultRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.MenuDefaultPage(),
      );
    },
    DetailsMenuRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsMenuRouteArgs>(
          orElse: () => const DetailsMenuRouteArgs());
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.DetailsMenuPage(
          key: args.key,
          categoryData: args.categoryData,
        ),
      );
    },
    MenuTabRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.MenuTabPage(),
      );
    },
    HomeRestaurantRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.HomeRestaurantScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DefaultPageRouter]
class DefaultRouteRouter extends _i42.PageRouteInfo<void> {
  const DefaultRouteRouter({List<_i42.PageRouteInfo>? children})
      : super(
          DefaultRouteRouter.name,
          initialChildren: children,
        );

  static const String name = 'DefaultRouteRouter';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailsDeliveryPage]
class DetailsDeliveryRoute
    extends _i42.PageRouteInfo<DetailsDeliveryRouteArgs> {
  DetailsDeliveryRoute({
    _i43.Key? key,
    _i44.OrderData? orderData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          DetailsDeliveryRoute.name,
          args: DetailsDeliveryRouteArgs(
            key: key,
            orderData: orderData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsDeliveryRoute';

  static const _i42.PageInfo<DetailsDeliveryRouteArgs> page =
      _i42.PageInfo<DetailsDeliveryRouteArgs>(name);
}

class DetailsDeliveryRouteArgs {
  const DetailsDeliveryRouteArgs({
    this.key,
    this.orderData,
  });

  final _i43.Key? key;

  final _i44.OrderData? orderData;

  @override
  String toString() {
    return 'DetailsDeliveryRouteArgs{key: $key, orderData: $orderData}';
  }
}

/// generated route for
/// [_i3.HomeDefaultPage]
class HomeDefaultRoute extends _i42.PageRouteInfo<void> {
  const HomeDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          HomeDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDriverScreen]
class HomeDriverRoute extends _i42.PageRouteInfo<void> {
  const HomeDriverRoute({List<_i42.PageRouteInfo>? children})
      : super(
          HomeDriverRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDriverRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileDriverPage]
class ProfileDriverRoute extends _i42.PageRouteInfo<ProfileDriverRouteArgs> {
  ProfileDriverRoute({
    _i45.Key? key,
    required void Function() voidCallback,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          ProfileDriverRoute.name,
          args: ProfileDriverRouteArgs(
            key: key,
            voidCallback: voidCallback,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileDriverRoute';

  static const _i42.PageInfo<ProfileDriverRouteArgs> page =
      _i42.PageInfo<ProfileDriverRouteArgs>(name);
}

class ProfileDriverRouteArgs {
  const ProfileDriverRouteArgs({
    this.key,
    required this.voidCallback,
  });

  final _i45.Key? key;

  final void Function() voidCallback;

  @override
  String toString() {
    return 'ProfileDriverRouteArgs{key: $key, voidCallback: $voidCallback}';
  }
}

/// generated route for
/// [_i6.LocationPickerScreen]
class LocationPickerRoute extends _i42.PageRouteInfo<LocationPickerRouteArgs> {
  LocationPickerRoute({
    _i45.Key? key,
    bool navigatorSource = false,
    required dynamic Function(_i46.PickedData?) voidCallback,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          LocationPickerRoute.name,
          args: LocationPickerRouteArgs(
            key: key,
            navigatorSource: navigatorSource,
            voidCallback: voidCallback,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationPickerRoute';

  static const _i42.PageInfo<LocationPickerRouteArgs> page =
      _i42.PageInfo<LocationPickerRouteArgs>(name);
}

class LocationPickerRouteArgs {
  const LocationPickerRouteArgs({
    this.key,
    this.navigatorSource = false,
    required this.voidCallback,
  });

  final _i45.Key? key;

  final bool navigatorSource;

  final dynamic Function(_i46.PickedData?) voidCallback;

  @override
  String toString() {
    return 'LocationPickerRouteArgs{key: $key, navigatorSource: $navigatorSource, voidCallback: $voidCallback}';
  }
}

/// generated route for
/// [_i7.LocationSettingScreen]
class LocationSettingRoute extends _i42.PageRouteInfo<void> {
  const LocationSettingRoute({List<_i42.PageRouteInfo>? children})
      : super(
          LocationSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationSettingRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ZoneChoiceScreen]
class ZoneChoiceRoute extends _i42.PageRouteInfo<ZoneChoiceRouteArgs> {
  ZoneChoiceRoute({
    _i45.Key? key,
    _i47.PhoneNumber? phoneNumber,
    int? userId,
    String? userName,
    String? userEmail,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          ZoneChoiceRoute.name,
          args: ZoneChoiceRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            userId: userId,
            userName: userName,
            userEmail: userEmail,
          ),
          initialChildren: children,
        );

  static const String name = 'ZoneChoiceRoute';

  static const _i42.PageInfo<ZoneChoiceRouteArgs> page =
      _i42.PageInfo<ZoneChoiceRouteArgs>(name);
}

class ZoneChoiceRouteArgs {
  const ZoneChoiceRouteArgs({
    this.key,
    this.phoneNumber,
    this.userId,
    this.userName,
    this.userEmail,
  });

  final _i45.Key? key;

  final _i47.PhoneNumber? phoneNumber;

  final int? userId;

  final String? userName;

  final String? userEmail;

  @override
  String toString() {
    return 'ZoneChoiceRouteArgs{key: $key, phoneNumber: $phoneNumber, userId: $userId, userName: $userName, userEmail: $userEmail}';
  }
}

/// generated route for
/// [_i9.RegisterScreen]
class RegisterRoute extends _i42.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i45.Key? key,
    _i47.PhoneNumber? phoneNumber,
    _i44.UserData? userData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i42.PageInfo<RegisterRouteArgs> page =
      _i42.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    this.phoneNumber,
    this.userData,
  });

  final _i45.Key? key;

  final _i47.PhoneNumber? phoneNumber;

  final _i44.UserData? userData;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, phoneNumber: $phoneNumber, userData: $userData}';
  }
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i42.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i45.Key? key,
    _i47.PhoneNumber? phoneNumber,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i42.PageInfo<LoginRouteArgs> page =
      _i42.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.phoneNumber,
  });

  final _i45.Key? key;

  final _i47.PhoneNumber? phoneNumber;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i11.CodePinScreen]
class CodePinRoute extends _i42.PageRouteInfo<CodePinRouteArgs> {
  CodePinRoute({
    _i45.Key? key,
    _i47.PhoneNumber? phoneNumber,
    String? verificationCode,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          CodePinRoute.name,
          args: CodePinRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            verificationCode: verificationCode,
          ),
          initialChildren: children,
        );

  static const String name = 'CodePinRoute';

  static const _i42.PageInfo<CodePinRouteArgs> page =
      _i42.PageInfo<CodePinRouteArgs>(name);
}

class CodePinRouteArgs {
  const CodePinRouteArgs({
    this.key,
    this.phoneNumber,
    this.verificationCode,
  });

  final _i45.Key? key;

  final _i47.PhoneNumber? phoneNumber;

  final String? verificationCode;

  @override
  String toString() {
    return 'CodePinRouteArgs{key: $key, phoneNumber: $phoneNumber, verificationCode: $verificationCode}';
  }
}

/// generated route for
/// [_i12.ChoiceScreen]
class ChoiceRoute extends _i42.PageRouteInfo<void> {
  const ChoiceRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ChoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoiceRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LimitedMapScreen]
class LimitedMapRoute extends _i42.PageRouteInfo<void> {
  const LimitedMapRoute({List<_i42.PageRouteInfo>? children})
      : super(
          LimitedMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'LimitedMapRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i14.DetailsRestaurantPage]
class DetailsRestaurantRoute
    extends _i42.PageRouteInfo<DetailsRestaurantRouteArgs> {
  DetailsRestaurantRoute({
    _i43.Key? key,
    _i44.RestaurantData? restaurantData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          DetailsRestaurantRoute.name,
          args: DetailsRestaurantRouteArgs(
            key: key,
            restaurantData: restaurantData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRestaurantRoute';

  static const _i42.PageInfo<DetailsRestaurantRouteArgs> page =
      _i42.PageInfo<DetailsRestaurantRouteArgs>(name);
}

class DetailsRestaurantRouteArgs {
  const DetailsRestaurantRouteArgs({
    this.key,
    this.restaurantData,
  });

  final _i43.Key? key;

  final _i44.RestaurantData? restaurantData;

  @override
  String toString() {
    return 'DetailsRestaurantRouteArgs{key: $key, restaurantData: $restaurantData}';
  }
}

/// generated route for
/// [_i15.DetailsRestaurantsPage]
class DetailsRestaurantsRoute extends _i42.PageRouteInfo<void> {
  const DetailsRestaurantsRoute({List<_i42.PageRouteInfo>? children})
      : super(
          DetailsRestaurantsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsRestaurantsRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i16.DetailsPopularPage]
class DetailsPopularRoute extends _i42.PageRouteInfo<void> {
  const DetailsPopularRoute({List<_i42.PageRouteInfo>? children})
      : super(
          DetailsPopularRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsPopularRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i17.HomeTabPage]
class HomeTabRoute extends _i42.PageRouteInfo<void> {
  const HomeTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MoreTabPage]
class MoreTabRoute extends _i42.PageRouteInfo<void> {
  const MoreTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          MoreTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i19.MoreDefaultPage]
class MoreDefaultRoute extends _i42.PageRouteInfo<void> {
  const MoreDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          MoreDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i20.EditProfilePage]
class EditProfileRoute extends _i42.PageRouteInfo<void> {
  const EditProfileRoute({List<_i42.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfileDefaultPage]
class ProfileDefaultRoute extends _i42.PageRouteInfo<void> {
  const ProfileDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ProfileDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ProfileTabPage]
class ProfileTabRoute extends _i42.PageRouteInfo<void> {
  const ProfileTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ProfileTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i23.CartTabPage]
class CartTabRoute extends _i42.PageRouteInfo<void> {
  const CartTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          CartTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i24.CartDefaultPage]
class CartDefaultRoute extends _i42.PageRouteInfo<void> {
  const CartDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          CartDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i25.CategoriesTabPage]
class CategoriesTabRoute extends _i42.PageRouteInfo<void> {
  const CategoriesTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          CategoriesTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i26.CategoriesDefaultPage]
class CategoriesDefaultRoute extends _i42.PageRouteInfo<void> {
  const CategoriesDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          CategoriesDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i27.DetailsDefaultPage]
class DetailsDefaultRoute extends _i42.PageRouteInfo<void> {
  const DetailsDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          DetailsDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i28.DetailsMealsPage]
class DetailsMealsRoute extends _i42.PageRouteInfo<DetailsMealsRouteArgs> {
  DetailsMealsRoute({
    _i43.Key? key,
    _i44.CategoryData? categoryData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          DetailsMealsRoute.name,
          args: DetailsMealsRouteArgs(
            key: key,
            categoryData: categoryData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsMealsRoute';

  static const _i42.PageInfo<DetailsMealsRouteArgs> page =
      _i42.PageInfo<DetailsMealsRouteArgs>(name);
}

class DetailsMealsRouteArgs {
  const DetailsMealsRouteArgs({
    this.key,
    this.categoryData,
  });

  final _i43.Key? key;

  final _i44.CategoryData? categoryData;

  @override
  String toString() {
    return 'DetailsMealsRouteArgs{key: $key, categoryData: $categoryData}';
  }
}

/// generated route for
/// [_i29.DetailsProductPage]
class DetailsProductRoute extends _i42.PageRouteInfo<DetailsProductRouteArgs> {
  DetailsProductRoute({
    _i43.Key? key,
    _i44.MealData? mealData,
    _i44.CategoryData? categoryData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          DetailsProductRoute.name,
          args: DetailsProductRouteArgs(
            key: key,
            mealData: mealData,
            categoryData: categoryData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsProductRoute';

  static const _i42.PageInfo<DetailsProductRouteArgs> page =
      _i42.PageInfo<DetailsProductRouteArgs>(name);
}

class DetailsProductRouteArgs {
  const DetailsProductRouteArgs({
    this.key,
    this.mealData,
    this.categoryData,
  });

  final _i43.Key? key;

  final _i44.MealData? mealData;

  final _i44.CategoryData? categoryData;

  @override
  String toString() {
    return 'DetailsProductRouteArgs{key: $key, mealData: $mealData, categoryData: $categoryData}';
  }
}

/// generated route for
/// [_i30.HomeScreen]
class HomeRoute extends _i42.PageRouteInfo<void> {
  const HomeRoute({List<_i42.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i31.IntroScreen]
class IntroRoute extends _i42.PageRouteInfo<void> {
  const IntroRoute({List<_i42.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i32.SplashScreen]
class SplashRoute extends _i42.PageRouteInfo<void> {
  const SplashRoute({List<_i42.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i33.PendingPage]
class PendingRoute extends _i42.PageRouteInfo<void> {
  const PendingRoute({List<_i42.PageRouteInfo>? children})
      : super(
          PendingRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i34.DetailsPendingPage]
class DetailsPendingRoute extends _i42.PageRouteInfo<DetailsPendingRouteArgs> {
  DetailsPendingRoute({
    _i43.Key? key,
    _i44.OrderData? orderData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          DetailsPendingRoute.name,
          args: DetailsPendingRouteArgs(
            key: key,
            orderData: orderData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsPendingRoute';

  static const _i42.PageInfo<DetailsPendingRouteArgs> page =
      _i42.PageInfo<DetailsPendingRouteArgs>(name);
}

class DetailsPendingRouteArgs {
  const DetailsPendingRouteArgs({
    this.key,
    this.orderData,
  });

  final _i43.Key? key;

  final _i44.OrderData? orderData;

  @override
  String toString() {
    return 'DetailsPendingRouteArgs{key: $key, orderData: $orderData}';
  }
}

/// generated route for
/// [_i35.HomeRestaurantTabPage]
class HomeRestaurantTabRoute extends _i42.PageRouteInfo<void> {
  const HomeRestaurantTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          HomeRestaurantTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRestaurantTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i36.RestaurantDefaultPage]
class RestaurantDefaultRoute extends _i42.PageRouteInfo<void> {
  const RestaurantDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          RestaurantDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i37.RestaurantTabPage]
class RestaurantTabRoute extends _i42.PageRouteInfo<void> {
  const RestaurantTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          RestaurantTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i38.MenuDefaultPage]
class MenuDefaultRoute extends _i42.PageRouteInfo<void> {
  const MenuDefaultRoute({List<_i42.PageRouteInfo>? children})
      : super(
          MenuDefaultRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuDefaultRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i39.DetailsMenuPage]
class DetailsMenuRoute extends _i42.PageRouteInfo<DetailsMenuRouteArgs> {
  DetailsMenuRoute({
    _i43.Key? key,
    _i44.RestaurantCategoryData? categoryData,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          DetailsMenuRoute.name,
          args: DetailsMenuRouteArgs(
            key: key,
            categoryData: categoryData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsMenuRoute';

  static const _i42.PageInfo<DetailsMenuRouteArgs> page =
      _i42.PageInfo<DetailsMenuRouteArgs>(name);
}

class DetailsMenuRouteArgs {
  const DetailsMenuRouteArgs({
    this.key,
    this.categoryData,
  });

  final _i43.Key? key;

  final _i44.RestaurantCategoryData? categoryData;

  @override
  String toString() {
    return 'DetailsMenuRouteArgs{key: $key, categoryData: $categoryData}';
  }
}

/// generated route for
/// [_i40.MenuTabPage]
class MenuTabRoute extends _i42.PageRouteInfo<void> {
  const MenuTabRoute({List<_i42.PageRouteInfo>? children})
      : super(
          MenuTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuTabRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i41.HomeRestaurantScreen]
class HomeRestaurantRoute extends _i42.PageRouteInfo<void> {
  const HomeRestaurantRoute({List<_i42.PageRouteInfo>? children})
      : super(
          HomeRestaurantRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRestaurantRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}
