import 'package:flutter/material.dart';
import 'package:food_app/src/ui/widget/button_widget.dart';
import 'package:food_app/src/ui/widget/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPassword2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView(
                      children: [
                        TextFiledWidget(title: 'NAME', hintTex: 'John doe',controller: controllerName,),
                        TextFiledWidget(title: 'EMAIL', hintTex: 'exaple@gmail.com',controller: controllerEmail,),
                        TextFiledWidget(title: 'PASSWORD', hintTex: '******',controller: controllerPassword,),
                        TextFiledWidget(title: 'Re-Type Password', hintTex: '******',controller: controllerPassword2,),
                      ],
                    ),
                  ),
                  ButtonWidget(onTap: (){
                    print(controllerName.text);
                    print(controllerEmail.text);
                    print(controllerPassword.text);
                    print(controllerPassword2.text);
                  }, text: "SIGN UP")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
