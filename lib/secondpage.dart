import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotstar/firstpage.dart';

import 'list.dart';

class secondpage extends StatefulWidget {
  int i;

  secondpage(this.i);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  list l = list();
  String temp = "";
  List<String> tempimage = [];

  @override
  void initState() {
    super.initState();
    switch (widget.i) {
      case 0:
        {
          temp = l.category[0];
          tempimage = l.latest_trending_1;
          break;
        }
      case 1:
        {
          temp = l.category[1];
          tempimage = l.popular_show_2;
          break;
        }
      case 2:
        {
          temp = l.category[2];
          tempimage = l.movie_recomended_3;
          break;
        }
      case 3:
        {
          temp = l.category[3];
          tempimage = l.show_recomended_4;
          break;
        }
      case 4:
        {
          temp = l.category[4];
          tempimage = l.popular_movie_5;
          break;
        }
      case 5:
        {
          temp = l.category[5];
          tempimage = l.foreign_dubbed_6;
          break;
        }
      case 6:
        {
          temp = l.category[6];
          tempimage = l.hotstar_special_7;
          break;
        }
      case 7:
        {
          temp = l.category[7];
          tempimage = l.newonhotstar_8;
          break;
        }
      case 8:
        {
          temp = l.category[8];
          tempimage = l.multiplex_movie_9;
          break;
        }
      case 9:
        {
          temp = l.category[9];
          tempimage = l.quix_show_10;
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              title: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                  width: MediaQuery.of(context).size.width*0.63,
                      alignment: Alignment.centerLeft,
                      child: Text(temp, style: TextStyle(fontSize: 20,overflow: TextOverflow.fade),overflow: TextOverflow.fade,softWrap: true),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width*0.12,
                        child: IconButton(
                      onPressed: () {},
                      alignment: Alignment.center,
                      splashColor: Colors.black,
                      highlightColor: Colors.black,
                      icon: Icon(Icons.search_rounded, color: Colors.white70),
                    )),
                  ],
                ),
              ),
            )
          ],
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            height: double.infinity,
            width: double.infinity,
            child: GridView.builder(
                itemCount: tempimage.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "This is Toast",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black87,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset("images/${tempimage[index]}",
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.75)),
          ),
        ),
      ),
    );
  }
}
