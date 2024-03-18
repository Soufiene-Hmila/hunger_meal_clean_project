import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
@RoutePage()
class MoreTabPage extends StatefulWidget {
  const MoreTabPage({super.key});

  @override
  State<MoreTabPage> createState() => _MoreTabPageState();
}

class _MoreTabPageState extends State<MoreTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/background.png"), opacity: 0.56),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const AutoSizeText('More',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
