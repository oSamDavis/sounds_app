import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() =>  runApp(SoundsApp());


class SoundsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text( 'Gbedu',
          style: TextStyle(
            fontFamily: 'Grandstander',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,

          ),)),
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[700],
        body: Sounds(),

      ),

    );
  }
}

class Sounds extends StatelessWidget {

  void playSound(content)
  {
    final player = AudioCache();
    player.play('$content.wav');

  }
  Expanded getButton(content)
  {
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          color: Colors.grey,
          padding: EdgeInsets.all(0.0),
          onPressed: (){playSound(content);},
          child: Image.asset('images/$content.png', fit: BoxFit.contain),
          shape: CircleBorder(),
        ),
      ),
    );
  }
  Column getSection({firstContent, secondContent, thirdContent})
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getButton(firstContent),
        getButton(secondContent),
        getButton(thirdContent),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ Expanded(child: getSection(firstContent: 'action', secondContent: 'orchestra', thirdContent: 'sad' )),
          Expanded(child: getSection(firstContent: 'horror', secondContent: 'romance', thirdContent: 'suspense', ))
        ],
      ),

    );
  }
}
