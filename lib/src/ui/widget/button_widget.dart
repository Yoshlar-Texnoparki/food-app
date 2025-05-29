import 'package:flutter/material.dart';
import 'package:food_app/src/ui/theme/app_color/app_color.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  const ButtonWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 14),
        width: MediaQuery.of(context).size.width,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.orange
        ),
        child: Text(text),
      ),
    );
  }
}
