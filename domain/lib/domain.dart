library domain;

export 'repositories/client/restaurant_repository.dart';
export 'repositories/client/meal_repository.dart';
export 'repositories/client/category_repository.dart';
export 'repositories/client/user_repository.dart';
export 'repositories/client/order_repository.dart';

export 'usecaes/client/get_restaurant_use_case.dart';
export 'usecaes/client/get_restaurants_use_case.dart';

export 'usecaes/client/get_categories_use_case.dart';
export 'usecaes/client/get_category_use_case.dart';


export 'usecaes/client/get_meals_use_case.dart';
export 'usecaes/client/get_meal_use_case.dart';
export 'usecaes/client/set_meal_use_case.dart';
export 'usecaes/client/get_cart_meal_use_case.dart';
export 'usecaes/client/get_cart_meals_use_case.dart';
export 'usecaes/client/delete_cart_meal_use_case.dart';

export 'usecaes/client/set_phone_use_case.dart';
export 'usecaes/client/set_cart_use_case.dart';
export 'usecaes/client/set_info_use_case.dart';
export 'usecaes/client/set_verification_use_case.dart';
export 'usecaes/client/get_profile_use_case.dart';
export 'usecaes/client/set_reset_verification_use_case.dart';
export 'usecaes/client/set_cost_use_case.dart';
export 'usecaes/client/set_quantity_meal_use_case.dart';

export 'entities/client/login_data.dart';
export 'entities/client/user_data.dart';
export 'entities/client/profile_data.dart';
export 'entities/client/zone_address_data.dart';

export 'entities/client/meal_data.dart';
export 'entities/client/category_data.dart';
export 'entities/client/restaurant_data.dart';
export 'entities/client/supplement_data.dart';
export 'entities/client/cost_data.dart';

export 'entities/client/verification_data.dart';


/// Restaurant domain

export 'entities/restaurant/order_pivot_data.dart';
export 'entities/restaurant/order_meal_data.dart';
export 'entities/restaurant/order_supplement_data.dart';
export 'entities/restaurant/order_data.dart';
export 'entities/restaurant/order_driver_data.dart';
export 'entities/restaurant/order_client_data.dart';
export 'entities/restaurant/order_restaurant_data.dart';
export 'entities/restaurant/restaurant_category_data.dart';
export 'entities/restaurant/restaurant_meal_data.dart';
export 'entities/restaurant/restaurant_supplement_data.dart';

export 'usecaes/restaurant/get_restaurant_order_use_case.dart';
export 'usecaes/restaurant/get_restaurant_orders_accept_use_case.dart';
export 'usecaes/restaurant/get_restaurant_orders_waiting_use_case.dart';
export 'usecaes/restaurant/get_restaurant_orders_rejected_use_case.dart';
export 'usecaes/restaurant/get_restaurant_orders_delivered_use_case.dart';

export 'usecaes/restaurant/get_restaurant_categories_use_case.dart';
export 'usecaes/restaurant/get_restaurant_meals_use_case.dart';
export 'usecaes/restaurant/change_restaurant_meal_state_use_case.dart';
export 'usecaes/restaurant/set_state_restaurant_order_use_case.dart';

export 'repositories/restaurant/restaurant_order_repository.dart';
export 'repositories/restaurant/restaurant_category_repository.dart';

/// Driver domain

export 'repositories/driver/driver_order_repository.dart';

export 'usecaes/driver/get_driver_order_use_case.dart';
export 'usecaes/driver/get_driver_orders_accept_use_case.dart';
export 'usecaes/driver/get_driver_orders_waiting_use_case.dart';
export 'usecaes/driver/get_driver_orders_rejected_use_case.dart';
export 'usecaes/driver/get_driver_orders_delivered_use_case.dart';

export 'usecaes/driver/set_state_driver_order_use_case.dart';





