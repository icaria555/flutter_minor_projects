import 'package:flutter/material.dart';
import 'user_informatioon.dart';


class FeedItem extends StatelessWidget {
  final UserInformation u_info;
  const FeedItem({Key? key, required this.u_info}) : super(key: key);

  Widget build(BuildContext context) {
    int like = u_info.likes_num;
    const bold_style = TextStyle(fontWeight: FontWeight.bold);
    String imageProfile = (u_info.profile_url != '') ? u_info.profile_url : 'http://amigram.amity.social/img/user_placeholder.edd52810.png'; 
    String postUrl = (u_info.post_url != '') ? u_info.post_url : 'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg';
    return Column(children: [
        SizedBox(height: 5,),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                image: NetworkImage(imageProfile),
                fit: BoxFit.cover,
                height: 35,
                width: 35,
              ),
              clipBehavior: Clip.hardEdge,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.white, // <-- Button color
                onPrimary: Colors.red, // <-- Splash color
                fixedSize: Size(20, 20),
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Text(u_info.username)
          ],
        ),
        Image(
          image: NetworkImage(postUrl),
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onPressed: () {
                print("icon like is clicked");
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.mode_comment_outlined,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              onPressed: () {
                print("icon comment is clicked");
              },
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 5,),
            Text('$like likes', style: bold_style,),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 5,),
            Text(u_info.username, style: bold_style,),
            SizedBox(width: 5,),
            Text(u_info.topic)
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            const SizedBox(width: 5,),
            const Text("2 WEEKS AGO", style: TextStyle(fontSize: 10, color: Colors.grey),)
          ],
        ),
        SizedBox(height: 5,),
      ]
    );
  }
}