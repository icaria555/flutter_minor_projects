import 'package:flutter/material.dart';
import 'user_informatioon.dart';

class StorySectionIndividual extends StatelessWidget {
  final UserInformation u_info;

  const StorySectionIndividual({Key? key, required this.u_info}) : super(key: key);

  Widget build(BuildContext context){
    String image_profile = (u_info.profile_url != '') ? u_info.profile_url : 'http://amigram.amity.social/img/user_placeholder.edd52810.png'; 

    return Column(children: [
      ElevatedButton(
        onPressed: () {},
        child: Image(
          image: NetworkImage(image_profile),
          fit: BoxFit.cover,
          height: 100,
          width: 100,
        ),
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(side: BorderSide(color: Colors.green)),
          primary: Colors.white, // <-- Button color
          onPrimary: Colors.red, // <-- Splash color
          fixedSize: Size(40, 40),
          padding: EdgeInsets.all(0.0),
        ),
      ),
      Text(u_info.username)

    ]);  
  }
}