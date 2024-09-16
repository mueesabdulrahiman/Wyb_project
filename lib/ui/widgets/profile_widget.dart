import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wyb_project/model/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;
  final String date;

  const ProfileWidget({
    super.key,
    required this.user,
    required this.date,
  });

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundImage: CachedNetworkImageProvider(user.imgUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(user.name,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(width: 7.0),
                    Text(date,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white)),
            ],
          ),
        ),
      );
}
