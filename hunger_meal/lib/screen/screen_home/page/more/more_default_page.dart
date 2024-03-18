import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MoreDefaultPage extends StatelessWidget {
  const MoreDefaultPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
