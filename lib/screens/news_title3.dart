import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTile3 extends StatelessWidget {
  final String title, desc, posturl;

  void Function()? onTap;

  NewsTile3(
      {required this.desc,
      required this.title,
      // required this.content,
      required this.posturl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          // Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), // Color of the shadow
              spreadRadius: 1, // Spread radius
              blurRadius: 4, // Blur radius
              offset: Offset(0, 2.5), // Offset from the container
            ),
          ],
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(12),
                  //   child: CachedNetworkImage(
                  //     height: 120,
                  //     width: 100,
                  //     fit: BoxFit.cover,
                  //     imageUrl: imgUrl,
                  //   ),
                  // ),
                  ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 260,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.titilliumWeb(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    child: Text(
                      desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        // Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
