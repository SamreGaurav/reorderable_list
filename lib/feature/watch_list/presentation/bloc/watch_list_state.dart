import '../../domain/entity/stock_entity.dart';

class WatchlistState {
  final List<StockEntity> stockList;
  final bool isLoading;
  final String? error;

  WatchlistState({
    this.stockList = const [],
    this.isLoading = false,
    this.error,
  });

  WatchlistState copyWith({
    List<StockEntity>? stockList,
    bool? isLoading,
    String? error,
  }) {
    return WatchlistState(
      stockList: stockList ?? this.stockList,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}