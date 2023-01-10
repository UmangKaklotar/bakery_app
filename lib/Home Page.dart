import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Global Var.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectCategory = "Cake";
  List image = [
    'build/image/bakery1.jpg',
    'build/image/bakery2.jpg',
    'build/image/bakery3.jpg',
    'build/image/bakery4.jpg',
    'build/image/bakery5.jpg',
  ];
  Widget category({required Image image, required String text}){
    return Container(
      padding: const EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        color: (selectCategory == text) ? const Color(0xff1CEA87) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: (selectCategory == text) ? Colors.transparent : const Color(0xff707B82),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: (selectCategory == text) ? const Color(0xff111416) : const Color(0xff1E2326),
              borderRadius: BorderRadius.circular(20),
            ),
            child: image,
          ),
          const Spacer(),
          Text(text,
            style: TextStyle(
              color: (selectCategory == text) ? const Color(0xff111416) : Colors.white,
              fontSize: 18,
              fontFamily: 'Iphone',
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
  Widget profileInformation({required Icon icon, required String text}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff1E2326),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(text,
            style: const TextStyle(
              fontFamily: 'Iphone',
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          const Icon(CupertinoIcons.forward, color: Colors.white),
        ],
      ),
    );
  }
  Widget profileText({required String text}){
    return Text(text,
      style: const TextStyle(
        fontFamily: 'Iphone',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }
  final searchItem = ValueNotifier<String>('');
  TextEditingController clearSearch = TextEditingController();
  void selectIndex(int index){
    setState(() {
      Global.selectPage = index;
      searchItem.value = '';
      clearSearch.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final iWillPop = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context){
              return AlertDialog(
                title: const Text("Are You Sure to Exit ?"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text("Yes"),
                    onPressed: (){Navigator.pop(context,true);},
                  ),
                  TextButton(
                    child: const Text("No"),
                    onPressed: (){Navigator.pop(context,false);},
                  ),
                ],
              );
            }
        );
        return iWillPop;
      },
      child: Scaffold(
        body: IndexedStack(
          index: Global.selectPage,
          children: [
            // Home 0
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      AutoSizeText("Hello ! ${Global.profileName}",
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: 'Iphone',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            Global.selectPage = 1;
                          });
                        },
                        child: const Icon(CupertinoIcons.search_circle,size: 35,color: Color(0xffB6BFC5),),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            Global.selectPage = 3;
                          });
                        },
                        child: (Global.image == null)
                            ? const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('build/image/B.png'),
                        )
                            : CircleAvatar(
                          radius: 15,
                          backgroundImage: FileImage(Global.image!),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: _height - 160,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        child: CarouselSlider(
                          items: image.map((e) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(e,
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Category",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectCategory = "Cake";
                                  });
                                },
                                child: category(image: Image.asset('build/image/cake.png'), text: 'Cake'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectCategory = "Bread";
                                  });
                                },
                                child: category(image: Image.asset('build/image/bread.png'), text: 'Bread'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectCategory = "Donut";
                                  });
                                },
                                child: category(image: Image.asset('build/image/donut.png'), text: 'Donut'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectCategory = "Biscuit";
                                  });
                                },
                                child: category(image: Image.asset('build/image/biscuit.png'), text: 'Biscuit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectCategory,
                              style: const TextStyle(
                                fontFamily: 'Iphone',
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  Global.selectPage = 1;
                                });
                              },
                              child: const Text("See All",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Color(0xff707B82),
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        height: 270,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Global.items.length,
                          itemBuilder: (context, index) =>
                          (selectCategory == Global.items[index]['category'])
                              ? GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, 'detail', arguments: index);
                            },
                                child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(15),
                            width: 176,
                            decoration: BoxDecoration(
                                  color: const Color(0xff1E2326),
                                  borderRadius: BorderRadius.circular(30)
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 130,
                                    width: _width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff464E54),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(Global.items[index]['image']),
                                  ),
                                  const SizedBox(height: 20),
                                  AutoSizeText(Global.items[index]['name'],
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontFamily: 'Iphone',
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text("₹ ${Global.items[index]['price']}",
                                    style: const TextStyle(
                                      fontFamily: 'Iphone',
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pushNamed(context, 'detail', arguments: index);
                                        },
                                        child: const Text("See All Details",
                                          style: TextStyle(
                                            fontFamily: 'Iphone',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pushNamed(context, 'buy', arguments: index);
                                        },
                                        child: const Icon(CupertinoIcons.add_circled_solid,color: Color(0xff1CEA87),),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                            ),
                          ),
                              )
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Search 1
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1E2326),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: clearSearch,
                      style: const TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search,
                          color: Color(0xff707B82),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontFamily: 'Iphone',
                          color: Color(0xff707B82),
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        prefixIconColor: Colors.white,
                      ),
                      onChanged: (val){
                        setState(() {
                          searchItem.value = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: _height - 180,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        (searchItem.value != '')
                            ? Expanded(
                          child: Column(
                            children: Global.items.map((e) =>
                            (e['name'].toUpperCase().contains(searchItem.value.toUpperCase()))
                                ? GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, 'detail', arguments: Global.items.indexOf(e));
                              },
                              child: Container(
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
                                        Text(e['category'],
                                          style: const TextStyle(
                                            fontFamily: 'Iphone',
                                            color: Color(0xff707B82),
                                            fontSize: 18,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text("₹ ${e['price']}",
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
                                  ],
                                ),
                              ),
                            )
                                : Container()
                            ).toList(),
                          ),
                        )
                            : SizedBox(
                          height: _height - 195,
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.6/1,
                              ),
                              itemCount: Global.items.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, 'detail', arguments: index);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff1E2326),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        height: 150,
                                        width: _width,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff464E54),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(Global.items[index]['image']),
                                      ),
                                      const SizedBox(height: 30),
                                      AutoSizeText(Global.items[index]['name'],
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontFamily: 'Iphone',
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text("₹ ${Global.items[index]['price']}",
                                        style: const TextStyle(
                                          fontFamily: 'Iphone',
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.pushNamed(context, 'detail', arguments: index);
                                            },
                                            child: const Text("See All Details",
                                              style: TextStyle(
                                                fontFamily: 'Iphone',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.pushNamed(context, 'buy', arguments: index);
                                            },
                                            child: const Icon(CupertinoIcons.add_circled_solid,color: Color(0xff1CEA87),),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Add Cart 2
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              Global.selectPage = 0;
                            });
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
                          child: Text("My Cart",
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: _height - 185,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: Global.items.map((e) {
                        return (e['cart'] == true) ? GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.pushNamed(context, 'detail', arguments: Global.items.indexOf(e));
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 150,
                            width: _width,
                            decoration: BoxDecoration(
                              color: const Color(0xff1E2326),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: _height,
                                  width: 116,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(e['image'], height: 75),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                (e['quantity'] > 1) ? e['quantity']-- : 1;
                                              });
                                            },
                                            child: const Icon(CupertinoIcons.minus_circle_fill, size: 28, color: Color(0xff1CEA87),),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(e['quantity'].toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Iphone',
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                e['quantity']++;
                                              });
                                            },
                                            child: const Icon(CupertinoIcons.add_circled_solid, size: 28, color: Color(0xff1CEA87),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(e['name'],
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontFamily: 'Iphone',
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    AutoSizeText(e['category'],
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontFamily: 'Iphone',
                                        color: Color(0xff707B82),
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    AutoSizeText("⭐ ${e['star']}  |  ⏱ ${e['time']}",
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontFamily: 'Iphone',
                                        color: Color(0xffFFFFFF),
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    AutoSizeText("₹ ${int.parse(e['price']) * e['quantity']}",
                                      maxLines: 1,
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
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        e['cart'] = !e['cart'];
                                        e['quantity'] = 1;
                                      });
                                    },
                                    child: const Icon(CupertinoIcons.delete, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ) : Container();
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Profile 3
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              Global.selectPage = 0;
                            });
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
                          child: Text("My Profile",
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: _height - 185,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(height: 20),
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
                                onTap: (){
                                  Navigator.pushNamed(context, 'edit');
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff111416),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(CupertinoIcons.add_circled_solid, size: 30, color: Color(0xff1CEA87)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(Global.profileName,
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(Global.emailID,
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              color: Color(0xff707B82),
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        profileText(text: 'Personal Information'),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, 'edit');
                          },
                          child: profileInformation(icon: const Icon(Icons.edit_rounded, color: Colors.white), text: 'Edit Profile'),
                        ),
                        profileInformation(icon: const Icon(Icons.account_balance_outlined, color: Colors.white), text: 'My Bank'),
                        profileInformation(icon: const Icon(CupertinoIcons.location, color: Colors.white), text: 'Address'),
                        const SizedBox(height: 15),
                        profileText(text: 'Your Wish List'),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Global.selectPage = 2;
                            });
                          },
                          child: profileInformation(icon: const Icon(CupertinoIcons.cart, color: Colors.white), text: 'My Cart'),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, 'myOrder');
                          },
                          child: profileInformation(icon: const Icon(CupertinoIcons.bag, color: Colors.white), text: "My Order"),
                        ),
                        const SizedBox(height: 15),
                        profileText(text: 'Promotion'),
                        const SizedBox(height: 10),
                        profileInformation(icon: const Icon(CupertinoIcons.gift, color: Colors.white), text: 'Rewards'),
                        profileInformation(icon: const Icon(CupertinoIcons.money_dollar_circle, color: Colors.white), text: 'Refer & Earn'),
                        profileInformation(icon: const Icon(Icons.local_offer_outlined, color: Colors.white), text: 'Offers'),
                        const SizedBox(height: 15),
                        profileText(text: 'Support'),
                        const SizedBox(height: 10),
                        profileInformation(icon: const Icon(CupertinoIcons.info_circle, color: Colors.white), text: 'About'),
                        profileInformation(icon: const Icon(CupertinoIcons.question_circle, color: Colors.white), text: 'Help & Support'),
                        const SizedBox(height: 15),
                        profileText(text: 'Action'),
                        const SizedBox(height: 10),
                        profileInformation(icon: const Icon(CupertinoIcons.square_arrow_right, color: Colors.white), text: 'Log Out'),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text("Version 22.930.1420",
                            style: TextStyle(
                              fontFamily: 'Iphone',
                              color: Color(0xff707B82),
                              fontSize: 18,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // floatingActionButton: (Global.selectPage == 2) ? Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 20),
        //   height: 100,
        //   width: _width,
        //   decoration: BoxDecoration(
        //     color: const Color(0xff464E54),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ) : Container(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: const Color(0xff111416),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: Global.selectPage,
          onTap: selectIndex,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Iphone',
            letterSpacing: 0.5,
          ),
          selectedItemColor: const Color(0xff1CEA87),
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xff1E2326),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: "Home",
              backgroundColor: Color(0xff1E2326),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Search",
              backgroundColor: Color(0xff1E2326),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
              backgroundColor: Color(0xff1E2326),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "Profile",
              backgroundColor: Color(0xff1E2326),
            ),
          ],
        ),
      ),
    );
  }
}
