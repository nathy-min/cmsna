import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:dartz/dartz.dart';

abstract class BlogRepository {
  Future<Either<Failure, BlogResponse>> getBlogs();
}
