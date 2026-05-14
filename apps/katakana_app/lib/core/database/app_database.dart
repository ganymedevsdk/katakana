import 'package:drift/drift.dart';

part 'app_database.g.dart';

class KatakanaCharacters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get character => text().withLength(min: 1, max: 4)();
  TextColumn get romaji => text().withLength(min: 1, max: 8)();
  TextColumn get category => text()(); // basic, dakuten, handakuten, combination
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

class CharacterProgress extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get characterId =>
      integer().references(KatakanaCharacters, #id)();
  IntColumn get timesCorrect => integer().withDefault(const Constant(0))();
  IntColumn get timesIncorrect => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPracticed =>
      dateTime().withDefault(currentDateAndTime)();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  IntColumn get interval => integer().withDefault(const Constant(0))();
}

class UserStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get totalXp => integer().withDefault(const Constant(0))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPracticeDate => dateTime().nullable()();
  IntColumn get totalSessions => integer().withDefault(const Constant(0))();
}

@DriftDatabase(tables: [KatakanaCharacters, CharacterProgress, UserStats])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedKatakana();
        },
      );

  Future<void> _seedKatakana() async {
    final chars = _basicKatakana + _dakuten + _handakuten + _combinations;
    for (var i = 0; i < chars.length; i++) {
      await into(katakanaCharacters).insert(KatakanaCharactersCompanion.insert(
        character: chars[i]['char']!,
        romaji: chars[i]['romaji']!,
        category: chars[i]['cat']!,
        sortOrder: Value(i),
      ));
    }
  }

  static const _basicKatakana = [
    {'char': 'ア', 'romaji': 'a', 'cat': 'basic'},
    {'char': 'イ', 'romaji': 'i', 'cat': 'basic'},
    {'char': 'ウ', 'romaji': 'u', 'cat': 'basic'},
    {'char': 'エ', 'romaji': 'e', 'cat': 'basic'},
    {'char': 'オ', 'romaji': 'o', 'cat': 'basic'},
    {'char': 'カ', 'romaji': 'ka', 'cat': 'basic'},
    {'char': 'キ', 'romaji': 'ki', 'cat': 'basic'},
    {'char': 'ク', 'romaji': 'ku', 'cat': 'basic'},
    {'char': 'ケ', 'romaji': 'ke', 'cat': 'basic'},
    {'char': 'コ', 'romaji': 'ko', 'cat': 'basic'},
    {'char': 'サ', 'romaji': 'sa', 'cat': 'basic'},
    {'char': 'シ', 'romaji': 'shi', 'cat': 'basic'},
    {'char': 'ス', 'romaji': 'su', 'cat': 'basic'},
    {'char': 'セ', 'romaji': 'se', 'cat': 'basic'},
    {'char': 'ソ', 'romaji': 'so', 'cat': 'basic'},
    {'char': 'タ', 'romaji': 'ta', 'cat': 'basic'},
    {'char': 'チ', 'romaji': 'chi', 'cat': 'basic'},
    {'char': 'ツ', 'romaji': 'tsu', 'cat': 'basic'},
    {'char': 'テ', 'romaji': 'te', 'cat': 'basic'},
    {'char': 'ト', 'romaji': 'to', 'cat': 'basic'},
    {'char': 'ナ', 'romaji': 'na', 'cat': 'basic'},
    {'char': 'ニ', 'romaji': 'ni', 'cat': 'basic'},
    {'char': 'ヌ', 'romaji': 'nu', 'cat': 'basic'},
    {'char': 'ネ', 'romaji': 'ne', 'cat': 'basic'},
    {'char': 'ノ', 'romaji': 'no', 'cat': 'basic'},
    {'char': 'ハ', 'romaji': 'ha', 'cat': 'basic'},
    {'char': 'ヒ', 'romaji': 'hi', 'cat': 'basic'},
    {'char': 'フ', 'romaji': 'fu', 'cat': 'basic'},
    {'char': 'ヘ', 'romaji': 'he', 'cat': 'basic'},
    {'char': 'ホ', 'romaji': 'ho', 'cat': 'basic'},
    {'char': 'マ', 'romaji': 'ma', 'cat': 'basic'},
    {'char': 'ミ', 'romaji': 'mi', 'cat': 'basic'},
    {'char': 'ム', 'romaji': 'mu', 'cat': 'basic'},
    {'char': 'メ', 'romaji': 'me', 'cat': 'basic'},
    {'char': 'モ', 'romaji': 'mo', 'cat': 'basic'},
    {'char': 'ヤ', 'romaji': 'ya', 'cat': 'basic'},
    {'char': 'ユ', 'romaji': 'yu', 'cat': 'basic'},
    {'char': 'ヨ', 'romaji': 'yo', 'cat': 'basic'},
    {'char': 'ラ', 'romaji': 'ra', 'cat': 'basic'},
    {'char': 'リ', 'romaji': 'ri', 'cat': 'basic'},
    {'char': 'ル', 'romaji': 'ru', 'cat': 'basic'},
    {'char': 'レ', 'romaji': 're', 'cat': 'basic'},
    {'char': 'ロ', 'romaji': 'ro', 'cat': 'basic'},
    {'char': 'ワ', 'romaji': 'wa', 'cat': 'basic'},
    {'char': 'ヲ', 'romaji': 'wo', 'cat': 'basic'},
    {'char': 'ン', 'romaji': 'n', 'cat': 'basic'},
  ];

  static const _dakuten = [
    {'char': 'ガ', 'romaji': 'ga', 'cat': 'dakuten'},
    {'char': 'ギ', 'romaji': 'gi', 'cat': 'dakuten'},
    {'char': 'グ', 'romaji': 'gu', 'cat': 'dakuten'},
    {'char': 'ゲ', 'romaji': 'ge', 'cat': 'dakuten'},
    {'char': 'ゴ', 'romaji': 'go', 'cat': 'dakuten'},
    {'char': 'ザ', 'romaji': 'za', 'cat': 'dakuten'},
    {'char': 'ジ', 'romaji': 'ji', 'cat': 'dakuten'},
    {'char': 'ズ', 'romaji': 'zu', 'cat': 'dakuten'},
    {'char': 'ゼ', 'romaji': 'ze', 'cat': 'dakuten'},
    {'char': 'ゾ', 'romaji': 'zo', 'cat': 'dakuten'},
    {'char': 'ダ', 'romaji': 'da', 'cat': 'dakuten'},
    {'char': 'ヂ', 'romaji': 'di', 'cat': 'dakuten'},
    {'char': 'ヅ', 'romaji': 'du', 'cat': 'dakuten'},
    {'char': 'デ', 'romaji': 'de', 'cat': 'dakuten'},
    {'char': 'ド', 'romaji': 'do', 'cat': 'dakuten'},
    {'char': 'バ', 'romaji': 'ba', 'cat': 'dakuten'},
    {'char': 'ビ', 'romaji': 'bi', 'cat': 'dakuten'},
    {'char': 'ブ', 'romaji': 'bu', 'cat': 'dakuten'},
    {'char': 'ベ', 'romaji': 'be', 'cat': 'dakuten'},
    {'char': 'ボ', 'romaji': 'bo', 'cat': 'dakuten'},
  ];

  static const _handakuten = [
    {'char': 'パ', 'romaji': 'pa', 'cat': 'handakuten'},
    {'char': 'ピ', 'romaji': 'pi', 'cat': 'handakuten'},
    {'char': 'プ', 'romaji': 'pu', 'cat': 'handakuten'},
    {'char': 'ペ', 'romaji': 'pe', 'cat': 'handakuten'},
    {'char': 'ポ', 'romaji': 'po', 'cat': 'handakuten'},
  ];

  static const _combinations = [
    {'char': 'キャ', 'romaji': 'kya', 'cat': 'combination'},
    {'char': 'キュ', 'romaji': 'kyu', 'cat': 'combination'},
    {'char': 'キョ', 'romaji': 'kyo', 'cat': 'combination'},
    {'char': 'シャ', 'romaji': 'sha', 'cat': 'combination'},
    {'char': 'シュ', 'romaji': 'shu', 'cat': 'combination'},
    {'char': 'ショ', 'romaji': 'sho', 'cat': 'combination'},
    {'char': 'チャ', 'romaji': 'cha', 'cat': 'combination'},
    {'char': 'チュ', 'romaji': 'chu', 'cat': 'combination'},
    {'char': 'チョ', 'romaji': 'cho', 'cat': 'combination'},
    {'char': 'ニャ', 'romaji': 'nya', 'cat': 'combination'},
    {'char': 'ニュ', 'romaji': 'nyu', 'cat': 'combination'},
    {'char': 'ニョ', 'romaji': 'nyo', 'cat': 'combination'},
    {'char': 'ヒャ', 'romaji': 'hya', 'cat': 'combination'},
    {'char': 'ヒュ', 'romaji': 'hyu', 'cat': 'combination'},
    {'char': 'ヒョ', 'romaji': 'hyo', 'cat': 'combination'},
    {'char': 'ミャ', 'romaji': 'mya', 'cat': 'combination'},
    {'char': 'ミュ', 'romaji': 'myu', 'cat': 'combination'},
    {'char': 'ミョ', 'romaji': 'myo', 'cat': 'combination'},
    {'char': 'リャ', 'romaji': 'rya', 'cat': 'combination'},
    {'char': 'リュ', 'romaji': 'ryu', 'cat': 'combination'},
    {'char': 'リョ', 'romaji': 'ryo', 'cat': 'combination'},
  ];
}
