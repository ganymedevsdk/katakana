import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_app/core/providers/locale_provider.dart';

const _xpKey = 'progress_xp';
const _streakKey = 'progress_streak';
const _lastDateKey = 'progress_last_date';
const _correctKey = 'progress_correct';
const _incorrectKey = 'progress_incorrect';
const _charStatsKey = 'progress_char_stats';

class UserProgress {
  final int xp;
  final int level;
  final int currentStreak;
  final int totalCorrect;
  final int totalIncorrect;
  final Map<String, CharStats> charStats;

  const UserProgress({
    required this.xp,
    required this.level,
    required this.currentStreak,
    required this.totalCorrect,
    required this.totalIncorrect,
    required this.charStats,
  });

  static const xpPerLevel = 100;

  int get xpInLevel => xp % xpPerLevel;
  double get progressToNext => xpInLevel / xpPerLevel;
  double get accuracy => (totalCorrect + totalIncorrect) == 0
      ? 0
      : totalCorrect / (totalCorrect + totalIncorrect);

  UserProgress copyWith({
    int? xp,
    int? currentStreak,
    int? totalCorrect,
    int? totalIncorrect,
    Map<String, CharStats>? charStats,
  }) {
    final newXp = xp ?? this.xp;
    return UserProgress(
      xp: newXp,
      level: (newXp ~/ xpPerLevel) + 1,
      currentStreak: currentStreak ?? this.currentStreak,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalIncorrect: totalIncorrect ?? this.totalIncorrect,
      charStats: charStats ?? this.charStats,
    );
  }
}

class CharStats {
  final int correct;
  final int incorrect;

  const CharStats({this.correct = 0, this.incorrect = 0});

  double get accuracy =>
      (correct + incorrect) == 0 ? 0 : correct / (correct + incorrect);

  CharStats addCorrect() => CharStats(correct: correct + 1, incorrect: incorrect);
  CharStats addIncorrect() =>
      CharStats(correct: correct, incorrect: incorrect + 1);

  Map<String, int> toJson() => {'c': correct, 'i': incorrect};
  static CharStats fromJson(Map<String, dynamic> j) =>
      CharStats(correct: j['c'] ?? 0, incorrect: j['i'] ?? 0);
}

final progressProvider =
    NotifierProvider<ProgressNotifier, UserProgress>(ProgressNotifier.new);

class ProgressNotifier extends Notifier<UserProgress> {
  @override
  UserProgress build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final xp = prefs.getInt(_xpKey) ?? 0;
    final streak = prefs.getInt(_streakKey) ?? 0;
    final correct = prefs.getInt(_correctKey) ?? 0;
    final incorrect = prefs.getInt(_incorrectKey) ?? 0;
    final statsJson = prefs.getString(_charStatsKey);
    final charStats = <String, CharStats>{};
    if (statsJson != null) {
      final decoded = jsonDecode(statsJson) as Map<String, dynamic>;
      decoded.forEach((k, v) {
        charStats[k] = CharStats.fromJson(v as Map<String, dynamic>);
      });
    }
    final updatedStreak = _computeStreak(prefs, streak);
    return UserProgress(
      xp: xp,
      level: (xp ~/ UserProgress.xpPerLevel) + 1,
      currentStreak: updatedStreak,
      totalCorrect: correct,
      totalIncorrect: incorrect,
      charStats: charStats,
    );
  }

  int _computeStreak(prefs, int storedStreak) {
    final lastDateStr = prefs.getString(_lastDateKey);
    if (lastDateStr == null) return 0;
    final lastDate = DateTime.tryParse(lastDateStr);
    if (lastDate == null) return 0;
    final today = DateTime.now();
    final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
    final todayDay = DateTime(today.year, today.month, today.day);
    final diff = todayDay.difference(lastDay).inDays;
    if (diff > 1) return 0;
    return storedStreak;
  }

  Future<void> _persist() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_xpKey, state.xp);
    await prefs.setInt(_streakKey, state.currentStreak);
    await prefs.setInt(_correctKey, state.totalCorrect);
    await prefs.setInt(_incorrectKey, state.totalIncorrect);
    final statsJson = jsonEncode(
        state.charStats.map((k, v) => MapEntry(k, v.toJson())));
    await prefs.setString(_charStatsKey, statsJson);
    await prefs.setString(_lastDateKey, DateTime.now().toIso8601String());
  }

  Future<void> recordCorrect(String character, {int xpReward = 10}) async {
    final newStats = Map<String, CharStats>.from(state.charStats);
    newStats[character] =
        (newStats[character] ?? const CharStats()).addCorrect();
    state = state.copyWith(
      xp: state.xp + xpReward,
      totalCorrect: state.totalCorrect + 1,
      charStats: newStats,
      currentStreak: _bumpStreak(),
    );
    await _persist();
  }

  Future<void> recordIncorrect(String character) async {
    final newStats = Map<String, CharStats>.from(state.charStats);
    newStats[character] =
        (newStats[character] ?? const CharStats()).addIncorrect();
    state = state.copyWith(
      totalIncorrect: state.totalIncorrect + 1,
      charStats: newStats,
      currentStreak: _bumpStreak(),
    );
    await _persist();
  }

  int _bumpStreak() {
    final prefs = ref.read(sharedPreferencesProvider);
    final lastDateStr = prefs.getString(_lastDateKey);
    final today = DateTime.now();
    final todayDay = DateTime(today.year, today.month, today.day);
    if (lastDateStr == null) return 1;
    final lastDate = DateTime.tryParse(lastDateStr);
    if (lastDate == null) return 1;
    final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
    final diff = todayDay.difference(lastDay).inDays;
    if (diff == 0) return state.currentStreak == 0 ? 1 : state.currentStreak;
    if (diff == 1) return state.currentStreak + 1;
    return 1;
  }

  Future<void> reset() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_xpKey);
    await prefs.remove(_streakKey);
    await prefs.remove(_correctKey);
    await prefs.remove(_incorrectKey);
    await prefs.remove(_charStatsKey);
    await prefs.remove(_lastDateKey);
    state = const UserProgress(
      xp: 0,
      level: 1,
      currentStreak: 0,
      totalCorrect: 0,
      totalIncorrect: 0,
      charStats: {},
    );
  }
}
