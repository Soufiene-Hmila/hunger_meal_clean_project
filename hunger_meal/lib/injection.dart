import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecaes/client/get_zones_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:hunger_meal/screen/screen_auth/bloc/bloc_user.dart';
import 'package:hunger_meal/screen/screen_home/page/cart/bloc/bloc_cart.dart';
import 'package:hunger_meal/screen/screen_home/page/categories/bloc/bloc_category.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_meal.dart';
import 'package:hunger_meal/screen/screen_home/page/home/bloc/bloc_restaurant.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/home/bloc/bloc_restaurant_order.dart';
import 'package:hunger_meal/screen/screen_home_restaurant/page/menu/bloc/bloc_menu.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';
import 'screen/screen_home_driver/bloc/bloc_driver_order.dart';

final GetIt injector = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureInjection(String env) async {

  $initGetIt(injector, environment: env);

  // Local Storage
  final sharedPrefs = await SharedPreferences.getInstance();
  injector.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  injector.registerLazySingleton<LocalStorageService>(() => LocalStorageService(injector()));

  injector.registerSingleton<DataBaseService>(DataBaseService());

  // Network Info
  injector.registerLazySingleton<NetworkInfoService>(() => NetworkInfoImpl());

  // Dio Factory
  injector.registerLazySingleton<DioFactoryService>(() => DioFactoryService(injector()));

  // Dio Client Service
  final dio = await injector<DioFactoryService>().getDio();
  injector.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Repositories
  injector.registerSingleton<RestaurantRepository>(RestaurantRepositoryImpl(injector(), injector(),),);
  injector.registerSingleton<MealRepository>(MealRepositoryImpl(injector(), injector(),),);
  injector.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(injector(), injector(),),);
  injector.registerSingleton<UserRepository>(UserRepositoryImpl(injector(), injector(),),);
  injector.registerSingleton<OrderRepository>(OrderRepositoryImpl(injector(), injector(), injector()),);

  // Restaurant Repositories
  injector.registerSingleton<RestaurantOrderRepository>(RestaurantOrderRepositoryImpl(injector(), injector(),),);
  injector.registerSingleton<RestaurantCategoryRepository>(RestaurantCategoryRepositoryImpl(injector(), injector(),),);

  // Driver Repositories
  injector.registerSingleton<DriverOrderRepository>(DriverOrderRepositoryImpl(injector(), injector(),),);


  // UseCases
  injector.registerFactory<GetCategoriesUseCase>(() => GetCategoriesUseCase(injector()));
  injector.registerFactory<GetCategoryUseCase>(() => GetCategoryUseCase(injector()));
  injector.registerFactory<GetRestaurantsUseCase>(() => GetRestaurantsUseCase(injector()));
  injector.registerFactory<GetRestaurantUseCase>(() => GetRestaurantUseCase(injector()));
  injector.registerFactory<GetZonesUseCase>(() => GetZonesUseCase(injector()));

  injector.registerFactory<GetMealsUseCase>(() => GetMealsUseCase(injector()));
  injector.registerFactory<GetMealUseCase>(() => GetMealUseCase(injector()));
  injector.registerFactory<SetCostUseCase>(() => SetCostUseCase(injector()));
  injector.registerFactory<SetCartUseCase>(() => SetCartUseCase(injector()));

  injector.registerFactory<GetCartMealUseCase>(() => GetCartMealUseCase(injector()));
  injector.registerFactory<GetCartMealsUseCase>(() => GetCartMealsUseCase(injector()));
  injector.registerFactory<DeleteCartMealUseCase>(() => DeleteCartMealUseCase(injector()));
  injector.registerFactory<SetMealUseCase>(() => SetMealUseCase(injector()));
  injector.registerFactory<SetQuantityMealUseCase>(() => SetQuantityMealUseCase(injector()));

  injector.registerFactory<SetPhoneUseCase>(() => SetPhoneUseCase(injector()));
  injector.registerFactory<SetVerificationUseCase>(() => SetVerificationUseCase(injector()));
  injector.registerFactory<SetResetVerificationUseCase>(() => SetResetVerificationUseCase(injector()));
  injector.registerFactory<SetInfoUseCase>(() => SetInfoUseCase(injector()));
  injector.registerFactory<GetProfileUseCase>(() => GetProfileUseCase(injector()));

  // Restaurants UseCases
  injector.registerFactory<GetRestaurantOrdersAcceptUseCase>(() => GetRestaurantOrdersAcceptUseCase(injector()));
  injector.registerFactory<GetRestaurantOrdersRejectedUseCase>(() => GetRestaurantOrdersRejectedUseCase(injector()));
  injector.registerFactory<GetRestaurantOrdersWaitingUseCase>(() => GetRestaurantOrdersWaitingUseCase(injector()));
  injector.registerFactory<GetRestaurantOrdersDeliveredUseCase>(() => GetRestaurantOrdersDeliveredUseCase(injector()));
  injector.registerFactory<GetRestaurantOrderUseCase>(() => GetRestaurantOrderUseCase(injector()));

  injector.registerFactory<GetRestaurantCategoriesUseCase>(() => GetRestaurantCategoriesUseCase(injector()));
  injector.registerFactory<GetRestaurantMealsUseCase>(() => GetRestaurantMealsUseCase(injector()));

  injector.registerFactory<ChangeRestaurantMealStateUseCase>(() => ChangeRestaurantMealStateUseCase(injector()));
  injector.registerFactory<SetStatusRestaurantOrderUseCase>(() => SetStatusRestaurantOrderUseCase(injector()));


  // Drivers UseCases
  injector.registerFactory<GetDriverOrdersAcceptUseCase>(() => GetDriverOrdersAcceptUseCase(injector()));
  injector.registerFactory<GetDriverOrdersRejectedUseCase>(() => GetDriverOrdersRejectedUseCase(injector()));
  injector.registerFactory<GetDriverOrdersWaitingUseCase>(() => GetDriverOrdersWaitingUseCase(injector()));
  injector.registerFactory<GetDriverOrdersDeliveredUseCase>(() => GetDriverOrdersDeliveredUseCase(injector()));
  injector.registerFactory<GetDriverOrderUseCase>(() => GetDriverOrderUseCase(injector()));

  injector.registerFactory<SetStatusDriverOrderUseCase>(() => SetStatusDriverOrderUseCase(injector()));


  injector.registerFactory<BlocCart>(() => BlocCart(injector(), injector(), injector(),
      injector(), injector(), injector(), injector()),);
  injector.registerFactory<BlocCategory>(() => BlocCategory(injector(), injector(),),);
  injector.registerFactory<BlocRestaurant>(() => BlocRestaurant(injector(), injector()),);
  injector.registerFactory<BlocMeal>(() => BlocMeal(injector(), injector(),),);
  injector.registerFactory<BlocUser>(() => BlocUser(injector(), injector(), injector(),
      injector(), injector(), injector()),);

  // Restaurant Bloc
  injector.registerFactory<BlocRestaurantOrder>(() => BlocRestaurantOrder(injector(),
      injector(), injector(), injector(), injector(), injector()),);
  injector.registerFactory<BlocMenu>(() => BlocMenu(injector(), injector(), injector()),);

  // Driver Bloc
  injector.registerFactory<BlocDriverOrder>(() => BlocDriverOrder(injector(),
      injector(), injector(), injector(), injector(), injector()),);
}