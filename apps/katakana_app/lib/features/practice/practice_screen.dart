import 'dart:math';
import 'package:flutter/material.dart';
import 'package:katakana_app/core/data/katakana_data.dart';
import 'package:katakana_app/l10n/app_localizations.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late List<KatakanaChar> _chars;
  int _index = 0;
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _chars = List.of(KatakanaData.basic)..shuffle(Random());
  }

  void _next() {
    setState(() {
      _showAnswer = false;
      _index = (_index + 1) % _chars.length;
    });
  }

  void _prev() {
    setState(() {
      _showAnswer = false;
      _index = (_index - 1 + _chars.length) % _chars.length;
    });
  }

  void _flip() {
    setState(() => _showAnswer = !_showAnswer);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final char = _chars[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.practice),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('${_index + 1} / ${_chars.length}',
                  style: TextStyle(color: theme.colorScheme.onPrimary)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _flip,
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _showAnswer
                      ? _CardFace(
                          key: const ValueKey('answer'),
                          text: char.romaji,
                          fontSize: 48,
                          color: theme.colorScheme.secondary,
                          subtitle: char.character,
                        )
                      : _CardFace(
                          key: const ValueKey('question'),
                          text: char.character,
                          fontSize: 96,
                          color: theme.colorScheme.primary,
                          subtitle: '?',
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonalIcon(
                  onPressed: _prev,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(''),
                ),
                FilledButton.icon(
                  onPressed: _flip,
                  icon: Icon(_showAnswer ? Icons.visibility_off : Icons.visibility),
                  label: Text(_showAnswer ? 'Ocultar' : 'Ver'),
                ),
                FilledButton.tonalIcon(
                  onPressed: _next,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String subtitle;

  const _CardFace({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 280,
        height: 320,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: color)),
            const SizedBox(height: 16),
            Text(subtitle,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
