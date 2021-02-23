import 'dart:convert';
import 'package:http/http.dart';
import 'get_post_model.dart';

class GetPost {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> manggilPostData() async {
    Response res = await get(url);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> postData =
          body.map((dynamic post) => Post.fromJson(post)).toList();
      return postData;
    } else {
      throw "Ga bisa dapet data";
    }
  }
}
