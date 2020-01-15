import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


// Código sem tipagem, fortemente acoplado e difícil de testar.

class PostPage extends StatelessWidget {
  final Dio dio;

  const PostPage({Key key, this.dio}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Response>(
      future: dio.get("/posts"),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {

        var posts = snapshot.data.data as Map;

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(posts[index]['title']),
            );
          },
        );
      },
    );
  }
}
