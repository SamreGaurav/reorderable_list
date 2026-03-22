import 'package:get_it/get_it.dart';
import 'package:reorder_list_example/feature/watch_list/data/repository_imp/watch_list_repository_imp.dart';
import 'package:reorder_list_example/feature/watch_list/domain/repository/watch_list_repository.dart';
import 'package:reorder_list_example/feature/watch_list/domain/use_case/watch_list_use_case.dart';
import 'package:reorder_list_example/feature/watch_list/presentation/bloc/watch_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<WatchlistBloc>(() => WatchlistBloc(sl()));
  sl.registerLazySingleton<WatchListUseCase>(() => WatchListUseCase(sl()));
  sl.registerLazySingleton<WatchListRepository>(
        () => WatchListRepositoryImp(),
  );

}