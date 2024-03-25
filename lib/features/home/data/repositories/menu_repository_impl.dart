import 'package:cmsna/core/exceptions/failure.dart';

import 'package:cmsna/features/home/domain/entities/menu_item.dart';
import 'package:cmsna/features/home/domain/repositories/menu_repository.dart';
import 'package:dartz/dartz.dart';

import '../dataprovider/menu_data_provider.dart';

class MenuRepositoryImpl extends MenuRepository {
  MenuDataProvider dataProvider;
  MenuRepositoryImpl({required this.dataProvider});
  @override
  Future<Either<Failure, List<MenuItem>>> getMenuItems() async {
    return dataProvider.getMenuItems();
  }
}
