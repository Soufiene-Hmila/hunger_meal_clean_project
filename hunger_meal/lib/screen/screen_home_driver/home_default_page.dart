import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeDefaultPage extends StatelessWidget {
  const HomeDefaultPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
