// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

// SingleTickerProviderStateMixin    بتاع تغيير القيم(Rate)  دى ده اللى بيهندل ال
class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
       Navigator.pushNamed(context, '/CalculatorHome');
    });
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff0A0B20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/30.jpg",width: 150,height: 150,),
          SlideTransition(
              position: slidingAnimation,
              child: const Text(
                "Calculator App",
                textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 40,fontWeight:FontWeight.bold),
              )),
        ],
      ),
    );
  }
}