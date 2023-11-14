import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List audio = [
    'assets/sample-3s.mp3',
    'assets/sample-6s.mp3',
    'assets/sample-9s.mp3',
    'assets/sample-12s.mp3',
    'assets/sample-15s.mp3',
    'assets/Free-1MB.mp3',
    'assets/Free-2MB.mp3',
    'assets/Free-5MB.mp3',
    'assets/Free-100KB.mp3',
    'assets/Free-500KB.mp3'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: audio.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.blue,
            leading: CircleAvatar(),
            title: Text('${audio[index]}'),
            subtitle: Text('${audio[index]}'),
            trailing: IconButton(
              onPressed: () {
                var audioPlayer = AssetsAudioPlayer();
                audioPlayer.open(Audio('${audio[index]}'));
                audioPlayer.play();
              },
              icon: Icon(Icons.play_arrow),
            ),
          ),
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
