# CLAUDE.md — Katakana Learning App

## Proyecto

App móvil Flutter/Dart para aprender Katakana. Desarrollada para **Nishi Nihongo Gakko** (prof. Elizabeth Ossandon, [@nishinihongogakko](https://www.instagram.com/nishinihongogakko/)).

Monorepo — primera app de una familia de apps de japonés (Hiragana, Kanji, Vocabulario).

## Stack

| Capa | Tecnología |
|------|-----------|
| Framework | Flutter 3.x |
| Lenguaje | Dart 3.x |
| Estado | Riverpod (`flutter_riverpod`) |
| Storage | `shared_preferences` + `drift` (SQLite) |
| Localización | `flutter_localizations` + `intl` |
| Navegación | `go_router` |
| Canvas | `flutter_drawing_board` |
| UI | Material Design 3 con temática japonesa |

## Estado actual (2026-05-14)

**Fases 1 y 2 completas.** App Flutter funcional con todas las pantallas principales.

### Pantallas implementadas
- **Home** — logo, tarjetas de progreso (nivel, XP, streak), menú de modos
- **Tabla Katakana** — tabla completa básica (ア-ン, 46 caracteres)
- **Práctica** — flashcards katakana → romaji con feedback
- **Quiz** — multiple choice, 10 preguntas, XP por respuesta correcta, resultados
- **Escritura** — canvas con `flutter_drawing_board` (sin ML Kit aún)
- **Configuración** — cambio de idioma ES/EN

### Gamificación implementada
- XP por respuesta correcta (+10 por acierto en quiz)
- Niveles (100 XP por nivel)
- Streak diario
- Progreso guardado en SQLite via Drift

### Localización
- Español (primario) e inglés
- Archivos ARB en `lib/l10n/`

## Cómo correr el proyecto

```bash
git clone https://github.com/ganymedevsdk/katakana
cd katakana/apps/katakana_app
flutter pub get
flutter run -d web-server --web-port 8080 --web-hostname localhost
```

Abrir **http://localhost:8080** en ventana incógnito la primera vez (evita caché de Service Worker).

> **No usar** `python -m http.server` — no sirve los `.wasm` con el MIME type correcto.
> Usar siempre `flutter run -d web-server`.

## Arquitectura

```
katakana/
├── apps/
│   ├── assets/images/           # Assets compartidos (logo)
│   └── katakana_app/            # Flutter app principal
│       ├── lib/
│       │   ├── main.dart        # Entry point — ProviderScope + SharedPreferences
│       │   ├── app.dart         # MaterialApp.router con tema y localización
│       │   ├── core/
│       │   │   ├── data/katakana_data.dart      # Datos: básico, dakuten, combinaciones
│       │   │   ├── database/app_database.dart   # Drift — tabla progress
│       │   │   ├── providers/locale_provider.dart
│       │   │   ├── providers/progress_provider.dart
│       │   │   └── theme/app_theme.dart         # Teal #1A8E8F + naranja #B84815
│       │   ├── features/
│       │   │   ├── home/home_screen.dart
│       │   │   ├── katakana_table/katakana_table_screen.dart
│       │   │   ├── practice/practice_screen.dart
│       │   │   ├── quiz/quiz_screen.dart
│       │   │   ├── settings/settings_screen.dart
│       │   │   └── write/write_screen.dart
│       │   ├── l10n/            # app_es.arb, app_en.arb + clases generadas
│       │   └── router/app_router.dart
│       ├── assets/images/logo.png
│       ├── pubspec.yaml
│       └── pubspec.lock         # Se commitea — es una app, no librería
├── shared/
│   └── core/                   # Código compartido futuro (Hiragana, Kanji...)
├── docs/PLAN.md
├── README.md
└── LICENSE
```

## Reglas de desarrollo

- **Offline-first**: toda funcionalidad sin internet
- **Sin backend**: progreso guardado localmente (SQLite via Drift)
- **Idiomas**: español (primario) + inglés
- **`pubspec.lock` se commitea** (app, no librería)
- Sin autenticación, sin cuentas, sin datos de usuario en servidores
- Colores de marca: teal `#1A8E8F` (primario), naranja `#B84815` (secundario)

## Modos de juego

| Modo | Estado |
|------|--------|
| Multiple Choice (Quiz) | ✅ Implementado |
| Tabla Katakana | ✅ Implementado |
| Práctica (flashcards) | ✅ Implementado |
| Escritura (canvas) | ⚠️ Canvas listo, sin reconocimiento ML |
| Type Romaji | ⏳ Pendiente |
| Reverse Mode (romaji → katakana) | ⏳ Pendiente |
| Speed Run (cronometrado) | ⏳ Pendiente |
| Duel/Boss | ⏳ Pendiente |

## Roadmap

- ~~Fase 1: Setup Flutter + localización + DB~~ ✅
- ~~Fase 2: Katakana core (home, tabla, práctica, quiz, escritura)~~ ✅
- **Fase 3**: Gamificación avanzada (logros, errores frecuentes, ranking)
- **Fase 4**: Modos restantes (Type Romaji, Speed Run, Reverse, Duel)
- **Fase 5**: Hiragana app (reutilizar estructura en `shared/core/`)
- **Fase 6**: ML Kit handwriting recognition para modo escritura
- **Fase 7**: Polish (animaciones, sonidos, accesibilidad)
