import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/domain/entity/info_entity.dart';
import '../../presentation/widgets/customs/text.dart';

class CustomFunctions {
  CustomFunctions._();

  static DateTime getToday() {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  static int convertHexToInt(String hex) {
    return int.parse(hex.replaceFirst("#", "0xFF"));
  }

  static String removeTags(String name) {
    name = name.replaceAll("<br>", "");
    name = name.replaceAll("<i>", "");
    name = name.replaceAll("</i>", "");
    name = name.replaceAll("\n", "");
    return name;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static EpisodeEntity getPlayingEpisode(
      String id, List<EpisodeEntity> episodes) {
    return episodes.singleWhere((element) => element.id == id);
  }

  static Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  static Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  static DateTime parseMsToDt(int ms) {
    return DateTime.fromMillisecondsSinceEpoch(ms);
  }

  static double getLastWatchedDuration({
    required Duration durationL,
    required Duration durationS,
  }) {
    final percL = durationL.inMinutes.toDouble();
    final percS = durationS.inMinutes.toDouble();
    final total = (percS / percL) * 100;
    return total / 100;
  }

  static Future<void> showSnackBar(BuildContext context, String content) async {
    var colors = Theme.of(context).colorScheme;
    var mger = ScaffoldMessenger.of(context);
    SnackBar snackBar = SnackBar(
      content: Text(content, style: TextStyle(color: colors.onSurfaceVariant)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: colors.surfaceVariant,
    );
    mger.clearSnackBars();
    mger.showSnackBar(snackBar);
  }

  static void showLoading(BuildContext ctx) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
  }
}
