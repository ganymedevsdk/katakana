import 'package:flutter/material.dart';
import 'package:katakana_app/l10n/app_localizations.dart';

class KatakanaTableScreen extends StatelessWidget {
  const KatakanaTableScreen({super.key});

  static const _vowels = ['ア a', 'イ i', 'ウ u', 'エ e', 'オ o'];
  static const _rows = [
    ['カ ka', 'キ ki', 'ク ku', 'ケ ke', 'コ ko'],
    ['サ sa', 'シ shi', 'ス su', 'セ se', 'ソ so'],
    ['タ ta', 'チ chi', 'ツ tsu', 'テ te', 'ト to'],
    ['ナ na', 'ニ ni', 'ヌ nu', 'ネ ne', 'ノ no'],
    ['ハ ha', 'ヒ hi', 'フ fu', 'ヘ he', 'ホ ho'],
    ['マ ma', 'ミ mi', 'ム mu', 'メ me', 'モ mo'],
    ['ヤ ya', '', 'ユ yu', '', 'ヨ yo'],
    ['ラ ra', 'リ ri', 'ル ru', 'レ re', 'ロ ro'],
    ['ワ wa', '', '', '', 'ヲ wo'],
    ['ン n', '', '', '', ''],
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.katakanaTable)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.basicKatakana,
                style: theme.textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.primary)),
            const SizedBox(height: 8),
            _buildRow(context, _vowels),
            for (final row in _rows) _buildRow(context, row),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, List<String> cells) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: cells.map((cell) {
          if (cell.isEmpty) {
            return const Expanded(child: SizedBox(height: 56));
          }
          final parts = cell.split(' ');
          final katakana = parts[0];
          final romaji = parts.length > 1 ? parts[1] : '';
          return Expanded(
            child: Card(
              child: SizedBox(
                height: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(katakana,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        )),
                    Text(romaji,
                        style: TextStyle(
                          fontSize: 10,
                          color: theme.colorScheme.onSurfaceVariant,
                        )),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
