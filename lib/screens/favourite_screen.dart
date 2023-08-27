import 'package:expense_app/widgets/navbar_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_item.dart';
import '../widgets/navbar.dart';
import 'news_tile2.dart';
import 'news_title3.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({
    super.key,
  });

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItem>(context);
    final item = provider.selectedItem;
    final title = provider.title;
    final desc = provider.desc;
    final img = provider.img;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // const Color.fromRGBO(12, 53, 106, 1),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                'Insightopia',
                style: GoogleFonts.averiaLibre(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // backgroundColor: Color.fromRGBO(241, 240, 232, 1),main
        // backgroundColor: Color.fromRGBO(233, 234, 236, 1),

        // leading: GestureDetector(
        //   onTap: () {},
        //   child: const Padding(
        //     padding: EdgeInsets.only(left: 20.0),
        //     child: Icon(
        //       Icons.menu,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        // actions: [
        //   Icon(Icons.light_mode_outlined),
        //   Switch(
        //       value: _switch,
        //       onChanged: (_newValue) {
        //         setState(() {
        //           _switch = _newValue;
        //         });
        //       })
        // ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: const bottom_nav_bar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
            child: Text(
              'Favourites',
              style: GoogleFonts.averiaLibre(
                fontSize: 23,
                color: Theme.of(context).colorScheme.tertiaryContainer,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final items = item[index];
                  final titleItem = title[index];
                  final descItem = desc[index];
                  final imgItem = img[index];

                  return NewsTile2(
                    desc: descItem,
                    title: titleItem,
                    posturl: items,
                    imgUrl: imgItem,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
