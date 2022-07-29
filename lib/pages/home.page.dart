import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ContentHomePage extends StatefulWidget {
  const ContentHomePage({Key? key}) : super(key: key);

  @override
  State<ContentHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<ContentHomePage> {
  Color color = Colors.amber;
  int activeIndex = 0;

  final List<Map<String, dynamic>> categorylist = [
    {
      "type": "bamboo, decor",
      "name": " bamboo products ",
      "assetimg": "assets/roughimages/1-800x800.png"
    },
    {
      "name": " kouna products ",
      "assetimg": "assets/roughimages/asset kounaphakside.jpg.webp"
    },
    {"name": "lee products ", "assetimg": "assets/images/assetmoralee.jpg"},
    {
      "name": "daily commodities ",
      "assetimg": "assets/roughimages/Bamboo-Basket.webp"
    },
    {"name": "home decores ", "assetimg": "assets/roughimages/2-800x800.png"},
    {"name": "wearables ", "assetimg": "assets/roughimages/8-2.png"},
  ];
  final List<Map<String, dynamic>> bestDeals = [
    {
      "name": " premium kouna bag ",
      "assetimg": "assets/images/assetladiesbag1.jpg"
    },
    {
      "name": " premium kouna mora ",
      "assetimg": "assets/images/assetkounamora.jpg"
    },
    {"name": "yangkok ", "assetimg": "assets/images/assetyangkok.jpg"},
    {
      "name": "kouna picnic bag ",
      "assetimg": "assets/images/assetpicnicbag.jpg"
    },
    {
      "name": " premium lee mora ",
      "assetimg": "assets/images/assetmoralee.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var screeensize = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("data")),
      body: Column(
        children: [
          Expanded(
            flex: 50,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                              backgroundImage:
                                  AssetImage(categorylist[index]["assetimg"]),
                            ),
                            SizedBox(
                                width: w / 3.8,
                                child: Center(
                                    child: Text(categorylist[index]["name"])))
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: w / 20,
                ),
                Text(
                  "Our Recommendation",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple[200],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
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
                                      fontSize:
                                          MediaQuery.of(context).size.width *
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
          const Divider(
            color: Colors.grey,
          ),
          // Expanded(flex: 28, child: Column())
        ],
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
