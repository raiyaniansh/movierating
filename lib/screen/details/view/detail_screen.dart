import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movierating/screen/home/controller/home_cantroller.dart';
import 'package:movierating/screen/home/modal/home_modal.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                List? data = snapshot.data;
                return Stack(
                  children: [
                    Container(
                      height: 500,
                      width: double.infinity,
                      child: (data![0].i==null)?Text("JustWatch",
                        style: GoogleFonts.dancingScript(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1),
                      ):Image.network('${data![0].i!.imageUrl}',
                          fit: BoxFit.cover),
                    ),
                    Container(
                      height: 500,
                      width: double.infinity,
                      color: Colors.black54,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 15),
                      child: Container(decoration: BoxDecoration(color: Colors.white30,shape: BoxShape.circle),child: IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.white,size: 25,)),),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 350,
                        ),
                        Container(
                          height: 450,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  transform: GradientRotation(pi / 2),
                                  colors: [
                                Colors.blueGrey.shade900.withOpacity(0.85),
                                Colors.blueGrey.shade900,
                                Colors.blueGrey.shade900,
                              ])),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 285, left: 25, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 175,
                                width: 125,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.blueGrey.shade700)
                                ),
                                child: (data[0].i!.imageUrl==null)?Text("JustWatch",
                                  style: GoogleFonts.dancingScript(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1),
                                ):Image.network('${data[0].i!.imageUrl}',
                                    fit: BoxFit.cover),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  height: 175,
                                  width: 185,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 75,
                                      ),
                                      (snapshot.data![0].l==null)?Text(
                                        'null',
                                        style: GoogleFonts.notoSerifHebrew(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25),
                                      ):Text(
                                        '${snapshot.data![0].l}',
                                        style: GoogleFonts.notoSerifHebrew(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      (snapshot.data![0].y==null)?Text(
                                        'null',
                                        style: GoogleFonts.notoSerifHebrew(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25),
                                      ): Text(
                                        "Year : ${snapshot.data![0].y}",
                                        style: GoogleFonts.notoSerifHebrew(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      (snapshot.data![0].q==null)?Text(
                                        "null",
                                        style: GoogleFonts.notoSerifHebrew(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ):Text(
                                        "${snapshot.data![0].q}",
                                        style: GoogleFonts.notoSerifHebrew(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Storyline',
                            style: GoogleFonts.notoSerifHebrew(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,right: 15),
                            width: double.infinity,
                            height: 294,
                            child: Text('It was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly. If you a re looking for a translation of the text, its meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.he reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate.he reason we use Lorem Ipsum is simple.',style: GoogleFonts.notoSerifHebrew(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              return Center(child: CircularProgressIndicator(color: Colors.white,));
            },
            future: homeController.MovieJson(name),
          )),
    );
  }
}
