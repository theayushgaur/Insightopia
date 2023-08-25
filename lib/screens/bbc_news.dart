import 'package:expense_app/screens/main_screen.dart';
import 'package:expense_app/widgets/navbar_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/bbc_india_news.dart';
import '../helpers/news.dart';
import '../models/article_model.dart';
import 'detail_screen.dart';

import 'news_tile2.dart';

class BbcNews extends StatefulWidget {
  const BbcNews({super.key});

  @override
  State<BbcNews> createState() => _BbcNewsState();
}

class _BbcNewsState extends State<BbcNews> with TickerProviderStateMixin {
  List<ArticleModel> bbcarticles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getBbcNews();
  }

  getBbcNews() async {
    BbcNewss newClass = BbcNewss();
    await newClass.getBbcNews();
    bbcarticles = newClass.bbcnews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar2(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // const Color.fromRGBO(12, 53, 106, 1),
        // backgroundColor: Color.fromRGBO(68, 119, 206, 1),

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
        // backgroundColor: Color.fromRGBO(241, 240, 232, 1),
        // backgroundColor: Color.fromRGBO(233, 234, 236, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: bbcarticles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      url: bbcarticles[index].url,
                                      desc: bbcarticles[index].description,
                                      imgUrl: bbcarticles[index].urlToImage,
                                      title: bbcarticles[index].title,
                                    )));
                      },
                      child: NewsTile2(
                          imgUrl: bbcarticles[index].urlToImage,
                          desc: bbcarticles[index].description,
                          title: bbcarticles[index].title,
                          // content: articles[index].content,
                          posturl: bbcarticles[index].url),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
