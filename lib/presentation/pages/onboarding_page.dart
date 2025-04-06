import 'package:car_rental/styles/font_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2B34),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboarding.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Premuim Cars. \nEnjoy the luxury', style: styleOne),
                  SizedBox(height: 10),
                  Text('Premium and presitage car rental \nExperience the thrill at a lower price',style: styleTwo,),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 54,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white
                      ),
                      child: Text('Let\'s Go', style: styleThree),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}