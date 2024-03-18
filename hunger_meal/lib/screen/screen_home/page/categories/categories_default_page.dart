import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoriesDefaultPage extends StatelessWidget {
  const CategoriesDefaultPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
