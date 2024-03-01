import 'dart:async';
import 'dart:io';

import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/core/network/network_manager.dart';
import 'package:cmsna/features/blog/data/models/blog_model_response.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:dartz/dartz.dart';

abstract class BlogDataProvider {
  Future<Either<Failure, BlogResponse>> getBlogs();
}

class BlogDataProviderImpl extends BlogDataProvider {
  final NetworkManager networkManager;

  BlogDataProviderImpl({required this.networkManager});
  @override
  Future<Either<Failure, BlogResponse>> getBlogs() async {
    try {
      final response = await networkManager.get('/api/blogs/list/');
      if (response.statusCode == 200) {
        final blogResponse = BlogResponseModel.fromJson(response.data);

        return Right(blogResponse);
      } else {
        final message = response.data['message'];
        return Left(Failure(message));
      }
    } catch (e) {
      if (e is SocketException) {
        return Left(Failure(
            'Failed to connect to the server. Please check your internet connection.'));
      } else if (e is TimeoutException) {
        return Left(Failure('The request timed out. Please try again later.'));
      } else {
        return Left(Failure('An unexpected error occurred. Please try again.'));
      }
    }
  }
}
