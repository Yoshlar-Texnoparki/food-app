import 'package:flutter/material.dart';
import 'package:food_app/src/ui/widget/button_widget.dart';
import 'package:food_app/src/ui/widget/textfield_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isCheck = false,obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgot Password",style: TextStyle(fontSize: 34,color: Colors.white),),
                  Text("Please sign in to your existing account",style: TextStyle(fontSize: 15,color: Colors.white),)
                ],
              ),
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
                  Expanded(
                    child: ListView(
                      children: [
                        TextFiledWidget(
                          title: 'EMAIL',
                          hintTex: 'exaple@gmail.com',
                          controller: controllerEmail,
                        ),
                      ],
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  ButtonWidget(onTap: (){
                    if(controllerEmail.text.replaceAll(" ", "").length > 4){
                      if(controllerEmail.text.endsWith("@gmail.com")){
                        showDialog(context: context, builder: (builder){
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            title: Center(child: Text("MUOFAQIYATLI!",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                            content: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Email va Password  to'g'ri to'ldirilgan",textAlign: TextAlign.center,),
                            ),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Ok"))
                            ],
                          );
                        });
                      }else{
                        showDialog(context: context, builder: (builder){
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            title: Center(child: Text("XATO!",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                            content: Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
                              child: Text("Bunday email mavjud emas",textAlign: TextAlign.center,),
                            ),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Ok"))
                            ],
                          );
                        });
                      }
                    }else{
                    }
                  }, text: "SEND"),
                  SizedBox(height: 34,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
