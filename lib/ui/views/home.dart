import 'package:azurehowto/app/utils/margin.dart';
import 'package:azurehowto/ui/widgets/videos-widgets.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:azurehowto/app/providers.dart';
class Home extends StatefulHookWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    loadData() async {
    context.read(videosVM).loadData(context);
  }
  @override
  @override
  Widget build(BuildContext context) {
    
    var provider = useProvider(videosVM);
    return Scaffold(
      
        // brightness: Brightness.light,
              backgroundColor: Colors.white,

    
          body: SafeArea(
                      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
              children: <Widget>[
                // const VMargin(20),
                SizedBox(width: 50,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
            BoxShadow(
              spreadRadius: -12,
              offset: Offset(0, 10),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 25,
            ),
        ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: new TextField(
        controller: provider.filter,
        style: TextStyle(color: Colors.grey),
        decoration: new InputDecoration(
            border: InputBorder.none,
            prefixIcon: new Icon(FluentIcons.search_24_regular),
            hintText: 'Search for a videos...',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        ),
                  ),
                ),
                const VMargin(30),
              
                Expanded(
                  child: BuildUI(),
                ),
              ],
            ),
      ),
          ),
    );
  }
}

class BuildUI extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(videosVM);
    return StreamBuilder<QuerySnapshot>(
      stream: provider.videos,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: Container(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
            ),
          );
        return BuildVideoList(snapshot.data.docs);
      },
    );
  }
}




class BuildVideoList extends HookWidget {
  final List<DocumentSnapshot> snapshot;

  const BuildVideoList(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(videosVM);
    return snapshot.length > 0 ? 
    Column(children: [
            for (var data in snapshot.reversed.toList())
              if (provider.filter.text.isNotEmpty)
                if (data
                        .data()['title']
                        .toLowerCase()
                        .contains(provider.searchText.toLowerCase()) ||
                    data
                        .data()['desc']
                        .toLowerCase()
                        .contains(provider.searchText.toLowerCase()) ||
                    data
                        .data()['category']
                        .toLowerCase()
                        .contains(provider.searchText.toLowerCase())
                        )
                  VideosWidget(data: data)
                else
                  Container()
              else
                VideosWidget(data: data)
          ])
        : Center(
            child: Column(
              children: <Widget>[
                const VMargin(30),
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                'https://media.istockphoto.com/vectors/open-box-icon-vector-id635771440?k=6&m=635771440&s=612x612&w=0&h=IESJM8lpvGjMO_crsjqErVWzdI8sLnlf0dljbkeO7Ig=',
                                scale: 3))),
                  ),
                ),
                const VMargin(20),
                Text('No videos loaded check network settins!'),
              ],
            ),
          );
  }
}
