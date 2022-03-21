import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:renmoneytest/core/services/transaction_service.dart';
import 'package:renmoneytest/utils/locator.dart';
import 'package:renmoneytest/utils/router/navigation_service.dart';
import 'package:renmoneytest/utils/router/route_names.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  final NavigationService _navigationService = locator<NavigationService>();
  late AnimationController animationController;
  late Animation<double> animation;
  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getString('profile');
    if (id != null) {
      // _authentication.alreadyLoggedIn();
    } else {
      _navigationService.navigateReplacementTo(homeRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: animation.value * 200, child: Image.asset("assets/images/logo.jpeg")),
                // Text("renmoneytest",style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold, fontSize: 50),)
              ]),
        ],
      ),
    );
  }
}
