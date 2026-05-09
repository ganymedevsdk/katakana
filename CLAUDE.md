# CLAUDE.md — Katakana Learning App

## Proyecto

App móvil Flutter/Dart para aprender Katakana. Desarrollada para **Nishi Nihongo Gakko** (prof. Elizabeth Ossandon, [@nishinihongogakko](https://www.instagram.com/nishinihongogakko/)).

Monorepo — primera app de una familia de apps de japonés (Hiragana, Kanji, Vocabulario).

## Stack

| Capa | Tecnología |
|------|-----------|
| Framework | Flutter 3.x |
| Lenguaje | Dart 3.x |
| Estado | Riverpod o BLoC (decidir al iniciar) |
| Storage | `shared_preferences` + `drift` (SQLite) |
| Localización | `flutter_localizations` + `intl` |
| Navegación | `go_router` |
| Handwriting | Google ML Kit Digital Ink Recognition (`ja`) |
| Canvas | `flutter_drawing_board` |
| UI | Material Design 3 con temática japonesa |

## Estado actual

- Fase de planificación — sin código Flutter todavía
- Documentación completa en `docs/PLAN.md`
- Logo en `apps/assets/images/logo.png`
- Colores de marca: pendiente extraer del logo

## Arquitectura planificada

```
katakana/
├── apps/
│   ├── assets/images/       # Assets compartidos
│   └── katakana-app/        # Flutter app principal
├── shared/
│   └── core/                # Código compartido (futuro)
├── docs/PLAN.md
├── README.md
└── LICENSE
```

## Reglas de desarrollo

- **Offline-first**: toda funcionalidad sin internet
- **Sin backend**: progreso guardado localmente (SQLite)
- **Idiomas**: español (primario) + inglés
- **`pubspec.lock` se commitea** (app, no librería)
- No exponer datos sensibles — no hay autenticación ni cuenta

## Modos de juego planeados

1. Multiple Choice
2. Type Romaji
3. Reverse Mode (romaji → katakana)
4. Speed Run (cronometrado)
5. Duel/Boss
6. Write Katakana (canvas + ML Kit)

## Roadmap

- Fase 1: Setup Flutter + localización + DB
- Fase 2: Katakana core (home, tabla, práctica, quiz, escritura)
- Fase 3: Gamificación (XP, niveles, streaks, errores)
- Fase 4: Polish (animaciones, sonidos, modos extra)
