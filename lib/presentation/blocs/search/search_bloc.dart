import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/search_entity.dart';
import '../../../domain/usecases/search_anime.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchAnime searchAnime;

  SearchBloc(this.searchAnime) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is Search) {
        emit(SearchLoading());
        final either = await searchAnime(query: event.query, limit: 0);
        either.fold((l) => emit(SearchError(msg: l.msg)),
            (r) => emit(SearchLoaded(search: r)));
      }
    });
  }
}
