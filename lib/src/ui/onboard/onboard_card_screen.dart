import 'package:flutter/material.dart';

class OnboardCardScreen extends StatelessWidget {
  final String img,title,body;
  const OnboardCardScreen({super.key, required this.img, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:240,
              height: 292,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey
              ),
            ),
            Text(title),
            Text(body,textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
