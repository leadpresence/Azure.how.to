import 'package:azurehowto/app/models.dart/videos-model.dart';
import 'package:azurehowto/app/utils/routing.dart';
import 'package:azurehowto/ui/views/single-video.dart';
import 'package:azurehowto/ui/widgets/springBtn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:azurehowto/app/utils/margin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'springBtn.dart';

class VideosWidget extends HookWidget {
  final DocumentSnapshot data;

  const VideosWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedData = VideosModel.fromSnapshot(data);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: <Widget>[
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -7,
                      offset: Offset(0, 10),
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 25,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(4))),
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SpringButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomRouting(
                          SingleVideoPage(videodata: feedData),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(feedData.img ?? '')),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomRouting(
                              SingleVideoPage(videodata: feedData),
                        ),
                      );
                    },
                    title: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        feedData?.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        VMargin(10),
                        Text(
                          feedData?.category ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                        const VMargin(7),
                        Text(
                          feedData?.desc ?? "",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w300,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
