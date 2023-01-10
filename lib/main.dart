import 'dart:async';

import 'package:flutter/material.dart';

import 'Buy Now.dart';
import 'Edit Profile.dart';
import 'Home Page.dart';
import 'Item Details.dart';
import 'My Order.dart';
import 'Order Done.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'home': (context) => const HomePage(),
        'detail': (context) => const ItemDetails(),
        'edit': (context) => const EditProfile(),
        'buy': (context) => const BuyNow(),
        'orderDone': (context) => const OrderDone(),
        'myOrder': (context) => const MyOrder(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () =>
        Navigator.pushReplacementNamed(context, 'home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('build/image/bakery.png',
          height: 130,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xff111416),
    );
  }
}
