// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/popular_entity.dart';

import '../../../domain/usecases/fetch_popular_anime.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(
    this.fetchPopularAnime,
  ) : super(PopularInitial());

  final FetchPopularAnime fetchPopularAnime;

  void onFetchPopularAnime() async {
    emit(PopularLoading());
    final either = await fetchPopularAnime();

    either.fold((l) => emit(PopularError(msg: l.msg)),
        (r) => emit(PopularLoaded(popular: r)));
  }
}
