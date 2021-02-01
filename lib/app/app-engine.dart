import 'package:azurehowto/app/models.dart/videos-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppEngine extends ChangeNotifier {
  List<VideosModel> myVideos;

  fetchVideos() async {
    final songsJson = await rootBundle.loadString('assets/videos.json');
    myVideos = VideoModelList.fromJson(songsJson).videoModeList;
    print(myVideos);
    notifyListeners();
  }
}
