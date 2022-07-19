import 'package:flutter/material.dart';
import 'package:gsk_ui/models/post.dart';
import 'package:gsk_ui/models/user.dart';

class PostWidget extends StatelessWidget {
  User user;
  Post post;
  PostWidget(this.user, this.post);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(children:  [
            //             Container(
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: AssetImage('assets/images/flower.jpg'))),
            // ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.image??''),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              user.name??'',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.more_horiz_rounded)
          ]),
        ),
        Container(
         
          height: 300,
          width: 10000,
          child:post.file==null? Image.network(
            post.image??'',
            fit: BoxFit.cover,
          ): Image.file(
                  post.file!,
                  fit: BoxFit.cover,
                ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
        children: [
          Image.asset('assets/icons/like.png'),
          const SizedBox(
            width: 5,
          ),
          Image.asset('assets/icons/comment.png'),
          const SizedBox(
            width: 5,
          ),
          Image.asset('assets/icons/share.png'),
          const Spacer(),
          Image.asset('assets/icons/save.png'),
        ],
          ),
        ),
        Container(margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(post.content??'',textAlign: TextAlign.start,))
      ],
    );
  }
}
