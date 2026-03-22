import 'package:dartz/dartz.dart';
import 'package:reorder_list_example/feature/watch_list/domain/entity/stock_entity.dart';

import '../../../../core/error/error_handler.dart';

abstract class WatchListRepository {
Future<Either<Failure, List<StockEntity>>> getWatchList();
}