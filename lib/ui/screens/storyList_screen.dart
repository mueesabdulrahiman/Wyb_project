import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wyb_project/data/data.dart';
import 'package:wyb_project/ui/screens/story_screen.dart';

class StoryListScreen extends StatelessWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wyb',
          style: GoogleFonts.lato(
              textStyle: const TextStyle(fontWeight: FontWeight.w500)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: users
              .map((user) => Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text(
                          user.name,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(user.imgUrl),
                          radius: 25,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => StoryScreen(user: user)));
                        },
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
