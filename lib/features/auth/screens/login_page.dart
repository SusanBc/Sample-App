import 'package:flutter/material.dart';
import 'package:omwaynews/components/custom_button.dart';
import 'package:omwaynews/components/custom_text_field.dart';
import 'package:omwaynews/config/asset_path.dart';
import 'package:omwaynews/features/auth/repository/auth_repo.dart';
import 'package:omwaynews/features/news/screens/news_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AssetPath.newsImage)),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Login to see Daily News",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: userNameController,
                  labelText: "UserName",
                  // validator: (p0) => Validators.isRequired(p0),
                  isRequired: true,
                  hintText: "Enter username here",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                  // validator: (p0) => Validators.isRequired(p0),
                  isRequired: true,
                  hintText: "Enter email here",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  // validator: (p0) => Validators.isRequired(p0),
                  isRequired: true,
                  hintText: "Enter password here",
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: "Login",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final datas = {
                        "name": userNameController.text,
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      final resp = await AuthRepository.loginUser(data: datas);

                      if (resp.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(resp.message)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("User Logged In Successfully")));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const NewsListScreen()));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
