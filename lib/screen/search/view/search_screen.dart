import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movierating/screen/home/controller/home_cantroller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueGrey.shade700)),
                child: TextField(
                    controller: txtsearch,
                    onChanged: (value) {
                      homeController.name = txtsearch.text;
                      setState(() {
                        homeController.MovieJson(homeController.name);
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.toNamed('detail',
                          arguments: "${homeController.movie[index].l}");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                              height: 75,
                              width: 50,
                              child: (homeController.movie[index].i == null)
                                  ? Container(
                                alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white12,
                                        border: Border.all(color: Colors.blueGrey.shade700)
                                      ),
                                      child: Text(
                                        "JustWatch",
                                        style: GoogleFonts.dancingScript(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1),
                                      ),
                                    )
                                  : Image.network(
                                      "${homeController.movie[index].i.imageUrl}",
                                      fit: BoxFit.cover,
                                    )),
                          SizedBox(width: 15,),
                          Text(
                            "${homeController.movie[index].l}",
                            style: GoogleFonts.notoSerifHebrew(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    )),
                itemCount: homeController.movie.length,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
