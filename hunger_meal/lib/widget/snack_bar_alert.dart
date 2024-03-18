

import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../config/themes/app_theme.dart';


class SnackBarAlert {

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  show({required BuildContext context, String? description, Color? colorOption}) {

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: colorOption?? AppThemeMode.primaryColor, behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
      content: AutoSizeText(description?? Constant.noConnexionData, textAlign: TextAlign.center,),
    ));

  }

}
