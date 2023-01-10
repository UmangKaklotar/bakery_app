import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Global Var.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Widget profileText({required String text}){
    return Text(text,
      style: const TextStyle(
        fontFamily: 'Iphone',
        color: Color(0xff707B82),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.name.text = Global.profileName;
    Global.email.text = Global.emailID;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: Global.profileKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
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
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text("Edit Profile",
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Stack(
                  alignment: const Alignment(1,0.9),
                  children: [
                    (Global.image == null)
                        ? const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('build/image/B.png'),
                    )
                        : CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(Global.image!),
                    ),
                    GestureDetector(
                      onTap: () async {
                        XFile? pic = await ImagePicker().pickImage(source: ImageSource.camera);
                        if(pic != null)
                        {
                          setState(() {
                            Global.image = File(pic.path);
                          });
                        }
                      },
                      child: GestureDetector(

                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff111416),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(CupertinoIcons.add_circled_solid, size: 30, color: Color(0xff1CEA87)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              profileText(text: "Your Full Name"),
              const SizedBox(height: 5),
              TextFormField(
                controller: Global.name,
                maxLength: 20,
                keyboardType: TextInputType.name,
                validator: (val){
                  if(val!.isEmpty)
                  {
                    return "Please Enter Your Email ID";
                  }
                },
                style: const TextStyle(
                  fontFamily: 'Iphone',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  border: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff707B82),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff707B82),
                    ),
                  ),
                  hintText: "Full Name",
                  hintStyle: const TextStyle(
                    fontFamily: 'Iphone',
                    color: Color(0xff707B82),
                    fontSize: 18,
                  ),
                  errorStyle: const TextStyle(
                    fontFamily: 'Iphone',
                    letterSpacing: 0.2,
                  ),
                  suffix: GestureDetector(
                    onTap: (){
                      setState(() {
                        Global.name.clear();
                      });
                    },
                    child: const Icon(CupertinoIcons.clear_circled_solid, color: Color(0xff707B82)),
                  ),
                ),
                onSaved: (val){
                  setState(() {
                    Global.profileName = val.toString();
                  });
                },
              ),
              const SizedBox(height: 40),
              profileText(text: "Email Address"),
              const SizedBox(height: 5),
              TextFormField(
                controller: Global.email,
                keyboardType: TextInputType.emailAddress,
                validator: (val){
                  if(val!.isEmpty)
                  {
                    return "Please Enter Your Email ID";
                  }
                },
                style: const TextStyle(
                  fontFamily: 'Iphone',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff707B82),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff707B82),
                    ),
                  ),
                  hintText: "Email Id",
                  hintStyle: const TextStyle(
                    fontFamily: 'Iphone',
                    color: Color(0xff707B82),
                    fontSize: 18,
                  ),
                  errorStyle: const TextStyle(
                    fontFamily: 'Iphone',
                    letterSpacing: 0.2,
                  ),
                  suffix: GestureDetector(
                    onTap: (){
                      setState(() {
                        Global.email.clear();
                      });
                    },
                    child: const Icon(CupertinoIcons.clear_circled_solid, color: Color(0xff707B82)),
                  ),
                ),
                onSaved: (val){
                  setState(() {
                    Global.emailID = val.toString();
                  });
                },
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffFFFFFF),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Cancel",
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(Global.profileKey.currentState!.validate())
                        {
                          Global.profileKey.currentState!.save();
                          Navigator.popAndPushNamed(context, 'home',);
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xff1CEA87),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Save",
                        style: TextStyle(
                          fontFamily: 'Iphone',
                          color: Color(0xff111416),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff111416),
    );
  }
}
