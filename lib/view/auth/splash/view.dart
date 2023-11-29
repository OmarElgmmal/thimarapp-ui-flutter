import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/main.dart';
import 'package:thimar_app/shared/logic/cache_helper.dart';
import 'package:thimar_app/shared/logic/helper_methods.dart';
import 'package:thimar_app/view/auth/login/view.dart';
import 'package:thimar_app/view/home/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () {
              toGetNavigate(CacheHelper.isAuth()?const HomeView():const LoginView(),
              );
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xff4C8613).withOpacity(.2),
          ),
          Center(
            child: Bounce(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                height: 160,
                width: 160,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: 110,
            child: Image.asset(
              "assets/images/side_image.png",
              fit: BoxFit.fill,
              height: 298,
              width: 448,
            ),
          ),
        ],
      )
    );
  }
}
