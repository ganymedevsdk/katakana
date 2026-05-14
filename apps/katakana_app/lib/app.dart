import 'package:flutter/material.dart';
import 'package:katakana_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_app/core/providers/locale_provider.dart';
import 'package:katakana_app/core/theme/app_theme.dart';
import 'package:katakana_app/router/app_router.dart';

class KatakanaApp extends ConsumerWidget {
  const KatakanaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Katakana App',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
