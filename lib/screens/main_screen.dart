import 'package:expense_app/models/article_model.dart';
import 'package:expense_app/notifications/local_notification.dart';
import 'package:expense_app/screens/bbc_news.dart';
import 'package:expense_app/screens/detail_screen.dart';
import 'package:expense_app/screens/discover_page.dart';
import 'package:expense_app/screens/news_tile.dart';
import 'package:expense_app/themes/dark_theme.dart';
import 'package:expense_app/themes/light_theme.dart';
import 'package:expense_app/widgets/navbar.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helpers/business_news.dart';
import '../helpers/entertainment_news.dart';
import '../helpers/health_news.dart';
import '../helpers/news.dart';
import '../helpers/tech_news.dart';
import '../provider/theme_changer.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/navbar_2.dart';
import 'news_tile2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final LocalNotificationService service;
  // bool _switch = true;

  // ThemeData _dark = darkTheme;
  // ThemeData _light = lightTheme;

  late final TabController _tabController =
      TabController(length: 5, vsync: this);

  List<ArticleModel> articles = <ArticleModel>[];
  List<ArticleModel> enterArticles = <ArticleModel>[];
  List<ArticleModel> businessArticles = <ArticleModel>[];
  List<ArticleModel> healthArticles = <ArticleModel>[];
  List<ArticleModel> techArticles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNews();
    getEnterNews();
    getBusinessNews();
    getHealthNews();
    getTechNews();
    service = LocalNotificationService();
    service.intialize();
    // service.showNotification(id: 0, title: 'Hi', body: 'Hello');
    service.showScheduledNotification(
        id: 0,
        title:
            'Astropads latest is a combo iPad screen protector/Apple Pencil Tip | TechCrunch',
        body:
            'Astropads latest is a combo iPad screen protector/Apple Pencil Tip | TechCrunch',
        seconds: 10);
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

  getEnterNews() async {
    EnterNews newClass = EnterNews();
    await newClass.getEnterNews();
    enterArticles = newClass.enternews;
    setState(() {
      _loading = false;
    });
  }

  getBusinessNews() async {
    BusinessNews newClass = BusinessNews();
    await newClass.getBusinessrNews();
    businessArticles = newClass.businessnews;
    setState(() {
      _loading = false;
    });
  }

  getHealthNews() async {
    HealthNews newClass = HealthNews();
    await newClass.getHealthNews();
    healthArticles = newClass.healthnews;
    setState(() {
      _loading = false;
    });
  }

  getTechNews() async {
    TechNews newClass = TechNews();
    await newClass.getTechNews();
    techArticles = newClass.technews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      // bottomNavigationBar:
      //const bottom_nav_bar(),
      bottomNavigationBar: const bottom_nav_bar(),
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
      // const Color.fromRGBO(241, 240, 232, 1),
      drawer: drawerMenu(themeChanger: themeChanger),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 10),
                    child: Text(
                      'Hottest News',
                      style: GoogleFonts.averiaLibre(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiscoverPage1()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Text(
                        'Show More',
                        style: GoogleFonts.averiaLibre(
                          fontSize: 14,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.background,
              height: MediaQuery.of(context).size.height * 0.37,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
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
                    child: NewsTile(
                        imgUrl: articles[index].urlToImage,
                        desc: articles[index].description,
                        title: articles[index].title,
                        // content: articles[index].content,
                        posturl: articles[index].url),
                  );
                },
              ),
            ),
            const SizedBox(
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
                    // const Color.fromRGBO(12, 53, 106, 1),
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
                          const Icon(Icons.business),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Business',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(Icons.movie),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Entertainment',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(Icons.computer),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Technology',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(Icons.health_and_safety),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Health',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(Icons.science),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Science',
                            style: GoogleFonts.averiaLibre(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Text(
                    'Recommended for you',
                    style: GoogleFonts.averiaLibre(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiscoverPage1()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Text(
                      'Show More',
                      style: GoogleFonts.averiaLibre(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: businessArticles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          url: businessArticles[index].url,
                                          imgUrl: businessArticles[index]
                                              .urlToImage,
                                          desc: businessArticles[index]
                                              .description,
                                          title: businessArticles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: businessArticles[index].urlToImage,
                              desc: businessArticles[index].description,
                              title: businessArticles[index].title,
                              // content: articles[index].content,
                              posturl: businessArticles[index].url),
                        );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: enterArticles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          imgUrl:
                                              enterArticles[index].urlToImage,
                                          url: enterArticles[index].url,
                                          desc:
                                              enterArticles[index].description,
                                          title: enterArticles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: enterArticles[index].urlToImage,
                              desc: enterArticles[index].description,
                              title: enterArticles[index].title,
                              // content: enterArticles[index].content,
                              posturl: enterArticles[index].url),
                        );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: techArticles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          url: techArticles[index].url,
                                          imgUrl:
                                              techArticles[index].urlToImage,
                                          desc: techArticles[index].description,
                                          title: techArticles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: techArticles[index].urlToImage,
                              desc: techArticles[index].description,
                              title: techArticles[index].title,
                              // content: articles[index].content,
                              posturl: techArticles[index].url),
                        );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: healthArticles.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          url: healthArticles[index].url,
                                          imgUrl:
                                              healthArticles[index].urlToImage,
                                          desc:
                                              healthArticles[index].description,
                                          title: healthArticles[index].title,
                                        )));
                          },
                          child: NewsTile2(
                              imgUrl: healthArticles[index].urlToImage,
                              desc: healthArticles[index].description,
                              title: healthArticles[index].title,
                              // content: articles[index].content,
                              posturl: healthArticles[index].url),
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
                          child: NewsTile(
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



// class shimmer_icon extends StatelessWidget {
//   const shimmer_icon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         shimmer(
//           height: 100,
//           width: MediaQuery.of(context).size.width * 0.91,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         shimmer(
//           height: 10,
//           width: MediaQuery.of(context).size.width * 0.91,
//         ),
//         SizedBox(
//           height: 3,
//         ),
//         shimmer(
//           height: 10,
//           width: MediaQuery.of(context).size.width * 0.91,
//         ),
//       ],
//     );
//   }
// }
