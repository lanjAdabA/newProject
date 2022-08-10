import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

String dropdownValue = ' * more categories * ';

class ContentHomePage extends StatefulWidget {
  const ContentHomePage({Key? key}) : super(key: key);

  @override
  State<ContentHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<ContentHomePage> {
  // final CategoriesScroller categoriesScroller = CategoriesScroller();
  // ScrollController controller = ScrollController();
  // bool closeTopContainer = false;
  Color color = Colors.amber;
  int activeIndex = 0;

  final List<Map<String, dynamic>> categorylist = [
    {
      "type": "bamboo, decor",
      "name": " bamboo products ",
      "assetimg": "assets/images/bamboovase.png"
    },
    {
      "name": " kouna products ",
      "assetimg": "assets/images/kounaphakside.webp"
    },
    {"name": "lee products ", "assetimg": "assets/images/leemora.jpg"},
    {
      "name": "daily commodities ",
      "assetimg": "assets/images/bamboobasket.webp"
    },
    {"name": "home decores ", "assetimg": "assets/images/bamboolamp1.png"},
    {"name": "wearables ", "assetimg": "assets/images/bamboohairpin.png"},
  ];
  final List<Map<String, dynamic>> bestDeals = [
    {
      "name": " premium kouna purse ",
      "assetimg": "assets/images/kounaladiespurse.jpg"
    },
    {"name": " premium kouna mora ", "assetimg": "assets/images/kounamora.jpg"},
    {"name": " yangkok ", "assetimg": "assets/images/yangkok.jpg"},
    {
      "name": " kouna picnic bag ",
      "assetimg": "assets/images/kounapicnicbag.jpg"
    },
    {"name": " premium lee mora ", "assetimg": "assets/images/leemora.jpg"},
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(() {
  //     setState(() {
  //       closeTopContainer = controller.offset > 50;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var screeensize = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("data")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // AnimatedContainer(
              //   // color: Colors.amber,
              //   width: w,
              //   alignment: Alignment.topCenter,
              //   // height: closeTopContainer ? 0 : h * .48,
              //   duration: const Duration(milliseconds: 500),
              //   child:
              Container(
                color: Colors.green[100],
                child: Column(
                  children: [
                    Container(
                      // color: Colors.grey[100],
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Shop by category"),
                          DropdownButton(
                            autofocus: true,
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 15,
                            style: TextStyle(color: Colors.purple[200]),
                            underline: Container(
                              height: 1,
                              color: Colors.purple[300],
                            ),
                            items: [
                              ' * more categories * ',
                              ' kouna products',
                              ' bamboo products',
                              ' cane products',
                              ' wearable accessories',
                              ' home decors ',
                              ' house hold essentials',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: w / 3.5,
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      color: Colors.grey[100],
                      child: ListView.builder(
                          itemCount: categorylist.length,
                          addRepaintBoundaries: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                // Center(
                                //   child: Text("data"),
                                // )
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                      categorylist[index]["assetimg"]),
                                ),
                                SizedBox(
                                    width: w / 3.8,
                                    child: Center(
                                        child:
                                            Text(categorylist[index]["name"])))
                              ],
                            );
                          }),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      endIndent: w / 30,
                      indent: w / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 16)),
                        Text(
                          "Our Recommendation",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple[200],
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        enableInfiniteScroll: true,
                        viewportFraction: .8,
                        height: screeensize.height * .25,
                      ),
                      items: bestDeals.map((bestDeals) {
                        return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(color: Colors.purple)),
                            width: MediaQuery.of(context).size.width * 4.3,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 280,
                                  child: Image(
                                      image: AssetImage(bestDeals["assetimg"])),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      bestDeals['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .04),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      }).toList(),
                    ),
                    buildIndicator(),
                  ],
                ),
              ),
              // ),
              Divider(
                color: Colors.blueGrey,
                endIndent: w / 30,
                indent: w / 30,
              ),
              ItemList(
                  h: h,
                  // controller: controller,
                  categorylist: categorylist,
                  w: w),
            ],
          ),
        ),
      ),
    );
  }

  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: bestDeals.length,
        effect: const WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: Colors.grey,
            activeDotColor: Colors.black),
      );
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.h,
    // required this.controller,
    required this.categorylist,
    required this.w,
  }) : super(key: key);

  final double h;
  // final ScrollController controller;
  final List<Map<String, dynamic>> categorylist;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      // height: h / 2.5,
      child: ListView.builder(
          // controller: controller,
          itemCount: categorylist.length,
          addRepaintBoundaries: true,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.amber[200],
              child: Row(
                children: [
                  // Center(
                  //   child: Text("data"),
                  // )
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage(categorylist[index]["assetimg"]),
                  ),
                  ClipOval(
                      child: SizedBox(
                    height: h / 8,
                    child: Image(
                        image: AssetImage(categorylist[index]["assetimg"])),
                  )),
                  SizedBox(
                      width: w / 3.8,
                      child: Center(child: Text(categorylist[index]["name"])))
                ],
              ),
            );
          }),
    );
  }
}
