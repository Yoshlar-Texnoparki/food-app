import 'package:flutter/material.dart';
import 'package:food_app/src/ui/auth/register_screen.dart';
import 'package:food_app/src/ui/theme/app_color/app_color.dart';
import 'package:food_app/src/ui/widget/button_widget.dart';
import 'package:food_app/src/ui/widget/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isCheck = false,obscureText = false;
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
                        TextFiledWidget(
                          title: 'EMAIL',
                          hintTex: 'exaple@gmail.com',
                          controller: controllerEmail,
                        ),
                        TextFiledWidget(
                          title: 'PASSWORD',
                          hintTex: '******',
                          controller: controllerPassword,
                          obscureText: obscureText,
                          suffixIcon: IconButton(onPressed: (){
                            obscureText = !obscureText;
                            setState(() {
                            });
                          }, icon: Icon(obscureText?Icons.hide_source:Icons.remove_red_eye)),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 24,),
                            Checkbox(value: isCheck, onChanged: (onChanged){
                              setState(() {
                                isCheck = onChanged!;
                              });
                            }),
                            Text("Remember me"),
                            Spacer(),
                            TextButton(onPressed: (){}, child: Text("Forgot password",style: TextStyle(color: AppColors.orange),)),
                            SizedBox(width: 24,)
                          ],
                        )
                      ],
                    ),
                  ),
                  ButtonWidget(onTap: (){
                    if(controllerEmail.text.replaceAll(" ", "").length > 4 && controllerPassword.text.replaceAll(" ", "").length > 8){
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
                      showDialog(context: context, builder: (builder){
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          title: Center(child: Text("XATO!",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                          content: Padding(
                            padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
                            child: Text("Email yoki Password xato iltimos to'g'ri to'ldiring",textAlign: TextAlign.center,),
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text("Ok"))
                          ],
                        );
                      });
                    }
                  }, text: "LOG IN"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder){
                          return RegisterScreen();
                        }));
                      }, child: Text("Sign Up",style: TextStyle(color: AppColors.orange),))
                    ],
                  ),
                  Center(child: Text("OR")),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 30,),
                      Image.asset("assets/images/apple.png"),
                      Image.asset("assets/images/facebook.png"),
                      Image.asset("assets/images/x.png"),
                      SizedBox(width: 30,),
                    ],
                  ),
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
