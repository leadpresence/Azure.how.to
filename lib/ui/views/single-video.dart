import 'package:azurehowto/app/models.dart/videos-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SingleVideoPage extends StatefulWidget {
  final VideosModel videodata;

  SingleVideoPage({Key key,this.videodata}) : super(key: key);

  @override
  _SingleVideoPageState createState() => _SingleVideoPageState();
}

class _SingleVideoPageState extends State<SingleVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: 
       
       CircularProgressIndicator()),
    );
  }
}