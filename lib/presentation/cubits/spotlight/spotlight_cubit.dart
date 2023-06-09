import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoyo/domain/entity/spotlight_entity.dart';

import '../../../domain/usecases/fetch_spotlight.dart';

part 'spotlight_state.dart';

class SpotlightCubit extends Cubit<SpotlightState> {
  SpotlightCubit(
    this.fetchSpotlight,
  ) : super(SpotlightInitial());
  final FetchSpotlight fetchSpotlight;

  void onFetchSpotlight() async {
    emit(SpotlightLoading());
    final either = await fetchSpotlight();
    either.fold((l) => emit(SpotlightError(msg: l.msg)),
        (r) => emit(SpotlightLoaded(spotlight: r)));
  }
}
