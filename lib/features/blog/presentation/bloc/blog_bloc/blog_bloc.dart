import 'package:bloc/bloc.dart';
import 'package:cmsna/core/usecase/usecase.dart';
import 'package:cmsna/features/blog/domain/entities/blog_response.dart';
import 'package:cmsna/features/blog/domain/usecases/get_blog_usecase.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  GetBlogUsecase getBlogUsecase;
  BlogBloc({required this.getBlogUsecase}) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) async {
      emit(FetchBlogLoading());
      final response = await getBlogUsecase(NoParams());
      response.fold((l) => emit(FetchBlogError(message: l.message)),
          (r) => emit(FetchBlogLoaded(items: r.data)));
    });
  }
}
