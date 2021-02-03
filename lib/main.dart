import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/views/splash.dart';

void main() {
  runApp(ProviderScope(child: AzureHT()));
}

class AzureHT extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        builder: BotToastInit(), 
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'AZURE How To',
        theme: ThemeData(
    primarySwatch: Colors.grey,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SpalashPage(title: 'Splash'),
      );
  }
}
