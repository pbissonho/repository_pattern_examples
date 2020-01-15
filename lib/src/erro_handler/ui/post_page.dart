import 'package:flutter/material.dart';
import 'package:repository_pattern/src/erro_handler/data/post_model.dart';
import 'package:repository_pattern/src/erro_handler/ui/post_bloc.dart';

class PostPage extends StatelessWidget {
  final PostBloc postBloc;

  const PostPage({Key key, this.postBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic Example"),
        ),
        body: StreamBuilder<List<PostModel>>(
          stream: postBloc.out,
          builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
            var posts = snapshot.data;

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(posts[index].title),
                  );
                },
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return CircularProgressIndicator();
          },
        ));
  }
}
