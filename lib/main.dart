import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wyb_project/ui/screens/storyList_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      home: StoryListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
