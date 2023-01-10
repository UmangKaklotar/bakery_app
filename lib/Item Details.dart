import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Global Var.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: (){
            Navigator.popAndPushNamed(context, 'home');
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
        actions: [
          GestureDetector(
            onTap: (){
              setState(() {
                Global.items[index]['cart'] = !Global.items[index]['cart'];
                Global.items[index]['quantity'] = 1;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xff1E2326),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(Global.items[index]['cart'] == true ? CupertinoIcons.cart_fill : CupertinoIcons.cart, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(Global.items[index]['name'],
              style: const TextStyle(
                fontFamily: 'Iphone',
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(Global.items[index]['gram'],
              style: const TextStyle(
                fontFamily: 'Iphone',
                color: Color(0xff707B82),
                fontSize: 18,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Container(
              height: 260,
              width: _width,
              alignment: Alignment.center,
              child: Image.asset(Global.items[index]['image'],height: 220,),
            ),
            const Spacer(),
            Text("₹ ${Global.items[index]['price']}",
              style: const TextStyle(
                fontFamily: 'Iphone',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("⭐ ${Global.items[index]['star']}",
                  style: const TextStyle(
                    fontFamily: 'Iphone',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                Text("😋 ${Global.items[index]['category']}",
                  style: const TextStyle(
                    fontFamily: 'Iphone',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                Text("⏱ ${Global.items[index]['time']}",
                  style: const TextStyle(
                    fontFamily: 'Iphone',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Description",
                style: TextStyle(
                  fontFamily: 'Iphone',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text("A bakery is an establishment that produces and sells flour-based food baked in an oven such as bread, cookies, cakes, donuts, pastries, and pies.[1] Some retail bakeries are also categorized as cafés, serving coffee and tea to customers who wish to consume the baked goods on the premises.",
              style: TextStyle(
                fontFamily: 'Iphone',
                color: Color(0xff707B82),
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.pushNamed(context, 'buy', arguments: index);
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xff1CEA87),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Buy Now",
                    style: TextStyle(
                      fontFamily: 'Iphone',
                      color: Color(0xff111416),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff111416),
    );
  }
}
