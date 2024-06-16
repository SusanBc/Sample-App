// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omwaynews/features/news/model/news_models.dart';

class NewsListWidget extends StatelessWidget {
  final NewsModel model;
  final VoidCallback onpressed;
  const NewsListWidget({
    super.key,
    required this.model,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                    imageUrl: model.image ?? "-"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title ?? "-",
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(DateFormat("yyyy-MM-dd").format(
                          DateFormat("yyyy-MM-dd")
                              .parse(model.createdAt ?? "")))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
