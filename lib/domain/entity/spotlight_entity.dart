// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yoyo/domain/entity/trending_entity.dart';
import 'package:yoyo/domain/entity/upcoming_entity.dart';

class SpotlightEntity {
  final TrendingEntity trending;
  final UpcomingEntity upcoming;
  SpotlightEntity({
    required this.trending,
    required this.upcoming,
  });
}
