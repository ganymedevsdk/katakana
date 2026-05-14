import 'package:flutter/material.dart';
import 'package:katakana_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_app/core/providers/locale_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.language,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  SegmentedButton<String>(
                    segments: [
                      ButtonSegment(
                        value: 'es',
                        label: Text(l10n.spanish),
                        icon: const Icon(Icons.language),
                      ),
                      ButtonSegment(
                        value: 'en',
                        label: Text(l10n.english),
                        icon: const Icon(Icons.language),
                      ),
                    ],
                    selected: {locale.languageCode},
                    onSelectionChanged: (selected) {
                      ref
                          .read(localeProvider.notifier)
                          .setLocale(Locale(selected.first));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
