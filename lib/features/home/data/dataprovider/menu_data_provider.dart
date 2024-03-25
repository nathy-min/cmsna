import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:cmsna/core/exceptions/failure.dart';
import 'package:cmsna/features/home/data/models/menu_item_model.dart';
import 'package:cmsna/features/home/domain/entities/menu_item.dart';
import 'package:dartz/dartz.dart';

abstract class MenuDataProvider {
  Future<Either<Failure, List<MenuItem>>> getMenuItems();
}

class MenuDataProviderImpl extends MenuDataProvider {
  @override
  Future<Either<Failure, List<MenuItem>>> getMenuItems() async {
    try {
      print("test=====================m");
      final String response = await rootBundle.loadString('assets/menu.json');
      print(response);
      final data = await json.decode(response);
      final List<MenuItem> menuItems = (data['menu'] as List)
          .map((item) => MenuItemModel.fromJson(item))
          .toList();

      return Right(menuItems);
    } catch (e) {
      print(e);
      if (e is SocketException) {
        return Left(Failure(
            'Failed to connect to the server. Please check your internet connection.'));
      } else if (e is TimeoutException) {
        return Left(Failure('The request timed out. Please try again later.'));
      } else {
        return Left(Failure('An unexpected error occurred. Please try again.'));
      }
    }
  }
}
