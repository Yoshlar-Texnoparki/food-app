import 'package:flutter/material.dart';
import 'package:food_app/src/ui/auth/register_screen.dart';
import 'package:food_app/src/ui/onboard/onboard_card_screen.dart';
import 'package:food_app/src/ui/theme/app_color/app_color.dart';
import 'package:food_app/src/ui/widget/button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  String buttonText = "NEXT";
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child:PageView(
            controller: controller,
            onPageChanged: (i){
              currentIndex = i;
              if(i == 2){
                buttonText = "GET STARTED";
              }else{
                buttonText = "NEXT";
              }
              setState(() {
              });
            },
            children: [
              OnboardCardScreen(img: "img", title: "All your favorites", body: ''' Get all your loved foods in one once place, you just place the orer we do the rest'''),
              OnboardCardScreen(img: "img", title: "All your favorites", body: '''Get all your loved foods in one once place you just place the orer we do the rest'''),
              OnboardCardScreen(img: "img", title: "All your favorites", body: '''Get all your loved foods in one once place,you just place the orer we do the rest'''),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 68.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i){
                  return  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: currentIndex == i?AppColors.orange:AppColors.orange.withOpacity(0.1)
                    ),
                  );
                })
            ),
          ),

          ButtonWidget(
            text: buttonText,
            onTap: (){
            controller.nextPage(duration: Duration(milliseconds: 900), curve: Curves.linear);
            if(currentIndex == 2){
              Navigator.push(context, MaterialPageRoute(builder: (builder){
                return RegisterScreen();
              }));
            }
          },)
        ],
      ),
    );
  }
}
