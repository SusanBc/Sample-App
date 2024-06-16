// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:omwaynews/features/home/home_screen.dart';
import 'package:omwaynews/features/news/screens/news_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NewsListScreen()));
      }
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News App",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 90,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
