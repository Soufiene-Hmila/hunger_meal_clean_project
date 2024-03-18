import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DefaultActionButton extends StatelessWidget {

  final bool isLoading;
  final bool isClickable;
  final VoidCallback onClickCallback;
  final String textButton;
  final Color textColor;
  final Color colorButton;
  const DefaultActionButton({Key? key,
    this.textButton = "Next", this.textColor = const Color(0xFFFFFFFF),
    this.colorButton = const Color(0xFF000000), required this.isLoading,
    required this.onClickCallback,  this.isClickable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: isClickable?
      InkWell(
        onTap: !isLoading? () =>  onClickCallback.call() : null,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 50, width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(color: colorButton,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 10),
            crossFadeState: isLoading? CrossFadeState.showSecond: CrossFadeState.showFirst,
            firstChild: Center(child: AutoSizeText(textButton, style: TextStyle(
                  color: textColor, fontSize: 24, fontWeight: FontWeight.w500),),
            ),
            secondChild: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: textColor, strokeWidth: 2.5,),
            )),
          ),
        ),
      ):
      AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 50, width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(color: colorButton.withOpacity(0.45),
          borderRadius: const BorderRadius.all(Radius.circular(50)),),
        child: Center(child: AutoSizeText(textButton, style: TextStyle(
            color: textColor, fontSize: 24),),),
      )
    );
  }
}
