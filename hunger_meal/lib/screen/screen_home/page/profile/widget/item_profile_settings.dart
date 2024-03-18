import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';

class ItemProfileSettings extends StatelessWidget {

  final String image;
  final String title;
  final VoidCallback? voidCallback;

  const ItemProfileSettings({Key? key, required this.image,
    required this.title, this.voidCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppThemeMode.containerFieldColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Image.asset(image, color: AppThemeMode.primaryColor, colorBlendMode: BlendMode.color,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: AutoSizeText(title, style: const TextStyle(
                  color: AppThemeMode.secondaryColor, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_outward_rounded, color: AppThemeMode.secondaryColor,)
          ],
        ),
      ),
    );
  }
}
