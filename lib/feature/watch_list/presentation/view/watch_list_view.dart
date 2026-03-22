import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../bloc/watch_list_bloc.dart';
import '../bloc/watch_list_event.dart';
import '../bloc/watch_list_state.dart';
import '../widgets/stock_tile_widget.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc(sl())..add(LoadWatchlist()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Watchlist",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            return ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: state.stockList.length,
              onReorder: (oldIndex, newIndex) {
                context
                    .read<WatchlistBloc>()
                    .add(ReorderWatchlist(oldIndex, newIndex));
              },
              itemBuilder: (context, index) {
                final stock = state.stockList[index];

                return Column(
                  key: ValueKey(stock.symbol),
                  children: [
                    StockTileWidget(stock: stock, index: index),
                    const Divider(height: 1, thickness: 0.5),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
