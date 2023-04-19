import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movierating/screen/home/controller/home_cantroller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.sort, color: Colors.white, size: 30),
                  Text("JustWatch",
                      style: GoogleFonts.dancingScript(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1),
                  ),
                  InkWell(onTap: () {
                    Get.toNamed('search');
                  },child: Icon(Icons.search,color: Colors.white,size: 30,))
                ],
              ),
            ),
            CarouselSlider(
              items: [
                InkWell(
                  onTap: () {
                    Get.toNamed('detail', arguments: 'rudra');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 200,
                    width: 360,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey.shade700)),
                    child: Image.network(
                        'https://tse1.mm.bing.net/th?id=OIP.gUYxdgW4fSh6eJVKX4kMLwHaEK&pid=Api&P=0',
                        fit: BoxFit.cover),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('detail', arguments: "The Great Indian Murder");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 225,
                    width: 360,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey.shade700)),
                    child: Image.network(
                        'https://tse3.mm.bing.net/th?id=OIP.ITTn0SQulYyHq6Ufg43j2AHaEK&pid=Api&P=0',
                        fit: BoxFit.cover),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('detail', arguments: "The Diplomat");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 225,
                    width: 360,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey.shade700)),
                    child: Image.network(
                        'https://tse1.mm.bing.net/th?id=OIP.8cmBLxX1qEu4FmBfC6_RiwHaEo&pid=Api&P=0',
                        fit: BoxFit.cover),
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                height: 200,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  homeController.index.value = index;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Container(
                      height: 5,
                      width: 25,
                      decoration: BoxDecoration(
                          color: (homeController.index == 0)
                              ? Colors.white
                              : Colors.white12,
                          borderRadius: BorderRadius.circular(25)),
                    )),
                SizedBox(
                  width: 5,
                ),
                Obx(() => Container(
                      height: 5,
                      width: 25,
                      decoration: BoxDecoration(
                          color: (homeController.index == 1)
                              ? Colors.white
                              : Colors.white12,
                          borderRadius: BorderRadius.circular(25)),
                    )),
                SizedBox(
                  width: 5,
                ),
                Obx(() => Container(
                      height: 5,
                      width: 25,
                      decoration: BoxDecoration(
                          color: (homeController.index == 2)
                              ? Colors.white
                              : Colors.white12,
                          borderRadius: BorderRadius.circular(25)),
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "New movie",
                style: GoogleFonts.notoSerifHebrew(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.toNamed('detail', arguments: '${homeController.moviename[index]}');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 175,
                          width: 125,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade700),
                          ),
                          child: Image.network('${homeController.movielink[index]}',fit: BoxFit.cover),
                        ),
                        SizedBox(height: 8,),
                        Text(" ${homeController.moviename[index]}",style: GoogleFonts.notoSerifHebrew(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                itemCount: homeController.movielink.length,
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "New series",
                style: GoogleFonts.notoSerifHebrew(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.toNamed('detail', arguments: '${homeController.seriesname[index]}');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 175,
                          width: 125,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade700),
                          ),
                          child: Image.network('${homeController.seriesLink[index]}',fit: BoxFit.cover),
                        ),
                        SizedBox(height: 8,),
                        Text(" ${homeController.seriesname[index]}",style: GoogleFonts.notoSerifHebrew(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                itemCount: homeController.seriesname.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
