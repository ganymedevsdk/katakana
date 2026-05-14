import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_app/core/data/katakana_data.dart';
import 'package:katakana_app/core/providers/progress_provider.dart';
import 'package:katakana_app/l10n/app_localizations.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  late List<KatakanaChar> _chars;
  int _index = 0;
  final List<List<Offset>> _strokes = [];
  List<Offset> _currentStroke = [];
  bool _showHint = false;

  static const _xpReward = 15;

  @override
  void initState() {
    super.initState();
    _chars = List.of(KatakanaData.basic)..shuffle(Random());
  }

  void _clear() {
    setState(() {
      _strokes.clear();
      _currentStroke = [];
    });
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % _chars.length;
      _strokes.clear();
      _currentStroke = [];
      _showHint = false;
    });
  }

  void _toggleHint() {
    setState(() => _showHint = !_showHint);
  }

  Future<void> _verify() async {
    final l10n = AppLocalizations.of(context)!;
    final char = _chars[_index];

    if (_strokes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${l10n.drawCharacter} 🖊️')),
      );
      return;
    }

    final theme = Theme.of(context);
    final isCorrect = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.verify),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Compará tu trazo con el carácter:',
                style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(char.character,
                  style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer)),
            ),
            const SizedBox(height: 8),
            Text(char.romaji,
                style: TextStyle(
                    fontSize: 22,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Text('¿Lo escribiste correctamente?',
                style: theme.textTheme.titleSmall),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.of(ctx).pop(false),
            icon: const Icon(Icons.close, color: Colors.red),
            label: Text(l10n.tryAgain,
                style: const TextStyle(color: Colors.red)),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.of(ctx).pop(true),
            icon: const Icon(Icons.check),
            label: Text('${l10n.correct} +$_xpReward XP'),
          ),
        ],
      ),
    );

    if (!mounted) return;

    if (isCorrect == true) {
      await ref
          .read(progressProvider.notifier)
          .recordCorrect(char.character, xpReward: _xpReward);
      if (!mounted) return;
      _showResultBanner(true);
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) _next();
      });
    } else if (isCorrect == false) {
      await ref.read(progressProvider.notifier).recordIncorrect(char.character);
      if (!mounted) return;
      _showResultBanner(false);
      setState(() => _showHint = true);
    }
  }

  void _showResultBanner(bool correct) {
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(correct ? Icons.check_circle : Icons.refresh,
                color: Colors.white),
            const SizedBox(width: 8),
            Text(correct
                ? '${l10n.correct} +$_xpReward XP 🎉'
                : '${l10n.tryAgain} — Mirá la guía'),
          ],
        ),
        backgroundColor: correct ? Colors.green : Colors.orange,
        duration: const Duration(milliseconds: 1100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final char = _chars[_index];
    final progress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.writeMode),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text('${progress.xp}',
                      style: TextStyle(color: theme.colorScheme.onPrimary)),
                  const SizedBox(width: 12),
                  Text('${_index + 1}/${_chars.length}',
                      style: TextStyle(color: theme.colorScheme.onPrimary)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(l10n.drawCharacter,
                style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(char.romaji,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.secondary)),
                if (_showHint) ...[
                  const SizedBox(width: 16),
                  Text(char.character,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary.withAlpha(120))),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: theme.colorScheme.outline, width: 2),
                  borderRadius: BorderRadius.circular(16),
                  color: theme.colorScheme.surfaceContainerLowest,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        _currentStroke = [details.localPosition];
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        _currentStroke.add(details.localPosition);
                      });
                    },
                    onPanEnd: (_) {
                      setState(() {
                        _strokes.add(List.from(_currentStroke));
                        _currentStroke = [];
                      });
                    },
                    child: CustomPaint(
                      painter: _StrokePainter(
                        strokes: _strokes,
                        currentStroke: _currentStroke,
                        color: theme.colorScheme.primary,
                      ),
                      size: Size.infinite,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filledTonal(
                  onPressed: _clear,
                  tooltip: l10n.clear,
                  icon: const Icon(Icons.delete_outline),
                ),
                IconButton.filledTonal(
                  onPressed: _toggleHint,
                  tooltip: 'Pista',
                  icon: Icon(_showHint
                      ? Icons.visibility_off
                      : Icons.lightbulb_outline),
                ),
                FilledButton.icon(
                  onPressed: _verify,
                  icon: const Icon(Icons.check_circle),
                  label: Text(l10n.verify),
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: _next,
                  tooltip: l10n.next,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Validación automática con ML Kit en versión móvil',
              style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

class _StrokePainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> currentStroke;
  final Color color;

  _StrokePainter({
    required this.strokes,
    required this.currentStroke,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      _drawStroke(canvas, stroke, paint);
    }
    if (currentStroke.isNotEmpty) {
      _drawStroke(canvas, currentStroke, paint);
    }
  }

  void _drawStroke(Canvas canvas, List<Offset> points, Paint paint) {
    if (points.length < 2) {
      if (points.length == 1) {
        canvas.drawCircle(points[0], 2, paint..style = PaintingStyle.fill);
        paint.style = PaintingStyle.stroke;
      }
      return;
    }
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _StrokePainter old) => true;
}
