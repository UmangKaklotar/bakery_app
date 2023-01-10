import 'package:flutter/material.dart';

class OrderDone extends StatefulWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('build/image/done.gif', height: 200),
            const Spacer(),
            const Text("Your Order\nHas Been Accepted",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff111416),
                fontFamily: 'Iphone',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 15),
            Text("Your Order Will be Delivered soon.\nThank You For Choosing our App!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontFamily: 'Iphone',
                fontSize: 20,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'home');
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xff111416),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: const Text("Back To Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Iphone',
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
