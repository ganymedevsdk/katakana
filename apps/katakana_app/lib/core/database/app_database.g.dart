// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $KatakanaCharactersTable extends KatakanaCharacters
    with TableInfo<$KatakanaCharactersTable, KatakanaCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KatakanaCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _characterMeta = const VerificationMeta(
    'character',
  );
  @override
  late final GeneratedColumn<String> character = GeneratedColumn<String>(
    'character',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 4,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _romajiMeta = const VerificationMeta('romaji');
  @override
  late final GeneratedColumn<String> romaji = GeneratedColumn<String>(
    'romaji',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    character,
    romaji,
    category,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'katakana_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<KatakanaCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character')) {
      context.handle(
        _characterMeta,
        character.isAcceptableOrUnknown(data['character']!, _characterMeta),
      );
    } else if (isInserting) {
      context.missing(_characterMeta);
    }
    if (data.containsKey('romaji')) {
      context.handle(
        _romajiMeta,
        romaji.isAcceptableOrUnknown(data['romaji']!, _romajiMeta),
      );
    } else if (isInserting) {
      context.missing(_romajiMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KatakanaCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KatakanaCharacter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      character: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character'],
      )!,
      romaji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}romaji'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $KatakanaCharactersTable createAlias(String alias) {
    return $KatakanaCharactersTable(attachedDatabase, alias);
  }
}

class KatakanaCharacter extends DataClass
    implements Insertable<KatakanaCharacter> {
  final int id;
  final String character;
  final String romaji;
  final String category;
  final int sortOrder;
  const KatakanaCharacter({
    required this.id,
    required this.character,
    required this.romaji,
    required this.category,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character'] = Variable<String>(character);
    map['romaji'] = Variable<String>(romaji);
    map['category'] = Variable<String>(category);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  KatakanaCharactersCompanion toCompanion(bool nullToAbsent) {
    return KatakanaCharactersCompanion(
      id: Value(id),
      character: Value(character),
      romaji: Value(romaji),
      category: Value(category),
      sortOrder: Value(sortOrder),
    );
  }

  factory KatakanaCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KatakanaCharacter(
      id: serializer.fromJson<int>(json['id']),
      character: serializer.fromJson<String>(json['character']),
      romaji: serializer.fromJson<String>(json['romaji']),
      category: serializer.fromJson<String>(json['category']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'character': serializer.toJson<String>(character),
      'romaji': serializer.toJson<String>(romaji),
      'category': serializer.toJson<String>(category),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  KatakanaCharacter copyWith({
    int? id,
    String? character,
    String? romaji,
    String? category,
    int? sortOrder,
  }) => KatakanaCharacter(
    id: id ?? this.id,
    character: character ?? this.character,
    romaji: romaji ?? this.romaji,
    category: category ?? this.category,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  KatakanaCharacter copyWithCompanion(KatakanaCharactersCompanion data) {
    return KatakanaCharacter(
      id: data.id.present ? data.id.value : this.id,
      character: data.character.present ? data.character.value : this.character,
      romaji: data.romaji.present ? data.romaji.value : this.romaji,
      category: data.category.present ? data.category.value : this.category,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KatakanaCharacter(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('romaji: $romaji, ')
          ..write('category: $category, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, character, romaji, category, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KatakanaCharacter &&
          other.id == this.id &&
          other.character == this.character &&
          other.romaji == this.romaji &&
          other.category == this.category &&
          other.sortOrder == this.sortOrder);
}

class KatakanaCharactersCompanion extends UpdateCompanion<KatakanaCharacter> {
  final Value<int> id;
  final Value<String> character;
  final Value<String> romaji;
  final Value<String> category;
  final Value<int> sortOrder;
  const KatakanaCharactersCompanion({
    this.id = const Value.absent(),
    this.character = const Value.absent(),
    this.romaji = const Value.absent(),
    this.category = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  KatakanaCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String character,
    required String romaji,
    required String category,
    this.sortOrder = const Value.absent(),
  }) : character = Value(character),
       romaji = Value(romaji),
       category = Value(category);
  static Insertable<KatakanaCharacter> custom({
    Expression<int>? id,
    Expression<String>? character,
    Expression<String>? romaji,
    Expression<String>? category,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (character != null) 'character': character,
      if (romaji != null) 'romaji': romaji,
      if (category != null) 'category': category,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  KatakanaCharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? character,
    Value<String>? romaji,
    Value<String>? category,
    Value<int>? sortOrder,
  }) {
    return KatakanaCharactersCompanion(
      id: id ?? this.id,
      character: character ?? this.character,
      romaji: romaji ?? this.romaji,
      category: category ?? this.category,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (character.present) {
      map['character'] = Variable<String>(character.value);
    }
    if (romaji.present) {
      map['romaji'] = Variable<String>(romaji.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KatakanaCharactersCompanion(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('romaji: $romaji, ')
          ..write('category: $category, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $CharacterProgressTable extends CharacterProgress
    with TableInfo<$CharacterProgressTable, CharacterProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES katakana_characters (id)',
    ),
  );
  static const VerificationMeta _timesCorrectMeta = const VerificationMeta(
    'timesCorrect',
  );
  @override
  late final GeneratedColumn<int> timesCorrect = GeneratedColumn<int>(
    'times_correct',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _timesIncorrectMeta = const VerificationMeta(
    'timesIncorrect',
  );
  @override
  late final GeneratedColumn<int> timesIncorrect = GeneratedColumn<int>(
    'times_incorrect',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPracticedMeta = const VerificationMeta(
    'lastPracticed',
  );
  @override
  late final GeneratedColumn<DateTime> lastPracticed =
      GeneratedColumn<DateTime>(
        'last_practiced',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _intervalMeta = const VerificationMeta(
    'interval',
  );
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
    'interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterId,
    timesCorrect,
    timesIncorrect,
    lastPracticed,
    easeFactor,
    interval,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('times_correct')) {
      context.handle(
        _timesCorrectMeta,
        timesCorrect.isAcceptableOrUnknown(
          data['times_correct']!,
          _timesCorrectMeta,
        ),
      );
    }
    if (data.containsKey('times_incorrect')) {
      context.handle(
        _timesIncorrectMeta,
        timesIncorrect.isAcceptableOrUnknown(
          data['times_incorrect']!,
          _timesIncorrectMeta,
        ),
      );
    }
    if (data.containsKey('last_practiced')) {
      context.handle(
        _lastPracticedMeta,
        lastPracticed.isAcceptableOrUnknown(
          data['last_practiced']!,
          _lastPracticedMeta,
        ),
      );
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('interval')) {
      context.handle(
        _intervalMeta,
        interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterProgressData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}character_id'],
      )!,
      timesCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}times_correct'],
      )!,
      timesIncorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}times_incorrect'],
      )!,
      lastPracticed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_practiced'],
      )!,
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      interval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval'],
      )!,
    );
  }

  @override
  $CharacterProgressTable createAlias(String alias) {
    return $CharacterProgressTable(attachedDatabase, alias);
  }
}

class CharacterProgressData extends DataClass
    implements Insertable<CharacterProgressData> {
  final int id;
  final int characterId;
  final int timesCorrect;
  final int timesIncorrect;
  final DateTime lastPracticed;
  final double easeFactor;
  final int interval;
  const CharacterProgressData({
    required this.id,
    required this.characterId,
    required this.timesCorrect,
    required this.timesIncorrect,
    required this.lastPracticed,
    required this.easeFactor,
    required this.interval,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_id'] = Variable<int>(characterId);
    map['times_correct'] = Variable<int>(timesCorrect);
    map['times_incorrect'] = Variable<int>(timesIncorrect);
    map['last_practiced'] = Variable<DateTime>(lastPracticed);
    map['ease_factor'] = Variable<double>(easeFactor);
    map['interval'] = Variable<int>(interval);
    return map;
  }

  CharacterProgressCompanion toCompanion(bool nullToAbsent) {
    return CharacterProgressCompanion(
      id: Value(id),
      characterId: Value(characterId),
      timesCorrect: Value(timesCorrect),
      timesIncorrect: Value(timesIncorrect),
      lastPracticed: Value(lastPracticed),
      easeFactor: Value(easeFactor),
      interval: Value(interval),
    );
  }

  factory CharacterProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterProgressData(
      id: serializer.fromJson<int>(json['id']),
      characterId: serializer.fromJson<int>(json['characterId']),
      timesCorrect: serializer.fromJson<int>(json['timesCorrect']),
      timesIncorrect: serializer.fromJson<int>(json['timesIncorrect']),
      lastPracticed: serializer.fromJson<DateTime>(json['lastPracticed']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      interval: serializer.fromJson<int>(json['interval']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterId': serializer.toJson<int>(characterId),
      'timesCorrect': serializer.toJson<int>(timesCorrect),
      'timesIncorrect': serializer.toJson<int>(timesIncorrect),
      'lastPracticed': serializer.toJson<DateTime>(lastPracticed),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'interval': serializer.toJson<int>(interval),
    };
  }

  CharacterProgressData copyWith({
    int? id,
    int? characterId,
    int? timesCorrect,
    int? timesIncorrect,
    DateTime? lastPracticed,
    double? easeFactor,
    int? interval,
  }) => CharacterProgressData(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    timesCorrect: timesCorrect ?? this.timesCorrect,
    timesIncorrect: timesIncorrect ?? this.timesIncorrect,
    lastPracticed: lastPracticed ?? this.lastPracticed,
    easeFactor: easeFactor ?? this.easeFactor,
    interval: interval ?? this.interval,
  );
  CharacterProgressData copyWithCompanion(CharacterProgressCompanion data) {
    return CharacterProgressData(
      id: data.id.present ? data.id.value : this.id,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      timesCorrect: data.timesCorrect.present
          ? data.timesCorrect.value
          : this.timesCorrect,
      timesIncorrect: data.timesIncorrect.present
          ? data.timesIncorrect.value
          : this.timesIncorrect,
      lastPracticed: data.lastPracticed.present
          ? data.lastPracticed.value
          : this.lastPracticed,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      interval: data.interval.present ? data.interval.value : this.interval,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterProgressData(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('timesCorrect: $timesCorrect, ')
          ..write('timesIncorrect: $timesIncorrect, ')
          ..write('lastPracticed: $lastPracticed, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('interval: $interval')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterId,
    timesCorrect,
    timesIncorrect,
    lastPracticed,
    easeFactor,
    interval,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterProgressData &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.timesCorrect == this.timesCorrect &&
          other.timesIncorrect == this.timesIncorrect &&
          other.lastPracticed == this.lastPracticed &&
          other.easeFactor == this.easeFactor &&
          other.interval == this.interval);
}

class CharacterProgressCompanion
    extends UpdateCompanion<CharacterProgressData> {
  final Value<int> id;
  final Value<int> characterId;
  final Value<int> timesCorrect;
  final Value<int> timesIncorrect;
  final Value<DateTime> lastPracticed;
  final Value<double> easeFactor;
  final Value<int> interval;
  const CharacterProgressCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.timesCorrect = const Value.absent(),
    this.timesIncorrect = const Value.absent(),
    this.lastPracticed = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.interval = const Value.absent(),
  });
  CharacterProgressCompanion.insert({
    this.id = const Value.absent(),
    required int characterId,
    this.timesCorrect = const Value.absent(),
    this.timesIncorrect = const Value.absent(),
    this.lastPracticed = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.interval = const Value.absent(),
  }) : characterId = Value(characterId);
  static Insertable<CharacterProgressData> custom({
    Expression<int>? id,
    Expression<int>? characterId,
    Expression<int>? timesCorrect,
    Expression<int>? timesIncorrect,
    Expression<DateTime>? lastPracticed,
    Expression<double>? easeFactor,
    Expression<int>? interval,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (timesCorrect != null) 'times_correct': timesCorrect,
      if (timesIncorrect != null) 'times_incorrect': timesIncorrect,
      if (lastPracticed != null) 'last_practiced': lastPracticed,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (interval != null) 'interval': interval,
    });
  }

  CharacterProgressCompanion copyWith({
    Value<int>? id,
    Value<int>? characterId,
    Value<int>? timesCorrect,
    Value<int>? timesIncorrect,
    Value<DateTime>? lastPracticed,
    Value<double>? easeFactor,
    Value<int>? interval,
  }) {
    return CharacterProgressCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      timesCorrect: timesCorrect ?? this.timesCorrect,
      timesIncorrect: timesIncorrect ?? this.timesIncorrect,
      lastPracticed: lastPracticed ?? this.lastPracticed,
      easeFactor: easeFactor ?? this.easeFactor,
      interval: interval ?? this.interval,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    if (timesCorrect.present) {
      map['times_correct'] = Variable<int>(timesCorrect.value);
    }
    if (timesIncorrect.present) {
      map['times_incorrect'] = Variable<int>(timesIncorrect.value);
    }
    if (lastPracticed.present) {
      map['last_practiced'] = Variable<DateTime>(lastPracticed.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterProgressCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('timesCorrect: $timesCorrect, ')
          ..write('timesIncorrect: $timesIncorrect, ')
          ..write('lastPracticed: $lastPracticed, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('interval: $interval')
          ..write(')'))
        .toString();
  }
}

class $UserStatsTable extends UserStats
    with TableInfo<$UserStatsTable, UserStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _totalXpMeta = const VerificationMeta(
    'totalXp',
  );
  @override
  late final GeneratedColumn<int> totalXp = GeneratedColumn<int>(
    'total_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _currentStreakMeta = const VerificationMeta(
    'currentStreak',
  );
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
    'current_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPracticeDateMeta = const VerificationMeta(
    'lastPracticeDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastPracticeDate =
      GeneratedColumn<DateTime>(
        'last_practice_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _totalSessionsMeta = const VerificationMeta(
    'totalSessions',
  );
  @override
  late final GeneratedColumn<int> totalSessions = GeneratedColumn<int>(
    'total_sessions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    totalXp,
    level,
    currentStreak,
    longestStreak,
    lastPracticeDate,
    totalSessions,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total_xp')) {
      context.handle(
        _totalXpMeta,
        totalXp.isAcceptableOrUnknown(data['total_xp']!, _totalXpMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('current_streak')) {
      context.handle(
        _currentStreakMeta,
        currentStreak.isAcceptableOrUnknown(
          data['current_streak']!,
          _currentStreakMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    if (data.containsKey('last_practice_date')) {
      context.handle(
        _lastPracticeDateMeta,
        lastPracticeDate.isAcceptableOrUnknown(
          data['last_practice_date']!,
          _lastPracticeDateMeta,
        ),
      );
    }
    if (data.containsKey('total_sessions')) {
      context.handle(
        _totalSessionsMeta,
        totalSessions.isAcceptableOrUnknown(
          data['total_sessions']!,
          _totalSessionsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      totalXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_xp'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      currentStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_streak'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
      lastPracticeDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_practice_date'],
      ),
      totalSessions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sessions'],
      )!,
    );
  }

  @override
  $UserStatsTable createAlias(String alias) {
    return $UserStatsTable(attachedDatabase, alias);
  }
}

class UserStat extends DataClass implements Insertable<UserStat> {
  final int id;
  final int totalXp;
  final int level;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastPracticeDate;
  final int totalSessions;
  const UserStat({
    required this.id,
    required this.totalXp,
    required this.level,
    required this.currentStreak,
    required this.longestStreak,
    this.lastPracticeDate,
    required this.totalSessions,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['total_xp'] = Variable<int>(totalXp);
    map['level'] = Variable<int>(level);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    if (!nullToAbsent || lastPracticeDate != null) {
      map['last_practice_date'] = Variable<DateTime>(lastPracticeDate);
    }
    map['total_sessions'] = Variable<int>(totalSessions);
    return map;
  }

  UserStatsCompanion toCompanion(bool nullToAbsent) {
    return UserStatsCompanion(
      id: Value(id),
      totalXp: Value(totalXp),
      level: Value(level),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastPracticeDate: lastPracticeDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPracticeDate),
      totalSessions: Value(totalSessions),
    );
  }

  factory UserStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStat(
      id: serializer.fromJson<int>(json['id']),
      totalXp: serializer.fromJson<int>(json['totalXp']),
      level: serializer.fromJson<int>(json['level']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastPracticeDate: serializer.fromJson<DateTime?>(
        json['lastPracticeDate'],
      ),
      totalSessions: serializer.fromJson<int>(json['totalSessions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'totalXp': serializer.toJson<int>(totalXp),
      'level': serializer.toJson<int>(level),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastPracticeDate': serializer.toJson<DateTime?>(lastPracticeDate),
      'totalSessions': serializer.toJson<int>(totalSessions),
    };
  }

  UserStat copyWith({
    int? id,
    int? totalXp,
    int? level,
    int? currentStreak,
    int? longestStreak,
    Value<DateTime?> lastPracticeDate = const Value.absent(),
    int? totalSessions,
  }) => UserStat(
    id: id ?? this.id,
    totalXp: totalXp ?? this.totalXp,
    level: level ?? this.level,
    currentStreak: currentStreak ?? this.currentStreak,
    longestStreak: longestStreak ?? this.longestStreak,
    lastPracticeDate: lastPracticeDate.present
        ? lastPracticeDate.value
        : this.lastPracticeDate,
    totalSessions: totalSessions ?? this.totalSessions,
  );
  UserStat copyWithCompanion(UserStatsCompanion data) {
    return UserStat(
      id: data.id.present ? data.id.value : this.id,
      totalXp: data.totalXp.present ? data.totalXp.value : this.totalXp,
      level: data.level.present ? data.level.value : this.level,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      lastPracticeDate: data.lastPracticeDate.present
          ? data.lastPracticeDate.value
          : this.lastPracticeDate,
      totalSessions: data.totalSessions.present
          ? data.totalSessions.value
          : this.totalSessions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserStat(')
          ..write('id: $id, ')
          ..write('totalXp: $totalXp, ')
          ..write('level: $level, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastPracticeDate: $lastPracticeDate, ')
          ..write('totalSessions: $totalSessions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    totalXp,
    level,
    currentStreak,
    longestStreak,
    lastPracticeDate,
    totalSessions,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStat &&
          other.id == this.id &&
          other.totalXp == this.totalXp &&
          other.level == this.level &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastPracticeDate == this.lastPracticeDate &&
          other.totalSessions == this.totalSessions);
}

class UserStatsCompanion extends UpdateCompanion<UserStat> {
  final Value<int> id;
  final Value<int> totalXp;
  final Value<int> level;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime?> lastPracticeDate;
  final Value<int> totalSessions;
  const UserStatsCompanion({
    this.id = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.level = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastPracticeDate = const Value.absent(),
    this.totalSessions = const Value.absent(),
  });
  UserStatsCompanion.insert({
    this.id = const Value.absent(),
    this.totalXp = const Value.absent(),
    this.level = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastPracticeDate = const Value.absent(),
    this.totalSessions = const Value.absent(),
  });
  static Insertable<UserStat> custom({
    Expression<int>? id,
    Expression<int>? totalXp,
    Expression<int>? level,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastPracticeDate,
    Expression<int>? totalSessions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (totalXp != null) 'total_xp': totalXp,
      if (level != null) 'level': level,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastPracticeDate != null) 'last_practice_date': lastPracticeDate,
      if (totalSessions != null) 'total_sessions': totalSessions,
    });
  }

  UserStatsCompanion copyWith({
    Value<int>? id,
    Value<int>? totalXp,
    Value<int>? level,
    Value<int>? currentStreak,
    Value<int>? longestStreak,
    Value<DateTime?>? lastPracticeDate,
    Value<int>? totalSessions,
  }) {
    return UserStatsCompanion(
      id: id ?? this.id,
      totalXp: totalXp ?? this.totalXp,
      level: level ?? this.level,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastPracticeDate: lastPracticeDate ?? this.lastPracticeDate,
      totalSessions: totalSessions ?? this.totalSessions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalXp.present) {
      map['total_xp'] = Variable<int>(totalXp.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastPracticeDate.present) {
      map['last_practice_date'] = Variable<DateTime>(lastPracticeDate.value);
    }
    if (totalSessions.present) {
      map['total_sessions'] = Variable<int>(totalSessions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStatsCompanion(')
          ..write('id: $id, ')
          ..write('totalXp: $totalXp, ')
          ..write('level: $level, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastPracticeDate: $lastPracticeDate, ')
          ..write('totalSessions: $totalSessions')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $KatakanaCharactersTable katakanaCharacters =
      $KatakanaCharactersTable(this);
  late final $CharacterProgressTable characterProgress =
      $CharacterProgressTable(this);
  late final $UserStatsTable userStats = $UserStatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    katakanaCharacters,
    characterProgress,
    userStats,
  ];
}

typedef $$KatakanaCharactersTableCreateCompanionBuilder =
    KatakanaCharactersCompanion Function({
      Value<int> id,
      required String character,
      required String romaji,
      required String category,
      Value<int> sortOrder,
    });
typedef $$KatakanaCharactersTableUpdateCompanionBuilder =
    KatakanaCharactersCompanion Function({
      Value<int> id,
      Value<String> character,
      Value<String> romaji,
      Value<String> category,
      Value<int> sortOrder,
    });

final class $$KatakanaCharactersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $KatakanaCharactersTable,
          KatakanaCharacter
        > {
  $$KatakanaCharactersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $CharacterProgressTable,
    List<CharacterProgressData>
  >
  _characterProgressRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.characterProgress,
        aliasName: $_aliasNameGenerator(
          db.katakanaCharacters.id,
          db.characterProgress.characterId,
        ),
      );

  $$CharacterProgressTableProcessedTableManager get characterProgressRefs {
    final manager = $$CharacterProgressTableTableManager(
      $_db,
      $_db.characterProgress,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterProgressRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$KatakanaCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $KatakanaCharactersTable> {
  $$KatakanaCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get romaji => $composableBuilder(
    column: $table.romaji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> characterProgressRefs(
    Expression<bool> Function($$CharacterProgressTableFilterComposer f) f,
  ) {
    final $$CharacterProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterProgress,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterProgressTableFilterComposer(
            $db: $db,
            $table: $db.characterProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KatakanaCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $KatakanaCharactersTable> {
  $$KatakanaCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get romaji => $composableBuilder(
    column: $table.romaji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KatakanaCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $KatakanaCharactersTable> {
  $$KatakanaCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  GeneratedColumn<String> get romaji =>
      $composableBuilder(column: $table.romaji, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> characterProgressRefs<T extends Object>(
    Expression<T> Function($$CharacterProgressTableAnnotationComposer a) f,
  ) {
    final $$CharacterProgressTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.characterProgress,
          getReferencedColumn: (t) => t.characterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CharacterProgressTableAnnotationComposer(
                $db: $db,
                $table: $db.characterProgress,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$KatakanaCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KatakanaCharactersTable,
          KatakanaCharacter,
          $$KatakanaCharactersTableFilterComposer,
          $$KatakanaCharactersTableOrderingComposer,
          $$KatakanaCharactersTableAnnotationComposer,
          $$KatakanaCharactersTableCreateCompanionBuilder,
          $$KatakanaCharactersTableUpdateCompanionBuilder,
          (KatakanaCharacter, $$KatakanaCharactersTableReferences),
          KatakanaCharacter,
          PrefetchHooks Function({bool characterProgressRefs})
        > {
  $$KatakanaCharactersTableTableManager(
    _$AppDatabase db,
    $KatakanaCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KatakanaCharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KatakanaCharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KatakanaCharactersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> character = const Value.absent(),
                Value<String> romaji = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => KatakanaCharactersCompanion(
                id: id,
                character: character,
                romaji: romaji,
                category: category,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String character,
                required String romaji,
                required String category,
                Value<int> sortOrder = const Value.absent(),
              }) => KatakanaCharactersCompanion.insert(
                id: id,
                character: character,
                romaji: romaji,
                category: category,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$KatakanaCharactersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterProgressRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (characterProgressRefs) db.characterProgress,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (characterProgressRefs)
                    await $_getPrefetchedData<
                      KatakanaCharacter,
                      $KatakanaCharactersTable,
                      CharacterProgressData
                    >(
                      currentTable: table,
                      referencedTable: $$KatakanaCharactersTableReferences
                          ._characterProgressRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$KatakanaCharactersTableReferences(
                            db,
                            table,
                            p0,
                          ).characterProgressRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.characterId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$KatakanaCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KatakanaCharactersTable,
      KatakanaCharacter,
      $$KatakanaCharactersTableFilterComposer,
      $$KatakanaCharactersTableOrderingComposer,
      $$KatakanaCharactersTableAnnotationComposer,
      $$KatakanaCharactersTableCreateCompanionBuilder,
      $$KatakanaCharactersTableUpdateCompanionBuilder,
      (KatakanaCharacter, $$KatakanaCharactersTableReferences),
      KatakanaCharacter,
      PrefetchHooks Function({bool characterProgressRefs})
    >;
typedef $$CharacterProgressTableCreateCompanionBuilder =
    CharacterProgressCompanion Function({
      Value<int> id,
      required int characterId,
      Value<int> timesCorrect,
      Value<int> timesIncorrect,
      Value<DateTime> lastPracticed,
      Value<double> easeFactor,
      Value<int> interval,
    });
typedef $$CharacterProgressTableUpdateCompanionBuilder =
    CharacterProgressCompanion Function({
      Value<int> id,
      Value<int> characterId,
      Value<int> timesCorrect,
      Value<int> timesIncorrect,
      Value<DateTime> lastPracticed,
      Value<double> easeFactor,
      Value<int> interval,
    });

final class $$CharacterProgressTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CharacterProgressTable,
          CharacterProgressData
        > {
  $$CharacterProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $KatakanaCharactersTable _characterIdTable(_$AppDatabase db) =>
      db.katakanaCharacters.createAlias(
        $_aliasNameGenerator(
          db.characterProgress.characterId,
          db.katakanaCharacters.id,
        ),
      );

  $$KatakanaCharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<int>('character_id')!;

    final manager = $$KatakanaCharactersTableTableManager(
      $_db,
      $_db.katakanaCharacters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterProgressTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterProgressTable> {
  $$CharacterProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timesCorrect => $composableBuilder(
    column: $table.timesCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timesIncorrect => $composableBuilder(
    column: $table.timesIncorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPracticed => $composableBuilder(
    column: $table.lastPracticed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnFilters(column),
  );

  $$KatakanaCharactersTableFilterComposer get characterId {
    final $$KatakanaCharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.katakanaCharacters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KatakanaCharactersTableFilterComposer(
            $db: $db,
            $table: $db.katakanaCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterProgressTable> {
  $$CharacterProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timesCorrect => $composableBuilder(
    column: $table.timesCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timesIncorrect => $composableBuilder(
    column: $table.timesIncorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPracticed => $composableBuilder(
    column: $table.lastPracticed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnOrderings(column),
  );

  $$KatakanaCharactersTableOrderingComposer get characterId {
    final $$KatakanaCharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.katakanaCharacters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KatakanaCharactersTableOrderingComposer(
            $db: $db,
            $table: $db.katakanaCharacters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterProgressTable> {
  $$CharacterProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get timesCorrect => $composableBuilder(
    column: $table.timesCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timesIncorrect => $composableBuilder(
    column: $table.timesIncorrect,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPracticed => $composableBuilder(
    column: $table.lastPracticed,
    builder: (column) => column,
  );

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get interval =>
      $composableBuilder(column: $table.interval, builder: (column) => column);

  $$KatakanaCharactersTableAnnotationComposer get characterId {
    final $$KatakanaCharactersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.characterId,
          referencedTable: $db.katakanaCharacters,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$KatakanaCharactersTableAnnotationComposer(
                $db: $db,
                $table: $db.katakanaCharacters,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CharacterProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterProgressTable,
          CharacterProgressData,
          $$CharacterProgressTableFilterComposer,
          $$CharacterProgressTableOrderingComposer,
          $$CharacterProgressTableAnnotationComposer,
          $$CharacterProgressTableCreateCompanionBuilder,
          $$CharacterProgressTableUpdateCompanionBuilder,
          (CharacterProgressData, $$CharacterProgressTableReferences),
          CharacterProgressData,
          PrefetchHooks Function({bool characterId})
        > {
  $$CharacterProgressTableTableManager(
    _$AppDatabase db,
    $CharacterProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterProgressTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> characterId = const Value.absent(),
                Value<int> timesCorrect = const Value.absent(),
                Value<int> timesIncorrect = const Value.absent(),
                Value<DateTime> lastPracticed = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> interval = const Value.absent(),
              }) => CharacterProgressCompanion(
                id: id,
                characterId: characterId,
                timesCorrect: timesCorrect,
                timesIncorrect: timesIncorrect,
                lastPracticed: lastPracticed,
                easeFactor: easeFactor,
                interval: interval,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int characterId,
                Value<int> timesCorrect = const Value.absent(),
                Value<int> timesIncorrect = const Value.absent(),
                Value<DateTime> lastPracticed = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> interval = const Value.absent(),
              }) => CharacterProgressCompanion.insert(
                id: id,
                characterId: characterId,
                timesCorrect: timesCorrect,
                timesIncorrect: timesIncorrect,
                lastPracticed: lastPracticed,
                easeFactor: easeFactor,
                interval: interval,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable:
                                    $$CharacterProgressTableReferences
                                        ._characterIdTable(db),
                                referencedColumn:
                                    $$CharacterProgressTableReferences
                                        ._characterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CharacterProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterProgressTable,
      CharacterProgressData,
      $$CharacterProgressTableFilterComposer,
      $$CharacterProgressTableOrderingComposer,
      $$CharacterProgressTableAnnotationComposer,
      $$CharacterProgressTableCreateCompanionBuilder,
      $$CharacterProgressTableUpdateCompanionBuilder,
      (CharacterProgressData, $$CharacterProgressTableReferences),
      CharacterProgressData,
      PrefetchHooks Function({bool characterId})
    >;
typedef $$UserStatsTableCreateCompanionBuilder =
    UserStatsCompanion Function({
      Value<int> id,
      Value<int> totalXp,
      Value<int> level,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastPracticeDate,
      Value<int> totalSessions,
    });
typedef $$UserStatsTableUpdateCompanionBuilder =
    UserStatsCompanion Function({
      Value<int> id,
      Value<int> totalXp,
      Value<int> level,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastPracticeDate,
      Value<int> totalSessions,
    });

class $$UserStatsTableFilterComposer
    extends Composer<_$AppDatabase, $UserStatsTable> {
  $$UserStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPracticeDate => $composableBuilder(
    column: $table.lastPracticeDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSessions => $composableBuilder(
    column: $table.totalSessions,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserStatsTable> {
  $$UserStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalXp => $composableBuilder(
    column: $table.totalXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPracticeDate => $composableBuilder(
    column: $table.lastPracticeDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSessions => $composableBuilder(
    column: $table.totalSessions,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserStatsTable> {
  $$UserStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalXp =>
      $composableBuilder(column: $table.totalXp, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPracticeDate => $composableBuilder(
    column: $table.lastPracticeDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSessions => $composableBuilder(
    column: $table.totalSessions,
    builder: (column) => column,
  );
}

class $$UserStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserStatsTable,
          UserStat,
          $$UserStatsTableFilterComposer,
          $$UserStatsTableOrderingComposer,
          $$UserStatsTableAnnotationComposer,
          $$UserStatsTableCreateCompanionBuilder,
          $$UserStatsTableUpdateCompanionBuilder,
          (UserStat, BaseReferences<_$AppDatabase, $UserStatsTable, UserStat>),
          UserStat,
          PrefetchHooks Function()
        > {
  $$UserStatsTableTableManager(_$AppDatabase db, $UserStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastPracticeDate = const Value.absent(),
                Value<int> totalSessions = const Value.absent(),
              }) => UserStatsCompanion(
                id: id,
                totalXp: totalXp,
                level: level,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastPracticeDate: lastPracticeDate,
                totalSessions: totalSessions,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> totalXp = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastPracticeDate = const Value.absent(),
                Value<int> totalSessions = const Value.absent(),
              }) => UserStatsCompanion.insert(
                id: id,
                totalXp: totalXp,
                level: level,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastPracticeDate: lastPracticeDate,
                totalSessions: totalSessions,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserStatsTable,
      UserStat,
      $$UserStatsTableFilterComposer,
      $$UserStatsTableOrderingComposer,
      $$UserStatsTableAnnotationComposer,
      $$UserStatsTableCreateCompanionBuilder,
      $$UserStatsTableUpdateCompanionBuilder,
      (UserStat, BaseReferences<_$AppDatabase, $UserStatsTable, UserStat>),
      UserStat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$KatakanaCharactersTableTableManager get katakanaCharacters =>
      $$KatakanaCharactersTableTableManager(_db, _db.katakanaCharacters);
  $$CharacterProgressTableTableManager get characterProgress =>
      $$CharacterProgressTableTableManager(_db, _db.characterProgress);
  $$UserStatsTableTableManager get userStats =>
      $$UserStatsTableTableManager(_db, _db.userStats);
}
