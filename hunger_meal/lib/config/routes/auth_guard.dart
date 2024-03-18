import 'package:auto_route/auto_route.dart';

var isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
    // if (!isAuthenticated) {
    //   // ignore: unawaited_futures
    //   router.push(
    //     LoginRoute(onLoginResult: (_) {
    //       isAuthenticated = true;
    //       // we can't pop the bottom page in the navigator's stack
    //       // so we just remove it from our local stack
    //       router.markUrlStateForReplace();
    //       router.removeLast();
    //       resolver.next();
    //     }),
    //
    //   );
    // } else {
    //   resolver.next(true);
    // }
  }
}