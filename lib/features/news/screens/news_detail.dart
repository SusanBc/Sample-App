// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omwaynews/features/news/model/news_models.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel model;
  const NewsDetailScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title ?? "-",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                DateFormat("yyyy-MM-dd").format(
                  DateFormat("yyyy-MM-dd").parse(model.createdAt ?? ""),
                ),
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                  imageUrl: model.image ?? ""),
              const SizedBox(
                height: 15,
              ),
              Text(
                model.description ?? "-",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
