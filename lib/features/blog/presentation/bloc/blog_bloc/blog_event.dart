part of 'blog_bloc.dart';

@immutable
abstract class BlogEvent {}

class FetchBlogs extends BlogEvent {}
