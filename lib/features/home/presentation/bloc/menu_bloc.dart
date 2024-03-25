import 'package:bloc/bloc.dart';
import 'package:cmsna/core/usecase/usecase.dart';
import 'package:cmsna/features/home/domain/entities/menu_item.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/get_menu_items.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  GetMenuUsecase getMenuUsecase;
  MenuBloc({required this.getMenuUsecase}) : super(MenuInitial()) {
    on<MenuEvent>((event, emit) async {
      emit(FetchMenuLoading());
      final response = await getMenuUsecase(NoParams());
      response.fold((l) => emit(FetchMenuError(message: l.message)),
          (r) => emit(FetchMenuLoaded(items: r)));
    });
  }
}
