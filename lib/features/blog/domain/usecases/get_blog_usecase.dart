import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/core/usecase/usecase.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/blog/domain/repositories/blog_repository.dart';
import 'package:dartz/dartz.dart';

class GetBlogUsecase extends UseCase<BlogResponse, NoParams> {
  BlogRepository repository;
  GetBlogUsecase({required this.repository});
  @override
  Future<Either<Failure, BlogResponse>> call(NoParams params) async {
    return await repository.getBlogs();
  }
}
