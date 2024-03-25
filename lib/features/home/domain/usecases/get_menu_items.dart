import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/core/usecase/usecase.dart';
import 'package:cmsna/features/home/domain/entities/menu_item.dart';
import 'package:cmsna/features/home/domain/repositories/menu_repository.dart';
import 'package:dartz/dartz.dart';

class GetMenuUsecase extends UseCase<List<MenuItem>, NoParams> {
  final MenuRepository repository;

  GetMenuUsecase({required this.repository});

  @override
  Future<Either<Failure, List<MenuItem>>> call(NoParams params) async {
    return await repository.getMenuItems();
  }
}
