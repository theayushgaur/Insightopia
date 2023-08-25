import 'package:expense_app/provider/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/navbar.dart';

class DetailScreen extends StatefulWidget {
  final String url, title, desc, imgUrl;

  const DetailScreen({
    super.key,
    required this.url,
    required this.title,
    required this.desc,
    required this.imgUrl,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // List<String> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context);
    String myUrl = widget.url;
    WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse(myUrl));
    return Scaffold(
      bottomNavigationBar: const bottom_nav_bar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // backgroundColor: const Color.fromRGBO(12, 53, 106, 1),
        // backgroundColor: Color.fromRGBO(68, 119, 206, 1),
        foregroundColor: Colors.white,

        centerTitle: true,

        title: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white),
            ),
          ),
          child: Center(
            child: Text(
              'Insightopia',
              style: GoogleFonts.averiaLibre(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Share.share(widget.url);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Icon(Icons.share),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  provider.toggleFav(
                      widget.title, widget.desc, widget.url, widget.imgUrl);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: provider.isExistItem(
                          widget.title, widget.desc, widget.url, widget.imgUrl)
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite_border_outlined),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
        // backgroundColor: Color.fromRGBO(241, 240, 232, 1),
        // backgroundColor: Color.fromRGBO(233, 234, 236, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 13.0),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(241, 240, 232, 1),
      body: SafeArea(
        child: Container(
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
