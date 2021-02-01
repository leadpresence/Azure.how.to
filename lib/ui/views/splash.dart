import 'package:azurehowto/ui/views/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:azurehowto/app/utils/margin.dart';
import 'package:azurehowto/app/utils/routing.dart';



class SpalashPage extends StatelessWidget {
  final String title;
  const SpalashPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: <Widget>[
                Container(
                  height: 260,
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Image(
                      image: CachedNetworkImageProvider(
                          'https://image.freepik.com/free-vector/webinar-concept-illustration_114360-4764.jpg')),
                ),
                const VMargin(50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    'Get Started ',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const VMargin(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    'Learn the basics of using and navigating around the Azure Portal , watch shot precise videos by product managers from the Microsoft team. Each video gets cached after firt watch!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      height: 1.6,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const VMargin(45),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  height: 50,
                    
                  child: FlatButton(
                    color:Color(0xFF34495e),
                    textColor: Colors.white,
                    child: Text('Start Learning'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomRouting(Home()),
                      );
                    },
                  ),
                ),
                const VMargin(50),
              ],
            ),
          );
        });
  }
  }
