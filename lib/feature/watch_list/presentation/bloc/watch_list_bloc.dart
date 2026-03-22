import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reorder_list_example/feature/watch_list/domain/use_case/watch_list_use_case.dart';
import 'package:reorder_list_example/feature/watch_list/presentation/bloc/watch_list_event.dart';
import 'package:reorder_list_example/feature/watch_list/presentation/bloc/watch_list_state.dart';

import '../../domain/entity/stock_entity.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchListUseCase watchListUseCase;
  WatchlistBloc(this.watchListUseCase) : super(WatchlistState(stockList: [])) {
    on<LoadWatchlist>(_onLoad);
    on<ReorderWatchlist>(_onReorder);
  }

  void _onLoad(LoadWatchlist event, Emitter<WatchlistState> emit) async{

    emit(state.copyWith(isLoading: true));

    final result = await watchListUseCase.fetchWatchList();

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
          (stocks) {
            emit(state.copyWith(
              isLoading: false,
              stockList: stocks,
            ));
      },
    );
  }

  void _onReorder(ReorderWatchlist event, Emitter<WatchlistState> emit) {
    final updatedList = List<StockEntity>.from(state.stockList);

    if (kDebugMode) {
      print('new Indexxxx ==>> ${event.newIndex}');
    }
    int newIndex = event.newIndex;
    if (event.oldIndex < newIndex) {
      newIndex -= 1;
    }

    final item = updatedList.removeAt(event.oldIndex);
    updatedList.insert(newIndex, item);

    emit(state.copyWith(stockList: updatedList));
  }
}