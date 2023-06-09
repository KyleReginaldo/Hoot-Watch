import 'package:hive_flutter/adapters.dart';
import 'package:yoyo/core/utils/custom_functions.dart';
import 'package:yoyo/data/datasource/local/local_datasource.dart';
import 'package:yoyo/data/model/popular_model.dart';
import 'package:yoyo/data/model/random_model.dart';
import 'package:yoyo/data/model/recent_release_model.dart';
import 'package:yoyo/data/model/trending_model.dart';
import 'package:yoyo/data/model/upcoming_model.dart';

class LocalDatasourceImpl implements LocalDatasource {
  final _randomBox = Hive.box('random_test');
  final _trendingBox = Hive.box('trending_test');
  final _recentBox = Hive.box('recent_test');
  final _upcomingBox = Hive.box('upcoming_test');
  final _popularBox = Hive.box('popular_test');

  @override
  Future<void> cachedRandom({required RandomModel random}) async {
    await _randomBox.put(
      CustomFunctions.getToday().toString(),
      {CustomFunctions.getToday(): random},
    );
  }

  @override
  LocalRandom? getCachedRandom() {
    final laman = _randomBox.get(CustomFunctions.getToday().toString());
    if (laman != null) {
      return LocalRandom.fromMap(laman);
    } else {
      return null;
    }
  }

  @override
  Future<void> cachedTrending({required TrendingModel trending}) async {
    await _trendingBox.put(
      CustomFunctions.getToday().toString(),
      {CustomFunctions.getToday(): trending},
    );
  }

  @override
  LocalTrending? getCachedTrending() {
    final laman = _trendingBox.get(CustomFunctions.getToday().toString());
    if (laman != null) {
      return LocalTrending.fromMap(laman);
    } else {
      return null;
    }
  }

  @override
  Future<void> cachedRecent({required RecentReleaseModel recent}) async {
    await _recentBox.put(
      CustomFunctions.getToday().toString(),
      {CustomFunctions.getToday(): recent},
    );
  }

  @override
  LocalRecent? getCachedRecent() {
    final laman = _recentBox.get(CustomFunctions.getToday().toString());
    if (laman != null) {
      return LocalRecent.fromMap(laman);
    } else {
      return null;
    }
  }

  @override
  Future<void> cachedUpcoming({required UpcomingModel upcoming}) async {
    await _upcomingBox.put(
      CustomFunctions.getToday().toString(),
      {CustomFunctions.getToday(): upcoming},
    );
  }

  @override
  LocalUpcoming? getCachedUpcoming() {
    final laman = _upcomingBox.get(CustomFunctions.getToday().toString());
    if (laman != null) {
      return LocalUpcoming.fromMap(laman);
    } else {
      return null;
    }
  }

  @override
  Future<void> cachedPopular({required PopularModel popular}) async {
    await _popularBox.put(
      CustomFunctions.getToday().toString(),
      {CustomFunctions.getToday(): popular},
    );
  }

  @override
  LocalPopular? getCachedPopular() {
    final laman = _popularBox.get(CustomFunctions.getToday().toString());
    if (laman != null) {
      return LocalPopular.fromMap(laman);
    } else {
      return null;
    }
  }
}
