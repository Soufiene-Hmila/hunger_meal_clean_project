import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MenuDefaultPage extends StatelessWidget {
  const MenuDefaultPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
