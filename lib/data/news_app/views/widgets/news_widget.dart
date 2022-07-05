import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/data/new_model.dart';

class NewsWidget extends StatelessWidget {
  NewsModel newsModel;
  Function fun;
  NewsWidget(this.newsModel, this.fun);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Row(children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              errorWidget: (c, x, y) {
                return Image.asset(
                  'assets/images/flower.jpg',
                  fit: BoxFit.cover,
                );
              },
              imageUrl: newsModel.urlToImage ?? ''),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              newsModel.title ?? 'not defined',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              newsModel.description ?? 'not defined',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Expanded(child: Text(newsModel.author ?? 'not defined')),
                IconButton(
                    onPressed: () {
                      fun(newsModel);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: newsModel.isLike ? Colors.red : Colors.grey,
                    ))
              ],
            )
          ],
        ))
      ]),
    );
  }
}
