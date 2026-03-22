import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:reorder_list_example/core/error/error_handler.dart';
import 'package:reorder_list_example/feature/watch_list/data/model/StockModel.dart';
import 'package:reorder_list_example/feature/watch_list/domain/entity/stock_entity.dart';
import 'package:reorder_list_example/feature/watch_list/domain/repository/watch_list_repository.dart';

class WatchListRepositoryImp implements WatchListRepository {
  @override
  Future<Either<Failure, List<StockEntity>>> getWatchList() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      final List<StockModel> sampleStocks = [
        StockModel(symbol: "RELIANCE", name: "NSE | EQ", price: 190, change: 1.2),
        StockModel(symbol: "HDFCBANK", name: "NSE | EQ", price: 2800, change: -0.5),
        StockModel(symbol: "ASIANPAINT", name: "NSE | EQ", price: 700, change: 2.5),
        StockModel(symbol: "NIFTY IT", name: "IDX", price: 3300, change: -1.1),
      ];

      return Right(sampleStocks);
    } catch (e) {
      return Left(ServerFailure("Could not fetch stocks"));
    }
  }
}
