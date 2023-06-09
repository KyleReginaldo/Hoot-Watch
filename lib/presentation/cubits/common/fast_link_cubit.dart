// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yoyo/domain/entity/streamlink_entity.dart';
import 'package:yoyo/domain/usecases/fetch_stream_links.dart';

class FastLinkCubit extends Cubit<StreamLinkEntity?> {
  FastLinkCubit(
    this.streamLinks,
  ) : super(null);
  final FetchStreamLinks streamLinks;

  void onInitLink({required String id}) async {
    {
      final either = await streamLinks(id);
      either.fold((l) => null, (r) => emit(r));
    }
  }
}
