import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/features/home/domain/entities/menu_item.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuItem>>> getMenuItems();
}
