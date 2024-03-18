import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
    ),
    AutoRoute(path: '/choice', page: ChoiceRoute.page),
    AutoRoute(path: '/login', page: LoginRoute.page),
    AutoRoute(path: '/register', page: RegisterRoute.page),
    AutoRoute(path: '/code-pin', page: CodePinRoute.page),
    AutoRoute(path: '/intro', page: IntroRoute.page),

    AutoRoute(
      path: '/zones',
      page: ZoneChoiceRoute.page,
    ),
    AutoRoute(
      path: '/location-setting',
      page: LocationSettingRoute.page,
    ),
    AutoRoute(
        path: '/location-picker',
        page: LocationPickerRoute.page
    ),
    AutoRoute(
      path: '/limited-map',
      page: LimitedMapRoute.page,
      fullscreenDialog: true,
    ),


    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
      children: [
        RedirectRoute(path: '', redirectTo: 'home-tab-page'),
        AutoRoute(path: 'home-tab-page', page: HomeDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'home-page'),
          AutoRoute(path: 'home-page', page: HomeTabRoute.page),
          AutoRoute(
            path: 'details-home-page',
            page: DetailsDefaultRoute.page,
            children: [
              RedirectRoute(path: '', redirectTo: 'details-page'),
              AutoRoute(path: 'details-page', page: DetailsRestaurantsRoute.page),
              AutoRoute(path: 'details-restaurant-page', page: DetailsRestaurantRoute.page),
              AutoRoute(path: 'details-product-page', page: DetailsProductRoute.page),
              AutoRoute(path: 'details-popular-page', page: DetailsPopularRoute.page),
              AutoRoute(path: 'details-meals-page', page: DetailsMealsRoute.page),
            ],
          ),
        ]),
        AutoRoute(path: 'cart-tab-page', page: CartDefaultRoute.page, maintainState: false, children: [
          RedirectRoute(path: '', redirectTo: 'cart-page'),
          AutoRoute(path: 'cart-page', page: CartTabRoute.page),
        ]),
        AutoRoute(path: 'categories-tab-page', page: CategoriesDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'categories-page'),
          AutoRoute(path: 'categories-page', page: CategoriesTabRoute.page),
          AutoRoute(
            path: 'details-categories-page',
            page: DetailsDefaultRoute.page,
            children: [
              RedirectRoute(path: '', redirectTo: 'details-page'),
              AutoRoute(path: 'details-page', page: DetailsMealsRoute.page),
              AutoRoute(path: 'details-product-page', page: DetailsProductRoute.page),
            ],
          ),
        ]),
        AutoRoute(path: 'profile-tab-page', page: ProfileDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'profile-page'),
          AutoRoute(path: 'profile-page', page: ProfileTabRoute.page),
          AutoRoute(path: 'edit-profile-page', page: EditProfileRoute.page,),
        ]),
        AutoRoute(path: 'more-tab-page', page: MoreDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'more-page'),
          AutoRoute(path: 'more-page', page: MoreTabRoute.page),
        ]),
      ],
    ),

    AutoRoute(
      path: '/home-restaurant',
      page: HomeRestaurantRoute.page,
      children: [
        RedirectRoute(path: '', redirectTo: 'home-restaurant-tab-page'),
        AutoRoute(path: 'home-restaurant-tab-page', page: HomeDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'home-restaurant-page'),
          AutoRoute(path: 'home-restaurant-page', page: HomeRestaurantTabRoute.page),
          AutoRoute(
            path: 'details-pending-page',
            page: DetailsPendingRoute.page,
            fullscreenDialog: true,
          ),
          AutoRoute(
            path: 'new-order-page',
            page: PendingRoute.page,
            fullscreenDialog: true,
          ),
        ]),
        AutoRoute(path: 'menu-tab-page', page: MenuDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'menu-page'),
          AutoRoute(path: 'menu-page', page: MenuTabRoute.page),
          AutoRoute(path: 'details-menu-page', page: DetailsMenuRoute.page),
        ]),
        AutoRoute(path: 'restaurant-tab-page', page: RestaurantDefaultRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'restaurant-page'),
          AutoRoute(path: 'restaurant-page', page: RestaurantTabRoute.page),
        ]),
      ],
    ),


    AutoRoute(path: '/home-driver', page: HomeDriverRoute.page),
    AutoRoute(
      path: '/details-delivery-page',
      page: DetailsDeliveryRoute.page,
      fullscreenDialog: true,
    ),
    AutoRoute(path: '/profile-driver-page', page: ProfileDriverRoute.page),

    RedirectRoute(path: '*', redirectTo: '/'),

  ];
}
