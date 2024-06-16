import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:omwaynews/features/news/provider/news_prov.dart';
import 'package:omwaynews/features/news/screens/news_detail.dart';
import 'package:omwaynews/features/news/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  String? token;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsList, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Daily News"),
          actions: [
            token != null
                ? IconButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: const Text("Log Out"),
                              content: const Text(
                                  "Are you sure you want to LOg Out?"),
                              actions: [
                                FilledButton(
                                    onPressed: () async {
                                      SharedPreferences sharedPref =
                                          await SharedPreferences.getInstance();
                                      sharedPref.remove("token").then(
                                          (value) => Phoenix.rebirth(ctx));
                                    },
                                    child: const Text("Yes")),
                                FilledButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: const Text("No")),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.logout))
                : const SizedBox()
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (newsList.isLoading && newsList.newsList.isEmpty) ...{
                const SizedBox(
                    height: 450,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
              } else if (!newsList.isLoading && newsList.newsList.isEmpty) ...{
                const Center(
                  child: Text("No Data"),
                )
              } else ...{
                RefreshIndicator(
                    onRefresh: () async {
                      await newsList.getNews(context: context);
                    },
                    child: ListView.builder(
                      itemCount: newsList.newsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NewsListWidget(
                          model: newsList.newsList[index],
                          onpressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewsDetailScreen(
                                      model: newsList.newsList[index],
                                    )));
                          },
                        );
                      },
                    ))
              }
            ],
          ),
        ),
      ),
    );
  }
}
