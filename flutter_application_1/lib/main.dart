import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  var quesitonIndex = 0;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var quesitonIndex = 0;
  var myScore = 0;

  void answerQuestion(ans) {
    print('Question $quesitonIndex I choose $ans ');
    if(quesitonIndex == 0 && ans == 1) {
      setState(() {
        myScore = myScore + 1;
      });
    } else if(quesitonIndex == 1 && ans == 1) {
      setState(() {
        myScore = myScore + 1;
      });
    }

    print('you chosse the answer');
    setState(() {
      quesitonIndex = quesitonIndex + 1;
      // ignore: avoid_print
      print('index $quesitonIndex');
    });
  }

  void clearValue() {
    setState(() {
      quesitonIndex = 0;
      myScore = 0;
    });
  }
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var questions = ['Why world is round?', 'Why human be a human?'];
    var answers = [
      ['A. because it doesn\'n a square.', 'B. becuase that how it is.', 'C. becuase god made it like that.', 'D. I don\'t know'],
      ['A. we have moral.', 'B. we are smart', 'C. we know kindness', 'D. I don\'t know']
    ];

    Column body;

    print('${quesitonIndex}, ${questions.toList().length}');
    print(quesitonIndex >= questions.toList().length);

    if(quesitonIndex >= questions.toList().length) {
      body = Column(children: [
      newMethod(),
      Text('Your score is $myScore'),
      Text('Want to retest?'),
      RaisedButton( child: Text('Retest'), onPressed: () => clearValue())
    ],);
    } else {
      if(quesitonIndex == 0) {
        body =  Column(children: [
          Text(questions.elementAt(quesitonIndex)),
          // ignore: deprecated_member_use
          RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(0)), onPressed: () => answerQuestion(1),),
          // ignore: deprecated_member_use, prefer_const_constructors
          RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(1)), onPressed: () =>  answerQuestion(2),),
          RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(2)), onPressed: () => answerQuestion(3),),
          RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(3)), onPressed: () => answerQuestion(4),),
          Text("My Score: ${myScore}")
        ],);
      } else {
        body =  Column(children: [
          Text(questions.elementAt(quesitonIndex)),
          // ignore: deprecated_member_use
          
          Row(children: [
            RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(0)), onPressed: () => answerQuestion(1),),
          // ignore: deprecated_member_use, prefer_const_constructors
            RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(1)), onPressed: () =>  answerQuestion(2),)
            
          ]),
          Row(children: [
            RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(2)), onPressed: () => answerQuestion(3),),
            RaisedButton( child: Text(answers.elementAt(quesitonIndex).elementAt(3)), onPressed: () => answerQuestion(4),),
            
          ]),
          Text("My Score: ${myScore}")
        ],);
      }
      
    }
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: body,
      ),
    );
  }

  Text newMethod() => const Text('END The Test');
}