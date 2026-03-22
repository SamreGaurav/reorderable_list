
import '../../domain/entity/stock_entity.dart';

class StockModel extends StockEntity {
  StockModel({required super.symbol, required super.name, required super.price, required super.change});

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      symbol: json['symbol'],
      name: json['title'],
      price: json['price'],
      change: json['change'],
    );
  }
}