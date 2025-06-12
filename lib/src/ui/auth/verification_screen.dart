import 'dart:async';
import 'package:food_app/src/ui/home/home_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/ui/widget/button_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isCheck = false,obscureText = false;
  int _start = 50;
  String _code = "1234";
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

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
                  Text("Verification",style: TextStyle(fontSize: 34,color: Colors.white),),
                  Text("We have sent a code to your email\nexample@gmail.com",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white),)
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                          child: Row(
                            children: [
                              Text("CODE",style: TextStyle(fontSize: 16),),
                              Spacer(),
                              TextButton(onPressed: (){
                                if(_start == 0){
                                  _start = 50;
                                  setState(() {

                                  });
                                  startTimer();
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hali vaqt borr")));
                                }
                              }, child:Text("Resend",style: TextStyle(fontSize: 16,color: Colors.red),),),
                              Text("in:$_start",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                        Pinput(
                          length: 4,
                          defaultPinTheme: PinTheme(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                              width: 62,
                              height: 62,
                              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                        ),
                          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (code){
                            if(code == _code){
                              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                                return HomeScreen();
                              }));
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("KOD TASDIQLANDI"),backgroundColor: Colors.green,));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("KOD TASDIQLANMADI"),backgroundColor: Colors.red,));

                            }
                          },
                        ),
                      ],
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
