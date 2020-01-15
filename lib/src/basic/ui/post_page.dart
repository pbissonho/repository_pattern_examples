import 'package:flutter/material.dart';
import 'package:repository_pattern/src/basic/data/post_model.dart';
import 'package:repository_pattern/src/basic/data/post_repository.dart';

class PostPage extends StatelessWidget {
  final PostRepository repository;

  const PostPage({Key key, this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic Example"),
        ),
        body: FutureBuilder<List<PostModel>>(
          future: repository.getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
            var posts = snapshot.data;

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(posts[index].title),
                );
              },
            );
          },
        ));
  }
}
