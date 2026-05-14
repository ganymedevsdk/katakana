import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_app/core/data/katakana_data.dart';
import 'package:katakana_app/core/providers/progress_provider.dart';
import 'package:katakana_app/l10n/app_localizations.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  final _random = Random();
  late List<KatakanaChar> _pool;
  int _questionIndex = 0;
  int _correct = 0;
  int _total = 0;
  int _xpEarned = 0;
  String? _selectedAnswer;
  bool _answered = false;
  late KatakanaChar _current;
  late List<String> _options;

  static const _questionsPerRound = 10;

  @override
  void initState() {
    super.initState();
    _pool = List.of(KatakanaData.basic)..shuffle(_random);
    _loadQuestion();
  }

  void _loadQuestion() {
    _current = _pool[_questionIndex % _pool.length];
    final wrongAnswers = KatakanaData.basic
        .where((c) => c.romaji != _current.romaji)
        .toList()
      ..shuffle(_random);
    _options = [
      _current.romaji,
      ...wrongAnswers.take(3).map((c) => c.romaji),
    ]..shuffle(_random);
    _selectedAnswer = null;
    _answered = false;
  }

  void _answer(String romaji) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = romaji;
      _answered = true;
      _total++;
      if (romaji == _current.romaji) {
        _correct++;
        _xpEarned += 10;
        ref
            .read(progressProvider.notifier)
            .recordCorrect(_current.character, xpReward: 10);
      } else {
        ref
            .read(progressProvider.notifier)
            .recordIncorrect(_current.character);
      }
    });
  }

  void _next() {
    setState(() {
      _questionIndex++;
      if (_questionIndex >= _questionsPerRound) {
        _showResults();
      } else {
        _loadQuestion();
      }
    });
  }

  void _showResults() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text('${l10n.finish}!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _correct >= 7 ? Icons.emoji_events : Icons.school,
              size: 64,
              color: _correct >= 7 ? Colors.amber : Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text('${l10n.score}: $_correct / $_total',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('+$_xpEarned ${l10n.xp}',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _questionIndex = 0;
                _correct = 0;
                _total = 0;
                _xpEarned = 0;
                _pool.shuffle(_random);
                _loadQuestion();
              });
            },
            child: Text(l10n.start),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: Text(l10n.finish),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.multipleChoice),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.star, color: theme.colorScheme.onPrimary, size: 18),
                  const SizedBox(width: 4),
                  Text('+$_xpEarned',
                      style: TextStyle(color: theme.colorScheme.onPrimary)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_questionIndex + 1) / _questionsPerRound,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text('${_questionIndex + 1} / $_questionsPerRound',
                style: theme.textTheme.bodySmall),
            const SizedBox(height: 32),
            Text(l10n.selectRomaji,
                style: theme.textTheme.titleMedium),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Container(
                width: 180,
                height: 180,
                alignment: Alignment.center,
                child: Text(_current.character,
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary)),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.5,
                children: _options.map((opt) {
                  Color? bgColor;
                  Color? fgColor;
                  if (_answered) {
                    if (opt == _current.romaji) {
                      bgColor = Colors.green;
                      fgColor = Colors.white;
                    } else if (opt == _selectedAnswer) {
                      bgColor = Colors.red;
                      fgColor = Colors.white;
                    }
                  }
                  return FilledButton(
                    onPressed: () => _answer(opt),
                    style: FilledButton.styleFrom(
                      backgroundColor: bgColor,
                      foregroundColor: fgColor,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text(opt),
                  );
                }).toList(),
              ),
            ),
            if (_answered)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _selectedAnswer == _current.romaji
                          ? Icons.check_circle
                          : Icons.cancel,
                      color: _selectedAnswer == _current.romaji
                          ? Colors.green
                          : Colors.red,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _selectedAnswer == _current.romaji
                          ? l10n.correct
                          : '${l10n.tryAgain}: ${_current.romaji}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _selectedAnswer == _current.romaji
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    const Spacer(),
                    FilledButton.icon(
                      onPressed: _next,
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(l10n.next),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
