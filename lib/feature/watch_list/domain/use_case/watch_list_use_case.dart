import 'package:dartz/dartz.dart';
import 'package:reorder_list_example/feature/watch_list/domain/entity/stock_entity.dart';
import 'package:reorder_list_example/feature/watch_list/domain/repository/watch_list_repository.dart';

import '../../../../core/error/error_handler.dart';

class WatchListUseCase {
  final WatchListRepository watchListRepository;
  WatchListUseCase(this.watchListRepository);

  Future<Either<Failure, List<StockEntity>>> fetchWatchList() async{
    return await watchListRepository.getWatchList();
  }
}