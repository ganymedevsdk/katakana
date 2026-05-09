# Katakana Learning App

Aplicación móvil para aprender Katakana desarrollada para la escuela **Nishi Nihongo Gakko** de la profesora Elizabeth Ossandon.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 📱 Acerca del Proyecto

Este repositorio es un **monorepo** para múltiples aplicaciones de aprendizaje de japonés:

- **Katakana App** (primera) - Aprende el silabario katakana
- **Hiragana App** (próximamente)
- **Vocabulario App** (próximamente)

## 🏫 Nishi Nihongo Gakko

Escuela de japonés dirigida por la profesora Elizabeth Ossandon.

- **Instagram:** [@nishinihongogakko](https://www.instagram.com/nishinihongogakko/)

## 🎮 Características

- ✅ Toggle de idioma (Español/Inglés) desde configuración
- ✅ Progreso guardado localmente (offline-first)
- ✅ Múltiples modos de juego (Multiple Choice, Type Romaji, Speed Run)
- ✅ Sistema de XP y niveles
- ✅ Daily streak (racha diaria)
- ✅ Spaced repetition para caracteres difíciles
- ✅ Tracker de errores

## 🛠️ Tecnología

| Componente | Tecnología |
|------------|-------------|
| Framework | Flutter |
| Lenguaje | Dart |
| Storage | SQLite (drift) + SharedPreferences |
| Estado | Riverpod / BLoC |
| UI | Material Design 3 |

## 📂 Estructura

```
katakana/
├── apps/
│   └── katakana-app/    # App de Katakana
├── shared/
│   └── core/            # Código compartido
├── docs/
│   └── PLAN.md          # Plan del proyecto
└── README.md
```

## 🚀 Getting Started

```bash
# Clonar el repositorio
git clone https://github.com/ganymedevsdk/katakana.git
cd katakana

# Ver estructura de apps
ls apps/
```

## 📄 Licencia

MIT License - Ver [LICENSE](LICENSE) para detalles.

---

*Desarrollado para Nishi Nihongo Gakko 🇯🇵*

## 🎨 Branding

- Logo: `assets/images/logo.png`
- Colores de marca: extraídos del logo (pendiente de definir paleta exacta)
