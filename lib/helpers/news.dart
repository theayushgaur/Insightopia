import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = []; //Made a Empty List To Store the retrived data
  Future<void> getNews() async {
    //Made a function to call the Api
    final response = await http.get(Uri.parse(
        //In line 9 and 10 converted the url to uri and used in the app and stored the data it gave in a variable named response
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=34bc6a6124394808bc47019dcee90388"));
    var data = jsonDecode(response.body
        .toString()); //In this decoded the json to string and stored it in a variable named data
    if (data['status'] == "ok") {
      data["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            response.statusCode == 200) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"]);
          // content: element["content"]);
          news.add(articleModel); //added the data to the list we made
        }
      });
    }
  }
}
