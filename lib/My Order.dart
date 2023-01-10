import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Global%20Var.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xff1E2326),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xff111416),
        elevation: 0,
        centerTitle: true,
        title: const Text("\nMy Order",
          style: TextStyle(
            fontFamily: 'Iphone',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.myOrder.map((e){
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(10),
                height: 100,
                width: _width,
                decoration: BoxDecoration(
                  color: const Color(0xff1E2326),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: _height,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(e['image']),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e['name'],
                          style: const TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text("₹ ${int.parse(e['price']) * e['quantity']}",
                          style: const TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text("Quantity : ${e['quantity']}",
                          style: const TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
        ),
      ),
      backgroundColor: const Color(0xff111416),
    );
  }
}
