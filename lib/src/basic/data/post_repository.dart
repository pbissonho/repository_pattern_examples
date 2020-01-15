import 'dart:convert';
import 'package:dio/dio.dart';
import 'post_model.dart';

class PostRepository {
  final Dio dio;

  PostRepository(this.dio);

  Future<PostModel> getPost(int id) async {
    var response = await dio.get("/posts/$id");

    return PostModel.fromJson(json.decode(response.data));
  }

  Future<List<PostModel>> getPosts() async {
    var response = await dio.get("/posts");

    var posts = (response.data as List)
        .map((data) => PostModel.fromJson(json.decode(response.data)))
        .toList();

    return posts;
  }
}
