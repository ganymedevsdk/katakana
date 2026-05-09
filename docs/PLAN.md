# Katakana App - Plan de Proyecto

## Información del Proyecto

**Proyecto:** Katakana Learning App para Nishi Nihongo Gakko
**Contacto:** Elizabeth Ossandon - @nishinihongogakko (Instagram)
**Versión:** 1.0.0 (planificación)

---

## 1. Arquitectura del Proyecto Katakana

Este es el repositorio principal `katakana` que funcionará como monorepo para múltiples apps de aprendizaje de japonés.

### Estructura planificada

```
katakana/
├── apps/
│   ├── katakana-app/       # App de Katakana (primera)
│   ├── hiragana-app/      # App de Hiragana (futuro)
│   ├── kanji-app/         # App de Kanji (futuro)
│   └── vocabulario-app/   # App de vocabulario (futuro)
├── shared/
│   └── core/              # Código compartido entre apps
├── docs/                  # Documentación
└── README.md
```

### Integración de Apps Futuras

Cada app seguirá el mismo patrón:
1. Se creará en `apps/[nombre]-app/`
2. Compartirá configuración de idioma desde `shared/core/`
3. Los datos de progreso serán independientes por app
4. Se podrán añadir links cruzados entre apps

---

## 2. Tecnología Propuesta

### Framework: Flutter

| Criterio | Flutter | React Native |
|----------|---------|--------------|
| Rendimiento nativo | ✅ Excelente | ✅ Muy bueno |
| Código abierto | ✅ Completamente libre | ✅ Libre |
| Hot reload | ✅ Excelente | ✅ Bueno |
| Widgets personalizados | ✅ Total control de píxeles | Limitado |
| Comunidad 2025 | 174k+ stars GitHub | Muy activa |
| Mantenimiento | Google | Meta |

**Decisión:** Flutter - mejor para interfaces personalizadas con animaciones (gamificación).

### Lenguaje: Dart

- Compile native para Android/iOS
- Single codebase completo

### Almacenamiento Local

| Tipo | Uso | Paquete recomendado |
|------|-----|---------------------|
| Preferencias (idioma, settings) | Toggle español/inglés, tema | `shared_preferences` |
| Progreso del usuario | XP, niveles, rachas | `hive` o `drift` (SQLite) |
| Estadísticas | Errores, tiempo, accuracy | `drift` (SQLite) |

**Decisión:** `shared_preferences` + `drift` (SQLite con ORM) para datos estructurados.

### Estado y Arquitectura

- **Patrón:** BLoC (Business Logic Component) o Riverpod
- **UI:** Material Design 3 con temática japonesa
- **Localización:** `flutter_localizations` + `intl`

---

## 3. Propuesta de Gamificación

Basado en investigación de apps exitosas (KanaMastery, Kana Conbini, HiraKana):

### Mecánicas Principales

#### Modos de Juego

1. **Multiple Choice** - Ver carácter → seleccionar romaji
2. **Type Romaji** - Ver carácter → escribir pronunciación
3. **Reverse Mode** - Ver romaji → seleccionar carácter katakana
4. **Speed Run** - Contra tiempo (contador)
5. **Duel/Boss** - Desafíos especiales

#### Sistema de Progresión

- **XP (Experience Points)** por respuestas correctas
- **Niveles** desbloqueables (easy → hard)
- **Racha diaria** (daily streak) - mantener motivación
- **Estrellas/Logros** por completar secciones

#### Spaced Repetition

- Caracteres errados reaparecen más frecuentemente
- Caracteres dominados se espacian (algoritmo tipo FSRS)
- Errores tracked por carácter específico

#### Sistema de Errores

- Dashboard de "caracteres más difíciles"
- Filtrar práctica por errores frecuentes
- Feedback inmediato con hints visuales

### UI/UX Gamificado

- Progress bars visuales por sección
- Animaciones de celebración (correcto)
- Sonidos de feedback
- Temas de recompensa (badges)

---

## 4. Funcionalidades Requeridas

### Core Features

| Prioridad | Feature | Descripción |
|----------|---------|-------------|
| 🔴 Alta | Toggle Idioma | Cambiar UI entre español/inglés desde settings |
| 🔴 Alta | Progreso Local | Guardar XP, niveles, rachas offline |
| 🔴 Alta | Modo Práctica | Estudiar sin presión de estadísticas |
| 🔴 Alta | Modo Quiz | Jugar con XP y niveles |
| 🟡 Media | Tabla de puntuación | Ver mejores puntuaciones |
| 🟡 Media | Tracker de errores | Ver caracteres difíciles |
| 🟢 Baja | Sonidos | Feedback auditivo |

### Katakana Coverage

- 46 caracteres básicos katakana
- Katakana con dakuten (g, z, d, b, p)
- Katakana con handakuten (p)
- Combinaciones (youon): kya, sha, cha, etc.

---

## 5. Configuración de Localization

### Idiomas Soportados

- **Español** (primary) - UI de la escuela Nishi Nihongo Gakko
- **English** - para estudiantes internacionales

### Implementación

```dart
// shared_preferences
locale: 'es' | 'en'  // Toggle desde menú configuración
```

### Strings a Localizar

- Menú de navegación
- Instrucciones de cada modo
- Feedback (correcto/incorrecto)
- Configuración
- Logros/mensajes

---

## 6. Roadmap de Desarrollo

### Fase 1: Setup y Core
- [ ] Configurar Flutter project
- [ ] Setup localization (es/en)
- [ ] Implementar shared_preferences para settings
- [ ] Crear base de datos con drift para progreso
- [ ] Navigation structure

### Fase 2: Katakana Core
- [ ] Pantalla principal (home)
- [ ] Tabla de referencia katakana
- [ ] Modo práctica (estudio libre)
- [ ] Modo quiz básico (multiple choice)

### Fase 3: Gamificación
- [ ] Sistema XP
- [ ] Niveles y progresión
- [ ] Daily streak
- [ ] Tracking de errores
- [ ] Dashboard de progreso

### Fase 4: Polish
- [ ] Animaciones
- [ ] Sonidos
- [ ] Modos adicionales (speed, reverse)
- [ ] Configuración completa

---

## 7. Paquetes NPM/AutoSkills a Instalar

Cuando se empieze a codear, ejecutar en `katakana-app/`:

```bash
# Core
flutter create katakana-app
flutter pub add flutter_localizations intl

# Estado
flutter pub add flutter_riverpod  # o flutter_bloc

# Storage
flutter pub add shared_preferences
flutter pub add drift sqlite3_flutter_libs

# UI/UX
flutter pub add go_router  # navegación
```

---

## 8. Notas para Desarrollo

1. **No exponer datos sensibles** - El progreso se guarda localmente, no requiere backend
2. **Sincronización futura** - Arquitectura permite añadir cloud sync más adelante (Firebase)
3. **Extensibilidad** - mismo patrón para apps hiragana, kanji, vocabulario
4. **Offline-first** - toda funcionalidad trabaja sin internet
5. **Testing** - considerar Flutter tests para gamificación
