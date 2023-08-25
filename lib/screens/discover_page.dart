import 'package:expense_app/screens/main_screen.dart';
import 'package:expense_app/widgets/navbar.dart';
import 'package:expense_app/widgets/navbar_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/news.dart';
import '../models/article_model.dart';
import 'detail_screen.dart';

import 'news_tile2.dart';

class DiscoverPage1 extends StatefulWidget {
  const DiscoverPage1({super.key});

  @override
  State<DiscoverPage1> createState() => _DiscoverPage1State();
}

class _DiscoverPage1State extends State<DiscoverPage1>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass =
        News(); //Calling the class and storing it in a variable to be used in this file
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom_nav_bar(),
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Container(
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(5),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.background,
                    // Color.fromRGBO(68, 119, 206, 1),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[500],
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '🇮🇳  India',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // Text(
                          //   'BBC',
                          //   style: GoogleFonts.averiaLibre(
                          //     fontSize: 15,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Center(
                            child: Text(
                              '🇺🇸  United States',
                              style: GoogleFonts.averiaLibre(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '🇬🇧  United Kingdom',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          imgUrl: articles[index].urlToImage,
                                          url: articles[index].url,
                                          desc: articles[index].description,
                                          title: articles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: articles[index].urlToImage,
                              desc: articles[index].description,
                              title: articles[index].title,
                              // content: articles[index].content,
                              posturl: articles[index].url),
                        );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          url: articles[index].url,
                                          imgUrl: articles[index].urlToImage,
                                          desc: articles[index].description,
                                          title: articles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: articles[index].urlToImage,
                              desc: articles[index].description,
                              title: articles[index].title,
                              // content: articles[index].content,
                              posturl: articles[index].url),
                        );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          url: articles[index].url,
                                          imgUrl: articles[index].urlToImage,
                                          desc: articles[index].description,
                                          title: articles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: articles[index].urlToImage,
                              desc: articles[index].description,
                              title: articles[index].title,
                              // content: articles[index].content,
                              posturl: articles[index].url),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
