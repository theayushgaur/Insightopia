import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, posturl;

  NewsTile(
      {required this.imgUrl,
      required this.desc,
      required this.title,
      // required this.content,
      required this.posturl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          // const Color.fromRGBO(12, 53, 106, 1),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.91,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            // color: Colors.grey,
            // border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 12,
              ),
              Text(
                title,
                maxLines: 2,
                style: GoogleFonts.titilliumWeb(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                // style: TextStyle(
                //     color: Colors.black87,
                //     fontSize: 20,
                //     fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                desc,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
