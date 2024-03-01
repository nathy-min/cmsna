import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/features/blog/data/datasources/blog_data_provider.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/blog/domain/repositories/blog_repository.dart';
import 'package:dartz/dartz.dart';

class BlogRepositoryImpl extends BlogRepository {
  BlogDataProvider dataProvider;
  BlogRepositoryImpl({required this.dataProvider});
  @override
  Future<Either<Failure, BlogResponse>> getBlogs() async {
    return dataProvider.getBlogs();
  }
}
