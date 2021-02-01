import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final DocumentReference reference;
  VideosModel({
    this.id,
    this.title,
    this.desc,
    this.img,
    this.category,
    this.url,
    this.length,
    this.disliked,
    this.reference,
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
    DocumentReference reference,
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
      reference: reference ?? this.reference,
    );
  }


    VideosModel.fromJson(Map<String,dynamic> json,{this.reference}){
    title=json['title'];
    desc=json['desc'];
    img=json['img'];
    category=json['category'];
    url=json['url'];
    length=json['length'];
    disliked=json['disliked'];
    
  }


  VideosModel.fromMap(Map<String,dynamic> map,{this.reference}){
    title=map['title'];
    desc=map['desc'];
    img=map['img'];
    category=map['category'];
    url=map['url'];
    length=map['length'];
    disliked=map['disliked'];
    
  }

  Map<String ,dynamic> toJson(){
    final Map<String, dynamic> json = new Map<String, dynamic>();
      json['title'] = this.title;
    json['desc'] = this.desc;
    json['img'] = this.img;
    json['url'] = this.url;
    json['category'] = this.category;
    json['length'] = this.length;
    json['disliked'] = this.disliked;

  }



  VideosModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);


  @override
  String toString() {
    return 'VideosModel(id: $id, title: $title, desc: $desc, img: $img, category: $category, url: $url, length: $length, disliked: $disliked, reference: $reference)';
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
      o.disliked == disliked &&
      o.reference == reference;
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
      disliked.hashCode ^
      reference.hashCode;
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
      'videoModeList': videoModeList?.map((x) => x?.toJson())?.toList(),
    };
  }

  factory VideoModelList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return VideoModelList(
      videoModeList: List<VideosModel>.from(
          map['videoModeList']?.map((x) => VideosModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModelList.fromJson(String source) =>
      VideoModelList.fromMap(json.decode(source));

  @override
  String toString() => 'VideoModelList(videoModeList: $videoModeList)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VideoModelList && listEquals(o.videoModeList, videoModeList);
  }

  @override
  int get hashCode => videoModeList.hashCode;
}
