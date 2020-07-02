import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sabetudo/app/shared/utils/system.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    travarTela();
    setColorStatusBar(Theme.of(context).primaryColor);
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3305042596393522~7055550365");
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Sabe Tudo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
