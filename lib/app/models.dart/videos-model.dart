import 'dart:convert';

import 'package:flutter/foundation.dart';

class VideosModel {
  String id;
  String title;
  String desc;
  String img;
  String category;
  String url;
  double length;
  bool disliked;
  VideosModel({
    this.id,
    this.title,
    this.desc,
    this.img,
    this.category,
    this.url,
    this.length,
    this.disliked,
  });

  VideosModel copyWith({
    String id,
    String title,
    String desc,
    String img,
    String category,
    String url,
    double length,
    bool disliked,
  }) {
    return VideosModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      img: img ?? this.img,
      category: category ?? this.category,
      url: url ?? this.url,
      length: length ?? this.length,
      disliked: disliked ?? this.disliked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'img': img,
      'category': category,
      'url': url,
      'length': length,
      'disliked': disliked,
    };
  }

  factory VideosModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return VideosModel(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
      img: map['img'],
      category: map['category'],
      url: map['url'],
      length: map['length'],
      disliked: map['disliked'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideosModel.fromJson(String source) => VideosModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideosModel(id: $id, title: $title, desc: $desc, img: $img, category: $category, url: $url, length: $length, disliked: $disliked)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is VideosModel &&
      o.id == id &&
      o.title == title &&
      o.desc == desc &&
      o.img == img &&
      o.category == category &&
      o.url == url &&
      o.length == length &&
      o.disliked == disliked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      desc.hashCode ^
      img.hashCode ^
      category.hashCode ^
      url.hashCode ^
      length.hashCode ^
      disliked.hashCode;
  }
}

class VideoModelList {
  List<VideosModel> videoModeList;
  VideoModelList({
    this.videoModeList,
  });

  VideoModelList copyWith({
    List<VideosModel> videoModeList,
  }) {
    return VideoModelList(
      videoModeList: videoModeList ?? this.videoModeList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoModeList': videoModeList?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory VideoModelList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return VideoModelList(
      videoModeList: List<VideosModel>.from(map['videoModeList']?.map((x) => VideosModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModelList.fromJson(String source) => VideoModelList.fromMap(json.decode(source));

  @override
  String toString() => 'VideoModelList(videoModeList: $videoModeList)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is VideoModelList &&
      listEquals(o.videoModeList, videoModeList);
  }

  @override
  int get hashCode => videoModeList.hashCode;
}
