part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class FetchMenuError extends MenuState {
  final String message;

  FetchMenuError({required this.message});
}

class FetchMenuLoading extends MenuState {}

class FetchMenuLoaded extends MenuState {
  final List<MenuItem> items;

  FetchMenuLoaded({required this.items});
}
