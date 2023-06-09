import 'package:yoyo/data/model/random_model.dart';
import 'package:yoyo/data/model/recent_release_model.dart';
import 'package:yoyo/data/model/trending_model.dart';

import '../../model/popular_model.dart';
import '../../model/upcoming_model.dart';

abstract class LocalDatasource {
  Future<void> cachedRandom({required RandomModel random});
  LocalRandom? getCachedRandom();
  Future<void> cachedTrending({required TrendingModel trending});
  LocalTrending? getCachedTrending();
  Future<void> cachedRecent({required RecentReleaseModel recent});
  LocalRecent? getCachedRecent();
  Future<void> cachedUpcoming({required UpcomingModel upcoming});
  LocalUpcoming? getCachedUpcoming();
  Future<void> cachedPopular({required PopularModel popular});
  LocalPopular? getCachedPopular();
}
