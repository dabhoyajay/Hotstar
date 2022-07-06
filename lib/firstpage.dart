import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/list.dart';
import 'package:hotstar/secondpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  list l = list();
  int cnt = 0;

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
  }

  int c = 0;
  int currentpoint = 0;
  bool kidssafe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.black26,
              leading: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                  setState(() {});
                },
                alignment: Alignment.bottomCenter,
                splashColor: Colors.black,
                highlightColor: Colors.black,
                icon: Icon(Icons.menu_rounded, color: Colors.white70),
              ),
              title: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      child: Image.asset("images/hotstarlogo.png"),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                        child: IconButton(
                      onPressed: () {},
                      alignment: Alignment.bottomRight,
                      splashColor: Colors.black,
                      highlightColor: Colors.black,
                      icon: Icon(Icons.search_rounded, color: Colors.white70),
                    )),
                  ],
                ),
              ),
            )
          ],
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.45,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentpoint = index;
                        });
                      },
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 80),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: l.pageview.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: Image.asset(
                                  "images/pageview/$i",
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentpoint),
                  count: l.pageview.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white38,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 5),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(0);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[0]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.latest_trending_1.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.latest_trending_1[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(1);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[1]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.popular_show_2.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.popular_show_2[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(2);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[2]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.movie_recomended_3.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.movie_recomended_3[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(3);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[3]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.show_recomended_4.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.show_recomended_4[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(4);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[4]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.popular_movie_5.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.popular_movie_5[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(5);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[5]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.foreign_dubbed_6.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.foreign_dubbed_6[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(6);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[6]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.hotstar_special_7.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.hotstar_special_7[index]}",
                                    height: 100,
                                    width: 150),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(20, 10)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(7);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[7]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.newonhotstar_8.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.newonhotstar_8[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(8);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[8]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.multiplex_movie_9.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.multiplex_movie_9[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(9);
                      },
                    ));
                  },
                  splashColor: Colors.black,
                  highlightColor: Colors.black,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
                          child: Text(
                            "${l.category[9]}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.navigate_next_rounded,
                              size: 30, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: l.quix_show_10.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                child: Image.asset(
                                    "images/${l.quix_show_10[index]}",
                                    height: 150,
                                    width: 110),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              cnt = value;
            });
          },
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: cnt,
          unselectedItemColor: Colors.white60,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv_rounded),
                label: "TV",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/disney+logo.png",
                  height: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_rounded),
                label: "Movies",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_cricket_rounded),
                label: "Sports",
                backgroundColor: Colors.black),
          ]),
      drawer: Drawer(
        child: Drawer_fun(),
      ),
    );
  }

  Drawer_fun() {
    return Container(
      color: Color(0xFF0C0C0C),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              alignment: Alignment.center,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.white38,
                    child: Icon(Icons.perm_identity, color: Colors.black)),
                title: Text("Log In",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                subtitle: Text("For a better experience",
                    style: TextStyle(color: Colors.white38)),
                trailing:
                    Icon(Icons.navigate_next_rounded, color: Colors.white38),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: double.infinity,
              color: Colors.white12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset("images/kids.png")),
                  Expanded(
                      child: Text(
                    "Safe",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange[300],
                        fontWeight: FontWeight.bold),
                  )),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      child: Container(
                    child: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                          onChanged: (value) {
                            if (kidssafe) {
                              kidssafe = false;
                            } else {
                              kidssafe = true;
                            }
                            setState(() {});
                          },
                          activeColor: Colors.blue,
                          value: kidssafe),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 50,
              width: double.infinity,

            )
          ],
        ),
      ),
    );
  }
}

// return Container(
//   color: Color(0xFF151515),
//   child: ListView(
//     children: [
//       DrawerHeader(
//           child: Column(
//         children: [
//           Expanded(
//             child: ListTile(
//               leading: CircleAvatar(
//                   backgroundColor: Colors.white38,
//                   child: Icon(Icons.perm_identity, color: Colors.black)),
//               title: Text("Log In",
//                   style: TextStyle(fontSize: 18, color: Colors.white)),
//               subtitle: Text("For a better experience",
//                   style: TextStyle(color: Colors.white38)),
//               trailing:
//                   Icon(Icons.navigate_next_rounded, color: Colors.white38),
//             ),
//           ),
//           Expanded(child: Container(
//           color: Colors.white38,
//             child: Row(
//               children: [
//                 Expanded(child: Image.asset("images/kids.png")),
//                 Expanded(child: Text("Safe",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange[300]),)),
//                 Spacer(),
//                 Expanded(child: Container(color: Colors.green,))
//               ],
//             ),
//           ))
//         ],
//       )),
//       DrawerHeader(
//         decoration: BoxDecoration(
//           color: Colors.blue,
//         ),
//         child: Text('Drawer Header'),
//       ),
//       ListTile(
//         title: const Text('Item 1'),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: const Text('Item 2'),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//     ],
//   ),
// );
