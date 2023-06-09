import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/domain/entity/random_entity.dart';

import '../../../domain/usecases/fetch_random_anime.dart';

part 'random_state.dart';

class RandomCubit extends Cubit<RandomState> {
  RandomCubit(this.fetchRandomAnime) : super(RandomInitial());

  final FetchRandomAnime fetchRandomAnime;

  void onFetchRandomAnime() async {
    emit(RandomLoading());
    final either = await fetchRandomAnime();
    either.fold((l) => emit(RandomError()),
        (random) => emit(RandomLoaded(random: random)));
  }
}
