import 'package:flutter/material.dart';
import 'story_section_individual.dart';
import 'feed_item.dart';
import 'user_informatioon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    const logo = NetworkImage('http://amigram.amity.social/img/logo.0d9755c9.png');
    List<UserInformation> feed_list = [
      UserInformation(
        username: 'john', 
        profile_url: 'https://api.amity.co/api/v3/files/fe59d018e6024cf7b032650cef028c0e/download?size=large', 
        post_url: 'https://api.amity.co/api/v3/files/d9d6f8c2a383454588ffff4fea957ee8/download?size=large', 
        topic: 'Here Its my new car!!!', 
        likes_num: 5
      ),
      UserInformation(
        username: 'sara', 
        profile_url: 'https://api.amity.co/api/v3/files/facd037e13024625b4af4d665daa53cf/download?size=large', 
        post_url: 'https://api.amity.co/api/v3/files/187aa89bcf57445296a696958e6337f9/download?size=large', 
        topic: 'My new boyfriend, oh my god. He is so handsome', 
        likes_num: 1
      )
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Image(
          image: logo,
          fit: BoxFit.fitHeight,
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: feed_list.length + 1,
        itemBuilder: (context, index) {
          if(index == 0) {
            return SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: feed_list.length,
                itemBuilder: (BuildContext context, int index) => StorySectionIndividual(u_info: feed_list[index])
              )
            );
          } else {
            return FeedItem(u_info: feed_list[index - 1]);
          }
        },
      ),
      backgroundColor: Colors.white,
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
