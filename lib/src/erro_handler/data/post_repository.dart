import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:repository_pattern/src/erro_handler/failure.dart';
import 'post_model.dart';

class PostRepository {
  final Dio dio;

  PostRepository(this.dio);

  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      var response = await dio.get("/posts");

      var posts = (response.data as List)
          .map((data) => PostModel.fromJson(json.decode(response.data)))
          .toList();
      return Right(posts);
    } catch (error) {
      return Left(RestFailure("Some error."));
    }
  }
}
