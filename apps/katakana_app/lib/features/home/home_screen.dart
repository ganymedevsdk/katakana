import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:katakana_app/core/providers/progress_provider.dart';
import 'package:katakana_app/l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final progress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Image.asset('assets/images/logo.png', height: 96),
              const SizedBox(height: 16),
              _ProgressHeader(progress: progress),
              const SizedBox(height: 16),
              _MenuCard(
                icon: Icons.table_chart,
                title: l10n.katakanaTable,
                color: theme.colorScheme.primary,
                onTap: () => context.push('/katakana-table'),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.school,
                title: l10n.practice,
                color: theme.colorScheme.secondary,
                onTap: () => context.push('/practice'),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.quiz,
                title: l10n.quiz,
                color: theme.colorScheme.tertiary,
                onTap: () => context.push('/quiz'),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.draw,
                title: l10n.writeMode,
                color: theme.colorScheme.primary,
                onTap: () => context.push('/write'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  final UserProgress progress;

  const _ProgressHeader({required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatTile(
                  icon: Icons.military_tech,
                  iconColor: theme.colorScheme.primary,
                  label: l10n.level,
                  value: '${progress.level}',
                ),
                _StatTile(
                  icon: Icons.star,
                  iconColor: Colors.amber,
                  label: l10n.xp,
                  value: '${progress.xp}',
                ),
                _StatTile(
                  icon: Icons.local_fire_department,
                  iconColor: Colors.orange,
                  label: l10n.dailyStreak,
                  value: '${progress.currentStreak}',
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress.progressToNext,
                minHeight: 10,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${progress.xpInLevel} / ${UserProgress.xpPerLevel} XP',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 28),
        const SizedBox(height: 4),
        Text(value,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withAlpha(30),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Icon(Icons.chevron_right, color: color),
        onTap: onTap,
      ),
    );
  }
}
