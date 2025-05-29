import 'package:flutter/material.dart';

class TextFiledWidget extends StatelessWidget {
  final String title,hintTex;
  final TextEditingController controller;
  const TextFiledWidget({super.key, required this.title, required this.hintTex, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 16),),
          Container(
            margin: EdgeInsets.only(top: 8),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFF0F533)
            ),
            width: MediaQuery.of(context).size.width,
            height: 62,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintTex,
                border: InputBorder.none
              ),
            ),
          )
        ],
      ),
    );
  }
}
