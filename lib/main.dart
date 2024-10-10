import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:telaproject/core/database/sql.dart';
//import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:telaproject/core/routes/app_router.dart';
import 'package:telaproject/core/services/service_locator.dart';
import 'core/database/cash/cache_helper.dart';

Sql sql = Sql();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.platform
      .setMethodCallHandler((call) => _handleSystemMessage(call));
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
  sql.initializeDb();
  //FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE| FlutterWindowManager.FLAG_DISMISS_KEYGUARD | FlutterWindowManager.FLAG_FULLSCREEN);
}

Future<dynamic> _handleSystemMessage(MethodCall call) async {
  if (call.method == 'SystemNavigator.pop') {
    SystemNavigator.pop();
    return true;
  }
  return false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routerConfig: router,
          )
        : MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routerConfig: router,
          );
  }
}
