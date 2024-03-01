part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

class FetchBlogError extends BlogState {
  final String message;

  FetchBlogError({required this.message});
}

class FetchBlogLoading extends BlogState {}

class FetchBlogLoaded extends BlogState {
  final List<BlogData> items;

  FetchBlogLoaded({required this.items});
}
