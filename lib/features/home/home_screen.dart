import 'package:flutter/material.dart';
import 'package:omwaynews/components/custom_button.dart';
import 'package:omwaynews/config/app_colors.dart';
import 'package:omwaynews/features/auth/screens/login_page.dart';
import 'package:omwaynews/features/auth/screens/register_page.dart';
import 'package:omwaynews/features/news/screens/news_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: AppColors.appArrowColor,
        elevation: 1,
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                text: "News",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NewsListScreen(),
                  ));
                }),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                text: "Register",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ));
                }),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                text: "Login",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                })
          ],
        ),
      ),
    );
  }
}
