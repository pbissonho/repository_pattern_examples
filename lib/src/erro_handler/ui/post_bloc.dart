import 'dart:async';

import 'package:repository_pattern/src/erro_handler/data/post_model.dart';
import 'package:repository_pattern/src/erro_handler/data/post_repository.dart';

class PostBloc {
  PostBloc() {
    getPosts();
  }

  PostRepository _repository;

  StreamController streamController = StreamController<List<PostModel>>();
  Stream<List<PostModel>> get out => streamController.stream;

  void getPosts() async {
    var data = await _repository.getPosts();

    data.fold((failure) {
      streamController.addError(failure);
    }, (data) {
      streamController.add(data);
    });
  }
}
