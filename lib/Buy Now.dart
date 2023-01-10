import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Global Var.dart';

class BuyNow extends StatefulWidget {
  const BuyNow({Key? key}) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  int currentStep = 0;
  String groupValue = "";
  Widget title({required String text, required Icon icon}){
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(text,
          style: const TextStyle(
            fontFamily: 'Iphone',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        )
      ],
    );
  }
  Widget payment({required String text, required String value, required Icon icon}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(text,
            style: const TextStyle(
              fontFamily: 'Iphone',
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          Radio(
            value: value,
            activeColor: const Color(0xff111416),
            groupValue: groupValue,
            onChanged: (val){
              setState(() {
                groupValue = val.toString();
              });
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
          child: const Icon(CupertinoIcons.arrow_left, color: Colors.black),
        ),
        title: const Text("Order Details",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Iphone',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Form(
        key: Global.buyNowKey,
        child: Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(primary: Color(0xff111416)),
          ),
          child: Stepper(
            physics: const BouncingScrollPhysics(),
            elevation: 1,
            type: StepperType.horizontal,
            currentStep: currentStep,
            controlsBuilder: (context, details){
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    if (currentStep != 0) Expanded(
                      child: ElevatedButton(
                        child: const Text("BACK"),
                        onPressed: (){
                          setState(() {
                            if(currentStep > 0) currentStep--;
                          });
                        },
                      ),
                    ),
                    if (currentStep != 0) const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        child: Text(currentStep == 2 ? "CONFIRM" : "SAVE & NEXT"),
                        onPressed: (){
                          setState(() {
                            if(currentStep == 0)
                              {
                                if(Global.buyNowKey.currentState!.validate())
                                {
                                  if(currentStep < 2) currentStep++;
                                  Global.buyNowKey.currentState!.save();
                                }
                              }
                            else if(currentStep == 1)
                              {
                                if(groupValue != "")
                                  {
                                    if(currentStep < 2) currentStep++;
                                  }
                              }
                            else
                              {
                                if(currentStep < 2) currentStep++;
                                Navigator.pushNamed(context, 'orderDone');
                                Global.myOrder.add(Global.items[index]);
                              }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                state: (currentStep > 0) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 0,
                title: const Text("Address",
                  style: TextStyle(
                    fontFamily: 'Iphone',
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(text: "Contact Details", icon: const Icon(CupertinoIcons.phone)),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: Global.userName,
                      validator: (val){
                        if(val!.isEmpty)
                        {
                          return "Please Enter Your Name";
                        }
                      },
                      style: const TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          fontFamily: 'Iphone',
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          fontFamily: 'Iphone',
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val){
                        setState(() {
                          Global.userName = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      initialValue: Global.userPhone,
                      validator: (val){
                        if(val!.isEmpty)
                        {
                          return "Please Enter Your Phone Number";
                        }
                      },
                      style: const TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontFamily: 'Iphone',
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          fontFamily: 'Iphone',
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val){
                        setState(() {
                          Global.userPhone = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    title(text: "Address", icon: const Icon(Icons.location_on_outlined)),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: Global.userAdd,
                      validator: (val){
                        if(val!.isEmpty)
                        {
                          return "Please Enter Your Address";
                        }
                      },
                      style: const TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Address",
                        hintStyle: TextStyle(
                          fontFamily: 'Iphone',
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          fontFamily: 'Iphone',
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val){
                        setState(() {
                          Global.userAdd = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: Global.userPinCode,
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Please Enter Pin Code";
                              }
                            },
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "Pin Code",
                              hintStyle: TextStyle(
                                fontFamily: 'Iphone',
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                fontFamily: 'Iphone',
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val){
                              setState(() {
                                Global.userPinCode = val.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: Global.userCity,
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Please Enter Your City";
                              }
                            },
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "City",
                              hintStyle: TextStyle(
                                fontFamily: 'Iphone',
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                fontFamily: 'Iphone',
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val){
                              setState(() {
                                Global.userCity = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: Global.userState,
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Please Enter Your State";
                              }
                            },
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "State",
                              hintStyle: TextStyle(
                                fontFamily: 'Iphone',
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                fontFamily: 'Iphone',
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val){
                              setState(() {
                                Global.userState = val.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: Global.userCountry,
                            validator: (val){
                              if(val!.isEmpty)
                              {
                                return "Please Enter Your Country";
                              }
                            },
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "Country",
                              hintStyle: TextStyle(
                                fontFamily: 'Iphone',
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                fontFamily: 'Iphone',
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val){
                              setState(() {
                                Global.userCountry = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Step(
                state: (currentStep > 1) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 1,
                title: const Text("Payment",
                  style: TextStyle(
                    fontFamily: 'Iphone',
                  ),
                ),
                content: Column(
                  children: [
                    payment(text: "UPI (GPay / PhonePe)", icon: const Icon(CupertinoIcons.briefcase, size: 26), value: 'UPI (GPay / PhonePe)'),
                    payment(text: "Wallet", icon: const Icon(Icons.account_balance_wallet_outlined, size: 26), value: 'Wallet'),
                    payment(text: "Debit / Credit Card", icon: const Icon(Icons.credit_card_rounded, size: 26), value: 'Debit / Credit Card'),
                    payment(text: "Net Banking", icon: const Icon(Icons.account_balance_outlined, size: 26), value: 'Net Banking'),
                    payment(text: "Cash on Delivery", icon: const Icon(CupertinoIcons.money_dollar_circle, size: 26), value: 'Cash on Delivery'),
                  ],
                ),
              ),
              Step(
                state: (currentStep > 2) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 2,
                title: const Text("Summary",
                  style: TextStyle(
                    fontFamily: 'Iphone',
                  ),
                ),
                content: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: _width,
                      child: Row(
                        children: [
                          Image.asset(Global.items[index]['image'], height: 60),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Global.items[index]['name'],
                                style: const TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text("Quantity : ${Global.items[index]['quantity']}",
                                style: const TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Color(0xff858589),
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text("₹ ${int.parse(Global.items[index]['price']) * Global.items[index]['quantity']}",
                                style: const TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    (Global.items[index]['quantity'] > 1) ? Global.items[index]['quantity']-- : 1;
                                  });
                                },
                                child: const Icon(CupertinoIcons.minus_circle_fill, size: 28, color: Color(0xff111416),),
                              ),
                              const SizedBox(width: 10),
                              Text(Global.items[index]['quantity'].toString(),
                                style: const TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Global.items[index]['quantity']++;
                                  });
                                },
                                child: const Icon(CupertinoIcons.add_circled_solid, size: 28, color: Color(0xff111416),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Delivery Address",
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText("${Global.userName} +91 ${Global.userPhone}",
                        style: const TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("${Global.userAdd}, ${Global.userCity}, ${Global.userState}, ${Global.userCountry} - ${Global.userPinCode}",
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Payment Mode",
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(groupValue,
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Price Details(${Global.items[index]['quantity']} Item)",
                        style: const TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Total Price",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const Spacer(),
                        Text("+ ₹${int.parse(Global.items[index]['price']) * Global.items[index]['quantity']}",
                          style: const TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text("Total Discounts",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.red,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Spacer(),
                        Text("- ₹0",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.red,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("Order Total",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const Spacer(),
                        Text("₹${int.parse(Global.items[index]['price']) * Global.items[index]['quantity']}",
                          style: const TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffFFFFFF),
    );
  }
}
