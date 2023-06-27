import 'dart:async';

import 'package:book_store/views/authentication/login.dart';
import 'package:book_store/views/home/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NNbV3SEZPyeh5o4mqc8QUA2lT1BmRdxtktQUYORCicTUXf9xaGjggNo79OYAoFHBALmV8pfB9c2BSweACY1C1lJ00Ez774rfT";
  await dotenv.load(fileName: "assets/.env");

  runApp(DevicePreview(
    // isToolbarVisible: true,
    builder: (context) => const InitApp(),
  ));

  // runApp(const InitApp());
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
            // builder: (context) => const LoginPage(),
          ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:
        const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
        child: Center(
          child: Image.asset("assets/images/app_logo.png"),
        ),
      ),
    );
  }
}
