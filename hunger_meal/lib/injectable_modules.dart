import 'package:hunger_meal/config/routes/routes.dart';
import 'package:injectable/injectable.dart';


@module
abstract class InjectableModule {

  @lazySingleton
  AppRouter get router => AppRouter();

}