class KatakanaChar {
  final String character;
  final String romaji;
  final String category;

  const KatakanaChar(this.character, this.romaji, this.category);
}

class KatakanaData {
  static const basic = [
    KatakanaChar('ア', 'a', 'basic'), KatakanaChar('イ', 'i', 'basic'),
    KatakanaChar('ウ', 'u', 'basic'), KatakanaChar('エ', 'e', 'basic'),
    KatakanaChar('オ', 'o', 'basic'), KatakanaChar('カ', 'ka', 'basic'),
    KatakanaChar('キ', 'ki', 'basic'), KatakanaChar('ク', 'ku', 'basic'),
    KatakanaChar('ケ', 'ke', 'basic'), KatakanaChar('コ', 'ko', 'basic'),
    KatakanaChar('サ', 'sa', 'basic'), KatakanaChar('シ', 'shi', 'basic'),
    KatakanaChar('ス', 'su', 'basic'), KatakanaChar('セ', 'se', 'basic'),
    KatakanaChar('ソ', 'so', 'basic'), KatakanaChar('タ', 'ta', 'basic'),
    KatakanaChar('チ', 'chi', 'basic'), KatakanaChar('ツ', 'tsu', 'basic'),
    KatakanaChar('テ', 'te', 'basic'), KatakanaChar('ト', 'to', 'basic'),
    KatakanaChar('ナ', 'na', 'basic'), KatakanaChar('ニ', 'ni', 'basic'),
    KatakanaChar('ヌ', 'nu', 'basic'), KatakanaChar('ネ', 'ne', 'basic'),
    KatakanaChar('ノ', 'no', 'basic'), KatakanaChar('ハ', 'ha', 'basic'),
    KatakanaChar('ヒ', 'hi', 'basic'), KatakanaChar('フ', 'fu', 'basic'),
    KatakanaChar('ヘ', 'he', 'basic'), KatakanaChar('ホ', 'ho', 'basic'),
    KatakanaChar('マ', 'ma', 'basic'), KatakanaChar('ミ', 'mi', 'basic'),
    KatakanaChar('ム', 'mu', 'basic'), KatakanaChar('メ', 'me', 'basic'),
    KatakanaChar('モ', 'mo', 'basic'), KatakanaChar('ヤ', 'ya', 'basic'),
    KatakanaChar('ユ', 'yu', 'basic'), KatakanaChar('ヨ', 'yo', 'basic'),
    KatakanaChar('ラ', 'ra', 'basic'), KatakanaChar('リ', 'ri', 'basic'),
    KatakanaChar('ル', 'ru', 'basic'), KatakanaChar('レ', 're', 'basic'),
    KatakanaChar('ロ', 'ro', 'basic'), KatakanaChar('ワ', 'wa', 'basic'),
    KatakanaChar('ヲ', 'wo', 'basic'), KatakanaChar('ン', 'n', 'basic'),
  ];

  static const dakuten = [
    KatakanaChar('ガ', 'ga', 'dakuten'), KatakanaChar('ギ', 'gi', 'dakuten'),
    KatakanaChar('グ', 'gu', 'dakuten'), KatakanaChar('ゲ', 'ge', 'dakuten'),
    KatakanaChar('ゴ', 'go', 'dakuten'), KatakanaChar('ザ', 'za', 'dakuten'),
    KatakanaChar('ジ', 'ji', 'dakuten'), KatakanaChar('ズ', 'zu', 'dakuten'),
    KatakanaChar('ゼ', 'ze', 'dakuten'), KatakanaChar('ゾ', 'zo', 'dakuten'),
    KatakanaChar('ダ', 'da', 'dakuten'), KatakanaChar('ヂ', 'di', 'dakuten'),
    KatakanaChar('ヅ', 'du', 'dakuten'), KatakanaChar('デ', 'de', 'dakuten'),
    KatakanaChar('ド', 'do', 'dakuten'), KatakanaChar('バ', 'ba', 'dakuten'),
    KatakanaChar('ビ', 'bi', 'dakuten'), KatakanaChar('ブ', 'bu', 'dakuten'),
    KatakanaChar('ベ', 'be', 'dakuten'), KatakanaChar('ボ', 'bo', 'dakuten'),
  ];

  static const handakuten = [
    KatakanaChar('パ', 'pa', 'handakuten'), KatakanaChar('ピ', 'pi', 'handakuten'),
    KatakanaChar('プ', 'pu', 'handakuten'), KatakanaChar('ペ', 'pe', 'handakuten'),
    KatakanaChar('ポ', 'po', 'handakuten'),
  ];

  static const combinations = [
    KatakanaChar('キャ', 'kya', 'combination'), KatakanaChar('キュ', 'kyu', 'combination'),
    KatakanaChar('キョ', 'kyo', 'combination'), KatakanaChar('シャ', 'sha', 'combination'),
    KatakanaChar('シュ', 'shu', 'combination'), KatakanaChar('ショ', 'sho', 'combination'),
    KatakanaChar('チャ', 'cha', 'combination'), KatakanaChar('チュ', 'chu', 'combination'),
    KatakanaChar('チョ', 'cho', 'combination'), KatakanaChar('ニャ', 'nya', 'combination'),
    KatakanaChar('ニュ', 'nyu', 'combination'), KatakanaChar('ニョ', 'nyo', 'combination'),
    KatakanaChar('ヒャ', 'hya', 'combination'), KatakanaChar('ヒュ', 'hyu', 'combination'),
    KatakanaChar('ヒョ', 'hyo', 'combination'), KatakanaChar('ミャ', 'mya', 'combination'),
    KatakanaChar('ミュ', 'myu', 'combination'), KatakanaChar('ミョ', 'myo', 'combination'),
    KatakanaChar('リャ', 'rya', 'combination'), KatakanaChar('リュ', 'ryu', 'combination'),
    KatakanaChar('リョ', 'ryo', 'combination'),
  ];

  static List<KatakanaChar> get all => [...basic, ...dakuten, ...handakuten, ...combinations];
}
