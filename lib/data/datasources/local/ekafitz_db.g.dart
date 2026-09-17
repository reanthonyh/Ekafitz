// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ekafitz_db.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 48,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 8,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Gender, String> gender =
      GeneratedColumn<String>(
        'gender',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Gender>($UserTableTable.$convertergender);
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    email,
    birthDate,
    gender,
    passwordHash,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      gender: $UserTableTable.$convertergender.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gender'],
        )!,
      ),
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Gender, String, String> $convertergender =
      const EnumNameConverter<Gender>(Gender.values);
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final String id;
  final String fullName;
  final String email;
  final DateTime? birthDate;
  final Gender gender;
  final String passwordHash;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const UserTableData({
    required this.id,
    required this.fullName,
    required this.email,
    this.birthDate,
    required this.gender,
    required this.passwordHash,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    {
      map['gender'] = Variable<String>(
        $UserTableTable.$convertergender.toSql(gender),
      );
    }
    map['password_hash'] = Variable<String>(passwordHash);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      fullName: Value(fullName),
      email: Value(email),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      gender: Value(gender),
      passwordHash: Value(passwordHash),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory UserTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      gender: $UserTableTable.$convertergender.fromJson(
        serializer.fromJson<String>(json['gender']),
      ),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'gender': serializer.toJson<String>(
        $UserTableTable.$convertergender.toJson(gender),
      ),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  UserTableData copyWith({
    String? id,
    String? fullName,
    String? email,
    Value<DateTime?> birthDate = const Value.absent(),
    Gender? gender,
    String? passwordHash,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => UserTableData(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    gender: gender ?? this.gender,
    passwordHash: passwordHash ?? this.passwordHash,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      gender: data.gender.present ? data.gender.value : this.gender,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    email,
    birthDate,
    gender,
    passwordHash,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.birthDate == this.birthDate &&
          other.gender == this.gender &&
          other.passwordHash == this.passwordHash &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<String> email;
  final Value<DateTime?> birthDate;
  final Value<Gender> gender;
  final Value<String> passwordHash;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.gender = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserTableCompanion.insert({
    required String id,
    required String fullName,
    required String email,
    this.birthDate = const Value.absent(),
    required Gender gender,
    required String passwordHash,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fullName = Value(fullName),
       email = Value(email),
       gender = Value(gender),
       passwordHash = Value(passwordHash);
  static Insertable<UserTableData> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<DateTime>? birthDate,
    Expression<String>? gender,
    Expression<String>? passwordHash,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (birthDate != null) 'birth_date': birthDate,
      if (gender != null) 'gender': gender,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserTableCompanion copyWith({
    Value<String>? id,
    Value<String>? fullName,
    Value<String>? email,
    Value<DateTime?>? birthDate,
    Value<Gender>? gender,
    Value<String>? passwordHash,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return UserTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      passwordHash: passwordHash ?? this.passwordHash,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(
        $UserTableTable.$convertergender.toSql(gender.value),
      );
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FitnessProfileTableTable extends FitnessProfileTable
    with TableInfo<$FitnessProfileTableTable, FitnessProfileTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FitnessProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_table (id)',
    ),
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<BodySomatotype, String>
  bodySomatotype =
      GeneratedColumn<String>(
        'body_somatotype',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<BodySomatotype>(
        $FitnessProfileTableTable.$converterbodySomatotype,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    age,
    height,
    weight,
    bodySomatotype,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fitness_profile_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FitnessProfileTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FitnessProfileTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FitnessProfileTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      bodySomatotype: $FitnessProfileTableTable.$converterbodySomatotype
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}body_somatotype'],
            )!,
          ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $FitnessProfileTableTable createAlias(String alias) {
    return $FitnessProfileTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BodySomatotype, String, String>
  $converterbodySomatotype = const EnumNameConverter<BodySomatotype>(
    BodySomatotype.values,
  );
}

class FitnessProfileTableData extends DataClass
    implements Insertable<FitnessProfileTableData> {
  final String id;
  final String userId;
  final int age;
  final double height;
  final double weight;
  final BodySomatotype bodySomatotype;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const FitnessProfileTableData({
    required this.id,
    required this.userId,
    required this.age,
    required this.height,
    required this.weight,
    required this.bodySomatotype,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['age'] = Variable<int>(age);
    map['height'] = Variable<double>(height);
    map['weight'] = Variable<double>(weight);
    {
      map['body_somatotype'] = Variable<String>(
        $FitnessProfileTableTable.$converterbodySomatotype.toSql(
          bodySomatotype,
        ),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  FitnessProfileTableCompanion toCompanion(bool nullToAbsent) {
    return FitnessProfileTableCompanion(
      id: Value(id),
      userId: Value(userId),
      age: Value(age),
      height: Value(height),
      weight: Value(weight),
      bodySomatotype: Value(bodySomatotype),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FitnessProfileTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FitnessProfileTableData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      age: serializer.fromJson<int>(json['age']),
      height: serializer.fromJson<double>(json['height']),
      weight: serializer.fromJson<double>(json['weight']),
      bodySomatotype: $FitnessProfileTableTable.$converterbodySomatotype
          .fromJson(serializer.fromJson<String>(json['bodySomatotype'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'age': serializer.toJson<int>(age),
      'height': serializer.toJson<double>(height),
      'weight': serializer.toJson<double>(weight),
      'bodySomatotype': serializer.toJson<String>(
        $FitnessProfileTableTable.$converterbodySomatotype.toJson(
          bodySomatotype,
        ),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  FitnessProfileTableData copyWith({
    String? id,
    String? userId,
    int? age,
    double? height,
    double? weight,
    BodySomatotype? bodySomatotype,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => FitnessProfileTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    age: age ?? this.age,
    height: height ?? this.height,
    weight: weight ?? this.weight,
    bodySomatotype: bodySomatotype ?? this.bodySomatotype,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  FitnessProfileTableData copyWithCompanion(FitnessProfileTableCompanion data) {
    return FitnessProfileTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      age: data.age.present ? data.age.value : this.age,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      bodySomatotype: data.bodySomatotype.present
          ? data.bodySomatotype.value
          : this.bodySomatotype,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FitnessProfileTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('bodySomatotype: $bodySomatotype, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    age,
    height,
    weight,
    bodySomatotype,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FitnessProfileTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.age == this.age &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.bodySomatotype == this.bodySomatotype &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FitnessProfileTableCompanion
    extends UpdateCompanion<FitnessProfileTableData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<int> age;
  final Value<double> height;
  final Value<double> weight;
  final Value<BodySomatotype> bodySomatotype;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const FitnessProfileTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.age = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.bodySomatotype = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FitnessProfileTableCompanion.insert({
    required String id,
    required String userId,
    required int age,
    required double height,
    required double weight,
    required BodySomatotype bodySomatotype,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       age = Value(age),
       height = Value(height),
       weight = Value(weight),
       bodySomatotype = Value(bodySomatotype);
  static Insertable<FitnessProfileTableData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<int>? age,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<String>? bodySomatotype,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (age != null) 'age': age,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (bodySomatotype != null) 'body_somatotype': bodySomatotype,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FitnessProfileTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<int>? age,
    Value<double>? height,
    Value<double>? weight,
    Value<BodySomatotype>? bodySomatotype,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return FitnessProfileTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bodySomatotype: bodySomatotype ?? this.bodySomatotype,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (bodySomatotype.present) {
      map['body_somatotype'] = Variable<String>(
        $FitnessProfileTableTable.$converterbodySomatotype.toSql(
          bodySomatotype.value,
        ),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FitnessProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('bodySomatotype: $bodySomatotype, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingProgramTableTable extends TrainingProgramTable
    with TableInfo<$TrainingProgramTableTable, TrainingProgramTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingProgramTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fitnessProfileIdMeta = const VerificationMeta(
    'fitnessProfileId',
  );
  @override
  late final GeneratedColumn<String> fitnessProfileId = GeneratedColumn<String>(
    'fitness_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES fitness_profile_table (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _programDurationMeta = const VerificationMeta(
    'programDuration',
  );
  @override
  late final GeneratedColumn<int> programDuration = GeneratedColumn<int>(
    'program_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fitnessProfileId,
    name,
    description,
    programDuration,
    startDate,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_program_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingProgramTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fitness_profile_id')) {
      context.handle(
        _fitnessProfileIdMeta,
        fitnessProfileId.isAcceptableOrUnknown(
          data['fitness_profile_id']!,
          _fitnessProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fitnessProfileIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('program_duration')) {
      context.handle(
        _programDurationMeta,
        programDuration.isAcceptableOrUnknown(
          data['program_duration']!,
          _programDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_programDurationMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingProgramTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingProgramTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fitnessProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fitness_profile_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      programDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}program_duration'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $TrainingProgramTableTable createAlias(String alias) {
    return $TrainingProgramTableTable(attachedDatabase, alias);
  }
}

class TrainingProgramTableData extends DataClass
    implements Insertable<TrainingProgramTableData> {
  final String id;
  final String fitnessProfileId;
  final String name;
  final String? description;
  final int programDuration;
  final DateTime? startDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const TrainingProgramTableData({
    required this.id,
    required this.fitnessProfileId,
    required this.name,
    this.description,
    required this.programDuration,
    this.startDate,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['fitness_profile_id'] = Variable<String>(fitnessProfileId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['program_duration'] = Variable<int>(programDuration);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TrainingProgramTableCompanion toCompanion(bool nullToAbsent) {
    return TrainingProgramTableCompanion(
      id: Value(id),
      fitnessProfileId: Value(fitnessProfileId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      programDuration: Value(programDuration),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TrainingProgramTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingProgramTableData(
      id: serializer.fromJson<String>(json['id']),
      fitnessProfileId: serializer.fromJson<String>(json['fitnessProfileId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      programDuration: serializer.fromJson<int>(json['programDuration']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fitnessProfileId': serializer.toJson<String>(fitnessProfileId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'programDuration': serializer.toJson<int>(programDuration),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  TrainingProgramTableData copyWith({
    String? id,
    String? fitnessProfileId,
    String? name,
    Value<String?> description = const Value.absent(),
    int? programDuration,
    Value<DateTime?> startDate = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => TrainingProgramTableData(
    id: id ?? this.id,
    fitnessProfileId: fitnessProfileId ?? this.fitnessProfileId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    programDuration: programDuration ?? this.programDuration,
    startDate: startDate.present ? startDate.value : this.startDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  TrainingProgramTableData copyWithCompanion(
    TrainingProgramTableCompanion data,
  ) {
    return TrainingProgramTableData(
      id: data.id.present ? data.id.value : this.id,
      fitnessProfileId: data.fitnessProfileId.present
          ? data.fitnessProfileId.value
          : this.fitnessProfileId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      programDuration: data.programDuration.present
          ? data.programDuration.value
          : this.programDuration,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingProgramTableData(')
          ..write('id: $id, ')
          ..write('fitnessProfileId: $fitnessProfileId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('programDuration: $programDuration, ')
          ..write('startDate: $startDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fitnessProfileId,
    name,
    description,
    programDuration,
    startDate,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingProgramTableData &&
          other.id == this.id &&
          other.fitnessProfileId == this.fitnessProfileId &&
          other.name == this.name &&
          other.description == this.description &&
          other.programDuration == this.programDuration &&
          other.startDate == this.startDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TrainingProgramTableCompanion
    extends UpdateCompanion<TrainingProgramTableData> {
  final Value<String> id;
  final Value<String> fitnessProfileId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> programDuration;
  final Value<DateTime?> startDate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const TrainingProgramTableCompanion({
    this.id = const Value.absent(),
    this.fitnessProfileId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.programDuration = const Value.absent(),
    this.startDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingProgramTableCompanion.insert({
    required String id,
    required String fitnessProfileId,
    required String name,
    this.description = const Value.absent(),
    required int programDuration,
    this.startDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fitnessProfileId = Value(fitnessProfileId),
       name = Value(name),
       programDuration = Value(programDuration);
  static Insertable<TrainingProgramTableData> custom({
    Expression<String>? id,
    Expression<String>? fitnessProfileId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? programDuration,
    Expression<DateTime>? startDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fitnessProfileId != null) 'fitness_profile_id': fitnessProfileId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (programDuration != null) 'program_duration': programDuration,
      if (startDate != null) 'start_date': startDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingProgramTableCompanion copyWith({
    Value<String>? id,
    Value<String>? fitnessProfileId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? programDuration,
    Value<DateTime?>? startDate,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return TrainingProgramTableCompanion(
      id: id ?? this.id,
      fitnessProfileId: fitnessProfileId ?? this.fitnessProfileId,
      name: name ?? this.name,
      description: description ?? this.description,
      programDuration: programDuration ?? this.programDuration,
      startDate: startDate ?? this.startDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fitnessProfileId.present) {
      map['fitness_profile_id'] = Variable<String>(fitnessProfileId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (programDuration.present) {
      map['program_duration'] = Variable<int>(programDuration.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingProgramTableCompanion(')
          ..write('id: $id, ')
          ..write('fitnessProfileId: $fitnessProfileId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('programDuration: $programDuration, ')
          ..write('startDate: $startDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeekScheduleTableTable extends WeekScheduleTable
    with TableInfo<$WeekScheduleTableTable, WeekScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeekScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trainingProgramIdMeta = const VerificationMeta(
    'trainingProgramId',
  );
  @override
  late final GeneratedColumn<String> trainingProgramId =
      GeneratedColumn<String>(
        'training_program_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES training_program_table (id)',
        ),
      );
  static const VerificationMeta _weekNumberMeta = const VerificationMeta(
    'weekNumber',
  );
  @override
  late final GeneratedColumn<int> weekNumber = GeneratedColumn<int>(
    'week_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repetitionDurationMeta =
      const VerificationMeta('repetitionDuration');
  @override
  late final GeneratedColumn<int> repetitionDuration = GeneratedColumn<int>(
    'repetition_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trainingProgramId,
    weekNumber,
    repetitionDuration,
    startDate,
    endDate,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'week_schedule_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeekScheduleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('training_program_id')) {
      context.handle(
        _trainingProgramIdMeta,
        trainingProgramId.isAcceptableOrUnknown(
          data['training_program_id']!,
          _trainingProgramIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trainingProgramIdMeta);
    }
    if (data.containsKey('week_number')) {
      context.handle(
        _weekNumberMeta,
        weekNumber.isAcceptableOrUnknown(data['week_number']!, _weekNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_weekNumberMeta);
    }
    if (data.containsKey('repetition_duration')) {
      context.handle(
        _repetitionDurationMeta,
        repetitionDuration.isAcceptableOrUnknown(
          data['repetition_duration']!,
          _repetitionDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_repetitionDurationMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeekScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeekScheduleTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      trainingProgramId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}training_program_id'],
      )!,
      weekNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}week_number'],
      )!,
      repetitionDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetition_duration'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $WeekScheduleTableTable createAlias(String alias) {
    return $WeekScheduleTableTable(attachedDatabase, alias);
  }
}

class WeekScheduleTableData extends DataClass
    implements Insertable<WeekScheduleTableData> {
  final String id;
  final String trainingProgramId;
  final int weekNumber;
  final int repetitionDuration;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const WeekScheduleTableData({
    required this.id,
    required this.trainingProgramId,
    required this.weekNumber,
    required this.repetitionDuration,
    this.startDate,
    this.endDate,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['training_program_id'] = Variable<String>(trainingProgramId);
    map['week_number'] = Variable<int>(weekNumber);
    map['repetition_duration'] = Variable<int>(repetitionDuration);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  WeekScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return WeekScheduleTableCompanion(
      id: Value(id),
      trainingProgramId: Value(trainingProgramId),
      weekNumber: Value(weekNumber),
      repetitionDuration: Value(repetitionDuration),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory WeekScheduleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeekScheduleTableData(
      id: serializer.fromJson<String>(json['id']),
      trainingProgramId: serializer.fromJson<String>(json['trainingProgramId']),
      weekNumber: serializer.fromJson<int>(json['weekNumber']),
      repetitionDuration: serializer.fromJson<int>(json['repetitionDuration']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'trainingProgramId': serializer.toJson<String>(trainingProgramId),
      'weekNumber': serializer.toJson<int>(weekNumber),
      'repetitionDuration': serializer.toJson<int>(repetitionDuration),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  WeekScheduleTableData copyWith({
    String? id,
    String? trainingProgramId,
    int? weekNumber,
    int? repetitionDuration,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => WeekScheduleTableData(
    id: id ?? this.id,
    trainingProgramId: trainingProgramId ?? this.trainingProgramId,
    weekNumber: weekNumber ?? this.weekNumber,
    repetitionDuration: repetitionDuration ?? this.repetitionDuration,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  WeekScheduleTableData copyWithCompanion(WeekScheduleTableCompanion data) {
    return WeekScheduleTableData(
      id: data.id.present ? data.id.value : this.id,
      trainingProgramId: data.trainingProgramId.present
          ? data.trainingProgramId.value
          : this.trainingProgramId,
      weekNumber: data.weekNumber.present
          ? data.weekNumber.value
          : this.weekNumber,
      repetitionDuration: data.repetitionDuration.present
          ? data.repetitionDuration.value
          : this.repetitionDuration,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeekScheduleTableData(')
          ..write('id: $id, ')
          ..write('trainingProgramId: $trainingProgramId, ')
          ..write('weekNumber: $weekNumber, ')
          ..write('repetitionDuration: $repetitionDuration, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    trainingProgramId,
    weekNumber,
    repetitionDuration,
    startDate,
    endDate,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeekScheduleTableData &&
          other.id == this.id &&
          other.trainingProgramId == this.trainingProgramId &&
          other.weekNumber == this.weekNumber &&
          other.repetitionDuration == this.repetitionDuration &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WeekScheduleTableCompanion
    extends UpdateCompanion<WeekScheduleTableData> {
  final Value<String> id;
  final Value<String> trainingProgramId;
  final Value<int> weekNumber;
  final Value<int> repetitionDuration;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const WeekScheduleTableCompanion({
    this.id = const Value.absent(),
    this.trainingProgramId = const Value.absent(),
    this.weekNumber = const Value.absent(),
    this.repetitionDuration = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeekScheduleTableCompanion.insert({
    required String id,
    required String trainingProgramId,
    required int weekNumber,
    required int repetitionDuration,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       trainingProgramId = Value(trainingProgramId),
       weekNumber = Value(weekNumber),
       repetitionDuration = Value(repetitionDuration);
  static Insertable<WeekScheduleTableData> custom({
    Expression<String>? id,
    Expression<String>? trainingProgramId,
    Expression<int>? weekNumber,
    Expression<int>? repetitionDuration,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainingProgramId != null) 'training_program_id': trainingProgramId,
      if (weekNumber != null) 'week_number': weekNumber,
      if (repetitionDuration != null) 'repetition_duration': repetitionDuration,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeekScheduleTableCompanion copyWith({
    Value<String>? id,
    Value<String>? trainingProgramId,
    Value<int>? weekNumber,
    Value<int>? repetitionDuration,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return WeekScheduleTableCompanion(
      id: id ?? this.id,
      trainingProgramId: trainingProgramId ?? this.trainingProgramId,
      weekNumber: weekNumber ?? this.weekNumber,
      repetitionDuration: repetitionDuration ?? this.repetitionDuration,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (trainingProgramId.present) {
      map['training_program_id'] = Variable<String>(trainingProgramId.value);
    }
    if (weekNumber.present) {
      map['week_number'] = Variable<int>(weekNumber.value);
    }
    if (repetitionDuration.present) {
      map['repetition_duration'] = Variable<int>(repetitionDuration.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeekScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('trainingProgramId: $trainingProgramId, ')
          ..write('weekNumber: $weekNumber, ')
          ..write('repetitionDuration: $repetitionDuration, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayScheduleTableTable extends DayScheduleTable
    with TableInfo<$DayScheduleTableTable, DayScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekScheduleIdMeta = const VerificationMeta(
    'weekScheduleId',
  );
  @override
  late final GeneratedColumn<String> weekScheduleId = GeneratedColumn<String>(
    'week_schedule_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES week_schedule_table (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DayOfWeek, String> dayOfWeek =
      GeneratedColumn<String>(
        'day_of_week',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DayOfWeek>($DayScheduleTableTable.$converterdayOfWeek);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weekScheduleId,
    dayOfWeek,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_schedule_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayScheduleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('week_schedule_id')) {
      context.handle(
        _weekScheduleIdMeta,
        weekScheduleId.isAcceptableOrUnknown(
          data['week_schedule_id']!,
          _weekScheduleIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weekScheduleIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayScheduleTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weekScheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}week_schedule_id'],
      )!,
      dayOfWeek: $DayScheduleTableTable.$converterdayOfWeek.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}day_of_week'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $DayScheduleTableTable createAlias(String alias) {
    return $DayScheduleTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DayOfWeek, String, String> $converterdayOfWeek =
      const EnumNameConverter<DayOfWeek>(DayOfWeek.values);
}

class DayScheduleTableData extends DataClass
    implements Insertable<DayScheduleTableData> {
  final String id;
  final String weekScheduleId;
  final DayOfWeek dayOfWeek;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DayScheduleTableData({
    required this.id,
    required this.weekScheduleId,
    required this.dayOfWeek,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['week_schedule_id'] = Variable<String>(weekScheduleId);
    {
      map['day_of_week'] = Variable<String>(
        $DayScheduleTableTable.$converterdayOfWeek.toSql(dayOfWeek),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DayScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return DayScheduleTableCompanion(
      id: Value(id),
      weekScheduleId: Value(weekScheduleId),
      dayOfWeek: Value(dayOfWeek),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DayScheduleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayScheduleTableData(
      id: serializer.fromJson<String>(json['id']),
      weekScheduleId: serializer.fromJson<String>(json['weekScheduleId']),
      dayOfWeek: $DayScheduleTableTable.$converterdayOfWeek.fromJson(
        serializer.fromJson<String>(json['dayOfWeek']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weekScheduleId': serializer.toJson<String>(weekScheduleId),
      'dayOfWeek': serializer.toJson<String>(
        $DayScheduleTableTable.$converterdayOfWeek.toJson(dayOfWeek),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DayScheduleTableData copyWith({
    String? id,
    String? weekScheduleId,
    DayOfWeek? dayOfWeek,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => DayScheduleTableData(
    id: id ?? this.id,
    weekScheduleId: weekScheduleId ?? this.weekScheduleId,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DayScheduleTableData copyWithCompanion(DayScheduleTableCompanion data) {
    return DayScheduleTableData(
      id: data.id.present ? data.id.value : this.id,
      weekScheduleId: data.weekScheduleId.present
          ? data.weekScheduleId.value
          : this.weekScheduleId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayScheduleTableData(')
          ..write('id: $id, ')
          ..write('weekScheduleId: $weekScheduleId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, weekScheduleId, dayOfWeek, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayScheduleTableData &&
          other.id == this.id &&
          other.weekScheduleId == this.weekScheduleId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DayScheduleTableCompanion extends UpdateCompanion<DayScheduleTableData> {
  final Value<String> id;
  final Value<String> weekScheduleId;
  final Value<DayOfWeek> dayOfWeek;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const DayScheduleTableCompanion({
    this.id = const Value.absent(),
    this.weekScheduleId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayScheduleTableCompanion.insert({
    required String id,
    required String weekScheduleId,
    required DayOfWeek dayOfWeek,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weekScheduleId = Value(weekScheduleId),
       dayOfWeek = Value(dayOfWeek);
  static Insertable<DayScheduleTableData> custom({
    Expression<String>? id,
    Expression<String>? weekScheduleId,
    Expression<String>? dayOfWeek,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekScheduleId != null) 'week_schedule_id': weekScheduleId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayScheduleTableCompanion copyWith({
    Value<String>? id,
    Value<String>? weekScheduleId,
    Value<DayOfWeek>? dayOfWeek,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return DayScheduleTableCompanion(
      id: id ?? this.id,
      weekScheduleId: weekScheduleId ?? this.weekScheduleId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weekScheduleId.present) {
      map['week_schedule_id'] = Variable<String>(weekScheduleId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<String>(
        $DayScheduleTableTable.$converterdayOfWeek.toSql(dayOfWeek.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('weekScheduleId: $weekScheduleId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTableTable extends WorkoutTable
    with TableInfo<$WorkoutTableTable, WorkoutTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _workoutNameMeta = const VerificationMeta(
    'workoutName',
  );
  @override
  late final GeneratedColumn<String> workoutName = GeneratedColumn<String>(
    'workout_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
    'sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WorkoutEquipment?, String>
  equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<WorkoutEquipment?>($WorkoutTableTable.$converterequipmentn);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutName,
    description,
    sets,
    reps,
    weight,
    equipment,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_name')) {
      context.handle(
        _workoutNameMeta,
        workoutName.isAcceptableOrUnknown(
          data['workout_name']!,
          _workoutNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('sets')) {
      context.handle(
        _setsMeta,
        sets.isAcceptableOrUnknown(data['sets']!, _setsMeta),
      );
    } else if (isInserting) {
      context.missing(_setsMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workoutName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      equipment: $WorkoutTableTable.$converterequipmentn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}equipment'],
        ),
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $WorkoutTableTable createAlias(String alias) {
    return $WorkoutTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WorkoutEquipment, String, String>
  $converterequipment = const EnumNameConverter<WorkoutEquipment>(
    WorkoutEquipment.values,
  );
  static JsonTypeConverter2<WorkoutEquipment?, String?, String?>
  $converterequipmentn = JsonTypeConverter2.asNullable($converterequipment);
}

class WorkoutTableData extends DataClass
    implements Insertable<WorkoutTableData> {
  final int id;
  final String workoutName;
  final String? description;
  final int sets;
  final int reps;
  final double weight;
  final WorkoutEquipment? equipment;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const WorkoutTableData({
    required this.id,
    required this.workoutName,
    this.description,
    required this.sets,
    required this.reps,
    required this.weight,
    this.equipment,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['workout_name'] = Variable<String>(workoutName);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['sets'] = Variable<int>(sets);
    map['reps'] = Variable<int>(reps);
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || equipment != null) {
      map['equipment'] = Variable<String>(
        $WorkoutTableTable.$converterequipmentn.toSql(equipment),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  WorkoutTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTableCompanion(
      id: Value(id),
      workoutName: Value(workoutName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sets: Value(sets),
      reps: Value(reps),
      weight: Value(weight),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory WorkoutTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTableData(
      id: serializer.fromJson<int>(json['id']),
      workoutName: serializer.fromJson<String>(json['workoutName']),
      description: serializer.fromJson<String?>(json['description']),
      sets: serializer.fromJson<int>(json['sets']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<double>(json['weight']),
      equipment: $WorkoutTableTable.$converterequipmentn.fromJson(
        serializer.fromJson<String?>(json['equipment']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutName': serializer.toJson<String>(workoutName),
      'description': serializer.toJson<String?>(description),
      'sets': serializer.toJson<int>(sets),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<double>(weight),
      'equipment': serializer.toJson<String?>(
        $WorkoutTableTable.$converterequipmentn.toJson(equipment),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  WorkoutTableData copyWith({
    int? id,
    String? workoutName,
    Value<String?> description = const Value.absent(),
    int? sets,
    int? reps,
    double? weight,
    Value<WorkoutEquipment?> equipment = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => WorkoutTableData(
    id: id ?? this.id,
    workoutName: workoutName ?? this.workoutName,
    description: description.present ? description.value : this.description,
    sets: sets ?? this.sets,
    reps: reps ?? this.reps,
    weight: weight ?? this.weight,
    equipment: equipment.present ? equipment.value : this.equipment,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  WorkoutTableData copyWithCompanion(WorkoutTableCompanion data) {
    return WorkoutTableData(
      id: data.id.present ? data.id.value : this.id,
      workoutName: data.workoutName.present
          ? data.workoutName.value
          : this.workoutName,
      description: data.description.present
          ? data.description.value
          : this.description,
      sets: data.sets.present ? data.sets.value : this.sets,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTableData(')
          ..write('id: $id, ')
          ..write('workoutName: $workoutName, ')
          ..write('description: $description, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('equipment: $equipment, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workoutName,
    description,
    sets,
    reps,
    weight,
    equipment,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTableData &&
          other.id == this.id &&
          other.workoutName == this.workoutName &&
          other.description == this.description &&
          other.sets == this.sets &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.equipment == this.equipment &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WorkoutTableCompanion extends UpdateCompanion<WorkoutTableData> {
  final Value<int> id;
  final Value<String> workoutName;
  final Value<String?> description;
  final Value<int> sets;
  final Value<int> reps;
  final Value<double> weight;
  final Value<WorkoutEquipment?> equipment;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const WorkoutTableCompanion({
    this.id = const Value.absent(),
    this.workoutName = const Value.absent(),
    this.description = const Value.absent(),
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.equipment = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WorkoutTableCompanion.insert({
    this.id = const Value.absent(),
    required String workoutName,
    this.description = const Value.absent(),
    required int sets,
    required int reps,
    required double weight,
    this.equipment = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : workoutName = Value(workoutName),
       sets = Value(sets),
       reps = Value(reps),
       weight = Value(weight);
  static Insertable<WorkoutTableData> custom({
    Expression<int>? id,
    Expression<String>? workoutName,
    Expression<String>? description,
    Expression<int>? sets,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<String>? equipment,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutName != null) 'workout_name': workoutName,
      if (description != null) 'description': description,
      if (sets != null) 'sets': sets,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (equipment != null) 'equipment': equipment,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WorkoutTableCompanion copyWith({
    Value<int>? id,
    Value<String>? workoutName,
    Value<String?>? description,
    Value<int>? sets,
    Value<int>? reps,
    Value<double>? weight,
    Value<WorkoutEquipment?>? equipment,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return WorkoutTableCompanion(
      id: id ?? this.id,
      workoutName: workoutName ?? this.workoutName,
      description: description ?? this.description,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      equipment: equipment ?? this.equipment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutName.present) {
      map['workout_name'] = Variable<String>(workoutName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(
        $WorkoutTableTable.$converterequipmentn.toSql(equipment.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTableCompanion(')
          ..write('id: $id, ')
          ..write('workoutName: $workoutName, ')
          ..write('description: $description, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('equipment: $equipment, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WorkoutInstanceTableTable extends WorkoutInstanceTable
    with TableInfo<$WorkoutInstanceTableTable, WorkoutInstanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutInstanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayScheduleIdMeta = const VerificationMeta(
    'dayScheduleId',
  );
  @override
  late final GeneratedColumn<String> dayScheduleId = GeneratedColumn<String>(
    'day_schedule_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_schedule_table (id)',
    ),
  );
  static const VerificationMeta _workoutIdMeta = const VerificationMeta(
    'workoutId',
  );
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
    'workout_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_table (id)',
    ),
  );
  static const VerificationMeta _scheduledRepsMeta = const VerificationMeta(
    'scheduledReps',
  );
  @override
  late final GeneratedColumn<int> scheduledReps = GeneratedColumn<int>(
    'scheduled_reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledWeightMeta = const VerificationMeta(
    'scheduledWeight',
  );
  @override
  late final GeneratedColumn<double> scheduledWeight = GeneratedColumn<double>(
    'scheduled_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedRepsMeta = const VerificationMeta(
    'completedReps',
  );
  @override
  late final GeneratedColumn<int> completedReps = GeneratedColumn<int>(
    'completed_reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedWeightMeta = const VerificationMeta(
    'completedWeight',
  );
  @override
  late final GeneratedColumn<double> completedWeight = GeneratedColumn<double>(
    'completed_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDate,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dayScheduleId,
    workoutId,
    scheduledReps,
    scheduledWeight,
    completedReps,
    completedWeight,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_instance_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutInstanceTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('day_schedule_id')) {
      context.handle(
        _dayScheduleIdMeta,
        dayScheduleId.isAcceptableOrUnknown(
          data['day_schedule_id']!,
          _dayScheduleIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dayScheduleIdMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(
        _workoutIdMeta,
        workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('scheduled_reps')) {
      context.handle(
        _scheduledRepsMeta,
        scheduledReps.isAcceptableOrUnknown(
          data['scheduled_reps']!,
          _scheduledRepsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledRepsMeta);
    }
    if (data.containsKey('scheduled_weight')) {
      context.handle(
        _scheduledWeightMeta,
        scheduledWeight.isAcceptableOrUnknown(
          data['scheduled_weight']!,
          _scheduledWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledWeightMeta);
    }
    if (data.containsKey('completed_reps')) {
      context.handle(
        _completedRepsMeta,
        completedReps.isAcceptableOrUnknown(
          data['completed_reps']!,
          _completedRepsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedRepsMeta);
    }
    if (data.containsKey('completed_weight')) {
      context.handle(
        _completedWeightMeta,
        completedWeight.isAcceptableOrUnknown(
          data['completed_weight']!,
          _completedWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedWeightMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutInstanceTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutInstanceTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dayScheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_schedule_id'],
      )!,
      workoutId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_id'],
      )!,
      scheduledReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}scheduled_reps'],
      )!,
      scheduledWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}scheduled_weight'],
      )!,
      completedReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_reps'],
      )!,
      completedWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}completed_weight'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $WorkoutInstanceTableTable createAlias(String alias) {
    return $WorkoutInstanceTableTable(attachedDatabase, alias);
  }
}

class WorkoutInstanceTableData extends DataClass
    implements Insertable<WorkoutInstanceTableData> {
  final String id;
  final String dayScheduleId;
  final int workoutId;
  final int scheduledReps;
  final double scheduledWeight;
  final int completedReps;
  final double completedWeight;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const WorkoutInstanceTableData({
    required this.id,
    required this.dayScheduleId,
    required this.workoutId,
    required this.scheduledReps,
    required this.scheduledWeight,
    required this.completedReps,
    required this.completedWeight,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['day_schedule_id'] = Variable<String>(dayScheduleId);
    map['workout_id'] = Variable<int>(workoutId);
    map['scheduled_reps'] = Variable<int>(scheduledReps);
    map['scheduled_weight'] = Variable<double>(scheduledWeight);
    map['completed_reps'] = Variable<int>(completedReps);
    map['completed_weight'] = Variable<double>(completedWeight);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  WorkoutInstanceTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutInstanceTableCompanion(
      id: Value(id),
      dayScheduleId: Value(dayScheduleId),
      workoutId: Value(workoutId),
      scheduledReps: Value(scheduledReps),
      scheduledWeight: Value(scheduledWeight),
      completedReps: Value(completedReps),
      completedWeight: Value(completedWeight),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory WorkoutInstanceTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutInstanceTableData(
      id: serializer.fromJson<String>(json['id']),
      dayScheduleId: serializer.fromJson<String>(json['dayScheduleId']),
      workoutId: serializer.fromJson<int>(json['workoutId']),
      scheduledReps: serializer.fromJson<int>(json['scheduledReps']),
      scheduledWeight: serializer.fromJson<double>(json['scheduledWeight']),
      completedReps: serializer.fromJson<int>(json['completedReps']),
      completedWeight: serializer.fromJson<double>(json['completedWeight']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dayScheduleId': serializer.toJson<String>(dayScheduleId),
      'workoutId': serializer.toJson<int>(workoutId),
      'scheduledReps': serializer.toJson<int>(scheduledReps),
      'scheduledWeight': serializer.toJson<double>(scheduledWeight),
      'completedReps': serializer.toJson<int>(completedReps),
      'completedWeight': serializer.toJson<double>(completedWeight),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  WorkoutInstanceTableData copyWith({
    String? id,
    String? dayScheduleId,
    int? workoutId,
    int? scheduledReps,
    double? scheduledWeight,
    int? completedReps,
    double? completedWeight,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => WorkoutInstanceTableData(
    id: id ?? this.id,
    dayScheduleId: dayScheduleId ?? this.dayScheduleId,
    workoutId: workoutId ?? this.workoutId,
    scheduledReps: scheduledReps ?? this.scheduledReps,
    scheduledWeight: scheduledWeight ?? this.scheduledWeight,
    completedReps: completedReps ?? this.completedReps,
    completedWeight: completedWeight ?? this.completedWeight,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  WorkoutInstanceTableData copyWithCompanion(
    WorkoutInstanceTableCompanion data,
  ) {
    return WorkoutInstanceTableData(
      id: data.id.present ? data.id.value : this.id,
      dayScheduleId: data.dayScheduleId.present
          ? data.dayScheduleId.value
          : this.dayScheduleId,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      scheduledReps: data.scheduledReps.present
          ? data.scheduledReps.value
          : this.scheduledReps,
      scheduledWeight: data.scheduledWeight.present
          ? data.scheduledWeight.value
          : this.scheduledWeight,
      completedReps: data.completedReps.present
          ? data.completedReps.value
          : this.completedReps,
      completedWeight: data.completedWeight.present
          ? data.completedWeight.value
          : this.completedWeight,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutInstanceTableData(')
          ..write('id: $id, ')
          ..write('dayScheduleId: $dayScheduleId, ')
          ..write('workoutId: $workoutId, ')
          ..write('scheduledReps: $scheduledReps, ')
          ..write('scheduledWeight: $scheduledWeight, ')
          ..write('completedReps: $completedReps, ')
          ..write('completedWeight: $completedWeight, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dayScheduleId,
    workoutId,
    scheduledReps,
    scheduledWeight,
    completedReps,
    completedWeight,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutInstanceTableData &&
          other.id == this.id &&
          other.dayScheduleId == this.dayScheduleId &&
          other.workoutId == this.workoutId &&
          other.scheduledReps == this.scheduledReps &&
          other.scheduledWeight == this.scheduledWeight &&
          other.completedReps == this.completedReps &&
          other.completedWeight == this.completedWeight &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WorkoutInstanceTableCompanion
    extends UpdateCompanion<WorkoutInstanceTableData> {
  final Value<String> id;
  final Value<String> dayScheduleId;
  final Value<int> workoutId;
  final Value<int> scheduledReps;
  final Value<double> scheduledWeight;
  final Value<int> completedReps;
  final Value<double> completedWeight;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const WorkoutInstanceTableCompanion({
    this.id = const Value.absent(),
    this.dayScheduleId = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.scheduledReps = const Value.absent(),
    this.scheduledWeight = const Value.absent(),
    this.completedReps = const Value.absent(),
    this.completedWeight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutInstanceTableCompanion.insert({
    required String id,
    required String dayScheduleId,
    required int workoutId,
    required int scheduledReps,
    required double scheduledWeight,
    required int completedReps,
    required double completedWeight,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dayScheduleId = Value(dayScheduleId),
       workoutId = Value(workoutId),
       scheduledReps = Value(scheduledReps),
       scheduledWeight = Value(scheduledWeight),
       completedReps = Value(completedReps),
       completedWeight = Value(completedWeight);
  static Insertable<WorkoutInstanceTableData> custom({
    Expression<String>? id,
    Expression<String>? dayScheduleId,
    Expression<int>? workoutId,
    Expression<int>? scheduledReps,
    Expression<double>? scheduledWeight,
    Expression<int>? completedReps,
    Expression<double>? completedWeight,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dayScheduleId != null) 'day_schedule_id': dayScheduleId,
      if (workoutId != null) 'workout_id': workoutId,
      if (scheduledReps != null) 'scheduled_reps': scheduledReps,
      if (scheduledWeight != null) 'scheduled_weight': scheduledWeight,
      if (completedReps != null) 'completed_reps': completedReps,
      if (completedWeight != null) 'completed_weight': completedWeight,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutInstanceTableCompanion copyWith({
    Value<String>? id,
    Value<String>? dayScheduleId,
    Value<int>? workoutId,
    Value<int>? scheduledReps,
    Value<double>? scheduledWeight,
    Value<int>? completedReps,
    Value<double>? completedWeight,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return WorkoutInstanceTableCompanion(
      id: id ?? this.id,
      dayScheduleId: dayScheduleId ?? this.dayScheduleId,
      workoutId: workoutId ?? this.workoutId,
      scheduledReps: scheduledReps ?? this.scheduledReps,
      scheduledWeight: scheduledWeight ?? this.scheduledWeight,
      completedReps: completedReps ?? this.completedReps,
      completedWeight: completedWeight ?? this.completedWeight,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dayScheduleId.present) {
      map['day_schedule_id'] = Variable<String>(dayScheduleId.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (scheduledReps.present) {
      map['scheduled_reps'] = Variable<int>(scheduledReps.value);
    }
    if (scheduledWeight.present) {
      map['scheduled_weight'] = Variable<double>(scheduledWeight.value);
    }
    if (completedReps.present) {
      map['completed_reps'] = Variable<int>(completedReps.value);
    }
    if (completedWeight.present) {
      map['completed_weight'] = Variable<double>(completedWeight.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutInstanceTableCompanion(')
          ..write('id: $id, ')
          ..write('dayScheduleId: $dayScheduleId, ')
          ..write('workoutId: $workoutId, ')
          ..write('scheduledReps: $scheduledReps, ')
          ..write('scheduledWeight: $scheduledWeight, ')
          ..write('completedReps: $completedReps, ')
          ..write('completedWeight: $completedWeight, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$EkafitzDatabase extends GeneratedDatabase {
  _$EkafitzDatabase(QueryExecutor e) : super(e);
  $EkafitzDatabaseManager get managers => $EkafitzDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $FitnessProfileTableTable fitnessProfileTable =
      $FitnessProfileTableTable(this);
  late final $TrainingProgramTableTable trainingProgramTable =
      $TrainingProgramTableTable(this);
  late final $WeekScheduleTableTable weekScheduleTable =
      $WeekScheduleTableTable(this);
  late final $DayScheduleTableTable dayScheduleTable = $DayScheduleTableTable(
    this,
  );
  late final $WorkoutTableTable workoutTable = $WorkoutTableTable(this);
  late final $WorkoutInstanceTableTable workoutInstanceTable =
      $WorkoutInstanceTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userTable,
    fitnessProfileTable,
    trainingProgramTable,
    weekScheduleTable,
    dayScheduleTable,
    workoutTable,
    workoutInstanceTable,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  required String id,
  required String fullName,
  required String email,
  Value<DateTime?> birthDate,
  required Gender gender,
  required String passwordHash,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<String> id,
  Value<String> fullName,
  Value<String> email,
  Value<DateTime?> birthDate,
  Value<Gender> gender,
  Value<String> passwordHash,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$UserTableTableReferences
    extends BaseReferences<_$EkafitzDatabase, $UserTableTable, UserTableData> {
  $$UserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $FitnessProfileTableTable,
    List<FitnessProfileTableData>
  >
  _fitnessProfileTableRefsTable(_$EkafitzDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.fitnessProfileTable,
        aliasName: 'user_table__id__fitness_profile_table__user_id',
      );

  $$FitnessProfileTableTableProcessedTableManager get fitnessProfileTableRefs {
    final manager = $$FitnessProfileTableTableTableManager(
      $_db,
      $_db.fitnessProfileTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _fitnessProfileTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Gender, Gender, String> get gender =>
      $composableBuilder(
        column: $table.gender,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> fitnessProfileTableRefs(
    Expression<bool> Function($$FitnessProfileTableTableFilterComposer f) f,
  ) {
    final $$FitnessProfileTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fitnessProfileTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FitnessProfileTableTableFilterComposer(
            $db: $db,
            $table: $db.fitnessProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> fitnessProfileTableRefs<T extends Object>(
    Expression<T> Function($$FitnessProfileTableTableAnnotationComposer a) f,
  ) {
    final $$FitnessProfileTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.fitnessProfileTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FitnessProfileTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fitnessProfileTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UserTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $UserTableTable,
          UserTableData,
          $$UserTableTableFilterComposer,
          $$UserTableTableOrderingComposer,
          $$UserTableTableAnnotationComposer,
          $$UserTableTableCreateCompanionBuilder,
          $$UserTableTableUpdateCompanionBuilder,
          (UserTableData, $$UserTableTableReferences),
          UserTableData,
          PrefetchHooks Function({bool fitnessProfileTableRefs})
        > {
  $$UserTableTableTableManager(_$EkafitzDatabase db, $UserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<Gender> gender = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserTableCompanion(
                id: id,
                fullName: fullName,
                email: email,
                birthDate: birthDate,
                gender: gender,
                passwordHash: passwordHash,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fullName,
                required String email,
                Value<DateTime?> birthDate = const Value.absent(),
                required Gender gender,
                required String passwordHash,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserTableCompanion.insert(
                id: id,
                fullName: fullName,
                email: email,
                birthDate: birthDate,
                gender: gender,
                passwordHash: passwordHash,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserTableTable, UserTableData>(table),
                  $$UserTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({fitnessProfileTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (fitnessProfileTableRefs) db.fitnessProfileTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (fitnessProfileTableRefs)
                    await $_getPrefetchedData<
                      UserTableData,
                      $UserTableTable,
                      FitnessProfileTableData
                    >(
                      currentTable: table,
                      referencedTable: $$UserTableTableReferences
                          ._fitnessProfileTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserTableTableReferences(
                            db,
                            table,
                            p0,
                          ).fitnessProfileTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $UserTableTable,
      UserTableData,
      $$UserTableTableFilterComposer,
      $$UserTableTableOrderingComposer,
      $$UserTableTableAnnotationComposer,
      $$UserTableTableCreateCompanionBuilder,
      $$UserTableTableUpdateCompanionBuilder,
      (UserTableData, $$UserTableTableReferences),
      UserTableData,
      PrefetchHooks Function({bool fitnessProfileTableRefs})
    >;
typedef $$FitnessProfileTableTableCreateCompanionBuilder =
    FitnessProfileTableCompanion Function({
      required String id,
      required String userId,
      required int age,
      required double height,
      required double weight,
      required BodySomatotype bodySomatotype,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$FitnessProfileTableTableUpdateCompanionBuilder =
    FitnessProfileTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<int> age,
      Value<double> height,
      Value<double> weight,
      Value<BodySomatotype> bodySomatotype,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$FitnessProfileTableTableReferences
    extends
        BaseReferences<
          _$EkafitzDatabase,
          $FitnessProfileTableTable,
          FitnessProfileTableData
        > {
  $$FitnessProfileTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserTableTable _userIdTable(_$EkafitzDatabase db) => db.userTable
      .createAlias('fitness_profile_table__user_id__user_table__id');

  $$UserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserTableTableTableManager(
      $_db,
      $_db.userTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $TrainingProgramTableTable,
    List<TrainingProgramTableData>
  >
  _trainingProgramTableRefsTable(
    _$EkafitzDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.trainingProgramTable,
    aliasName:
        'fitness_profile_table__id__training_program_table__fitness_profile_id',
  );

  $$TrainingProgramTableTableProcessedTableManager
  get trainingProgramTableRefs {
    final manager =
        $$TrainingProgramTableTableTableManager(
          $_db,
          $_db.trainingProgramTable,
        ).filter(
          (f) => f.fitnessProfileId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _trainingProgramTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FitnessProfileTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $FitnessProfileTableTable> {
  $$FitnessProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<BodySomatotype, BodySomatotype, String>
  get bodySomatotype => $composableBuilder(
    column: $table.bodySomatotype,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableFilterComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> trainingProgramTableRefs(
    Expression<bool> Function($$TrainingProgramTableTableFilterComposer f) f,
  ) {
    final $$TrainingProgramTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trainingProgramTable,
      getReferencedColumn: (t) => t.fitnessProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingProgramTableTableFilterComposer(
            $db: $db,
            $table: $db.trainingProgramTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FitnessProfileTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $FitnessProfileTableTable> {
  $$FitnessProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodySomatotype => $composableBuilder(
    column: $table.bodySomatotype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableOrderingComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FitnessProfileTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $FitnessProfileTableTable> {
  $$FitnessProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BodySomatotype, String> get bodySomatotype =>
      $composableBuilder(
        column: $table.bodySomatotype,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> trainingProgramTableRefs<T extends Object>(
    Expression<T> Function($$TrainingProgramTableTableAnnotationComposer a) f,
  ) {
    final $$TrainingProgramTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.trainingProgramTable,
          getReferencedColumn: (t) => t.fitnessProfileId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrainingProgramTableTableAnnotationComposer(
                $db: $db,
                $table: $db.trainingProgramTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$FitnessProfileTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $FitnessProfileTableTable,
          FitnessProfileTableData,
          $$FitnessProfileTableTableFilterComposer,
          $$FitnessProfileTableTableOrderingComposer,
          $$FitnessProfileTableTableAnnotationComposer,
          $$FitnessProfileTableTableCreateCompanionBuilder,
          $$FitnessProfileTableTableUpdateCompanionBuilder,
          (FitnessProfileTableData, $$FitnessProfileTableTableReferences),
          FitnessProfileTableData,
          PrefetchHooks Function({bool userId, bool trainingProgramTableRefs})
        > {
  $$FitnessProfileTableTableTableManager(
    _$EkafitzDatabase db,
    $FitnessProfileTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FitnessProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FitnessProfileTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FitnessProfileTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<double> height = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<BodySomatotype> bodySomatotype = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FitnessProfileTableCompanion(
                id: id,
                userId: userId,
                age: age,
                height: height,
                weight: weight,
                bodySomatotype: bodySomatotype,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required int age,
                required double height,
                required double weight,
                required BodySomatotype bodySomatotype,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FitnessProfileTableCompanion.insert(
                id: id,
                userId: userId,
                age: age,
                height: height,
                weight: weight,
                bodySomatotype: bodySomatotype,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $FitnessProfileTableTable,
                    FitnessProfileTableData
                  >(table),
                  $$FitnessProfileTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userId = false, trainingProgramTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (trainingProgramTableRefs) db.trainingProgramTable,
                  ],
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
                        if (userId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.userId,
                            referencedTable:
                                $$FitnessProfileTableTableReferences
                                    ._userIdTable(db),
                            referencedColumn:
                                $$FitnessProfileTableTableReferences
                                    ._userIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (trainingProgramTableRefs)
                        await $_getPrefetchedData<
                          FitnessProfileTableData,
                          $FitnessProfileTableTable,
                          TrainingProgramTableData
                        >(
                          currentTable: table,
                          referencedTable: $$FitnessProfileTableTableReferences
                              ._trainingProgramTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FitnessProfileTableTableReferences(
                                db,
                                table,
                                p0,
                              ).trainingProgramTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.fitnessProfileId == item.id,
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

typedef $$FitnessProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $FitnessProfileTableTable,
      FitnessProfileTableData,
      $$FitnessProfileTableTableFilterComposer,
      $$FitnessProfileTableTableOrderingComposer,
      $$FitnessProfileTableTableAnnotationComposer,
      $$FitnessProfileTableTableCreateCompanionBuilder,
      $$FitnessProfileTableTableUpdateCompanionBuilder,
      (FitnessProfileTableData, $$FitnessProfileTableTableReferences),
      FitnessProfileTableData,
      PrefetchHooks Function({bool userId, bool trainingProgramTableRefs})
    >;
typedef $$TrainingProgramTableTableCreateCompanionBuilder =
    TrainingProgramTableCompanion Function({
      required String id,
      required String fitnessProfileId,
      required String name,
      Value<String?> description,
      required int programDuration,
      Value<DateTime?> startDate,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$TrainingProgramTableTableUpdateCompanionBuilder =
    TrainingProgramTableCompanion Function({
      Value<String> id,
      Value<String> fitnessProfileId,
      Value<String> name,
      Value<String?> description,
      Value<int> programDuration,
      Value<DateTime?> startDate,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$TrainingProgramTableTableReferences
    extends
        BaseReferences<
          _$EkafitzDatabase,
          $TrainingProgramTableTable,
          TrainingProgramTableData
        > {
  $$TrainingProgramTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FitnessProfileTableTable _fitnessProfileIdTable(
    _$EkafitzDatabase db,
  ) => db.fitnessProfileTable.createAlias(
    'training_program_table__fitness_profile_id__fitness_profile_table__id',
  );

  $$FitnessProfileTableTableProcessedTableManager get fitnessProfileId {
    final $_column = $_itemColumn<String>('fitness_profile_id')!;

    final manager = $$FitnessProfileTableTableTableManager(
      $_db,
      $_db.fitnessProfileTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fitnessProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $WeekScheduleTableTable,
    List<WeekScheduleTableData>
  >
  _weekScheduleTableRefsTable(
    _$EkafitzDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.weekScheduleTable,
    aliasName:
        'training_program_table__id__week_schedule_table__training_program_id',
  );

  $$WeekScheduleTableTableProcessedTableManager get weekScheduleTableRefs {
    final manager =
        $$WeekScheduleTableTableTableManager(
          $_db,
          $_db.weekScheduleTable,
        ).filter(
          (f) => f.trainingProgramId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _weekScheduleTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TrainingProgramTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $TrainingProgramTableTable> {
  $$TrainingProgramTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get programDuration => $composableBuilder(
    column: $table.programDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FitnessProfileTableTableFilterComposer get fitnessProfileId {
    final $$FitnessProfileTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fitnessProfileId,
      referencedTable: $db.fitnessProfileTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FitnessProfileTableTableFilterComposer(
            $db: $db,
            $table: $db.fitnessProfileTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> weekScheduleTableRefs(
    Expression<bool> Function($$WeekScheduleTableTableFilterComposer f) f,
  ) {
    final $$WeekScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weekScheduleTable,
      getReferencedColumn: (t) => t.trainingProgramId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeekScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.weekScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TrainingProgramTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $TrainingProgramTableTable> {
  $$TrainingProgramTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get programDuration => $composableBuilder(
    column: $table.programDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FitnessProfileTableTableOrderingComposer get fitnessProfileId {
    final $$FitnessProfileTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.fitnessProfileId,
          referencedTable: $db.fitnessProfileTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FitnessProfileTableTableOrderingComposer(
                $db: $db,
                $table: $db.fitnessProfileTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TrainingProgramTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $TrainingProgramTableTable> {
  $$TrainingProgramTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get programDuration => $composableBuilder(
    column: $table.programDuration,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$FitnessProfileTableTableAnnotationComposer get fitnessProfileId {
    final $$FitnessProfileTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.fitnessProfileId,
          referencedTable: $db.fitnessProfileTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FitnessProfileTableTableAnnotationComposer(
                $db: $db,
                $table: $db.fitnessProfileTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> weekScheduleTableRefs<T extends Object>(
    Expression<T> Function($$WeekScheduleTableTableAnnotationComposer a) f,
  ) {
    final $$WeekScheduleTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.weekScheduleTable,
          getReferencedColumn: (t) => t.trainingProgramId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WeekScheduleTableTableAnnotationComposer(
                $db: $db,
                $table: $db.weekScheduleTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TrainingProgramTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $TrainingProgramTableTable,
          TrainingProgramTableData,
          $$TrainingProgramTableTableFilterComposer,
          $$TrainingProgramTableTableOrderingComposer,
          $$TrainingProgramTableTableAnnotationComposer,
          $$TrainingProgramTableTableCreateCompanionBuilder,
          $$TrainingProgramTableTableUpdateCompanionBuilder,
          (TrainingProgramTableData, $$TrainingProgramTableTableReferences),
          TrainingProgramTableData,
          PrefetchHooks Function({
            bool fitnessProfileId,
            bool weekScheduleTableRefs,
          })
        > {
  $$TrainingProgramTableTableTableManager(
    _$EkafitzDatabase db,
    $TrainingProgramTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingProgramTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingProgramTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrainingProgramTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fitnessProfileId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> programDuration = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingProgramTableCompanion(
                id: id,
                fitnessProfileId: fitnessProfileId,
                name: name,
                description: description,
                programDuration: programDuration,
                startDate: startDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fitnessProfileId,
                required String name,
                Value<String?> description = const Value.absent(),
                required int programDuration,
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingProgramTableCompanion.insert(
                id: id,
                fitnessProfileId: fitnessProfileId,
                name: name,
                description: description,
                programDuration: programDuration,
                startDate: startDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $TrainingProgramTableTable,
                    TrainingProgramTableData
                  >(table),
                  $$TrainingProgramTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({fitnessProfileId = false, weekScheduleTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (weekScheduleTableRefs) db.weekScheduleTable,
                  ],
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
                        if (fitnessProfileId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.fitnessProfileId,
                            referencedTable:
                                $$TrainingProgramTableTableReferences
                                    ._fitnessProfileIdTable(db),
                            referencedColumn:
                                $$TrainingProgramTableTableReferences
                                    ._fitnessProfileIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (weekScheduleTableRefs)
                        await $_getPrefetchedData<
                          TrainingProgramTableData,
                          $TrainingProgramTableTable,
                          WeekScheduleTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TrainingProgramTableTableReferences
                              ._weekScheduleTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TrainingProgramTableTableReferences(
                                db,
                                table,
                                p0,
                              ).weekScheduleTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.trainingProgramId == item.id,
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

typedef $$TrainingProgramTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $TrainingProgramTableTable,
      TrainingProgramTableData,
      $$TrainingProgramTableTableFilterComposer,
      $$TrainingProgramTableTableOrderingComposer,
      $$TrainingProgramTableTableAnnotationComposer,
      $$TrainingProgramTableTableCreateCompanionBuilder,
      $$TrainingProgramTableTableUpdateCompanionBuilder,
      (TrainingProgramTableData, $$TrainingProgramTableTableReferences),
      TrainingProgramTableData,
      PrefetchHooks Function({
        bool fitnessProfileId,
        bool weekScheduleTableRefs,
      })
    >;
typedef $$WeekScheduleTableTableCreateCompanionBuilder =
    WeekScheduleTableCompanion Function({
      required String id,
      required String trainingProgramId,
      required int weekNumber,
      required int repetitionDuration,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$WeekScheduleTableTableUpdateCompanionBuilder =
    WeekScheduleTableCompanion Function({
      Value<String> id,
      Value<String> trainingProgramId,
      Value<int> weekNumber,
      Value<int> repetitionDuration,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$WeekScheduleTableTableReferences
    extends
        BaseReferences<
          _$EkafitzDatabase,
          $WeekScheduleTableTable,
          WeekScheduleTableData
        > {
  $$WeekScheduleTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TrainingProgramTableTable _trainingProgramIdTable(
    _$EkafitzDatabase db,
  ) => db.trainingProgramTable.createAlias(
    'week_schedule_table__training_program_id__training_program_table__id',
  );

  $$TrainingProgramTableTableProcessedTableManager get trainingProgramId {
    final $_column = $_itemColumn<String>('training_program_id')!;

    final manager = $$TrainingProgramTableTableTableManager(
      $_db,
      $_db.trainingProgramTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trainingProgramIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DayScheduleTableTable, List<DayScheduleTableData>>
  _dayScheduleTableRefsTable(_$EkafitzDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.dayScheduleTable,
        aliasName:
            'week_schedule_table__id__day_schedule_table__week_schedule_id',
      );

  $$DayScheduleTableTableProcessedTableManager get dayScheduleTableRefs {
    final manager = $$DayScheduleTableTableTableManager(
      $_db,
      $_db.dayScheduleTable,
    ).filter((f) => f.weekScheduleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dayScheduleTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WeekScheduleTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $WeekScheduleTableTable> {
  $$WeekScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekNumber => $composableBuilder(
    column: $table.weekNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitionDuration => $composableBuilder(
    column: $table.repetitionDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TrainingProgramTableTableFilterComposer get trainingProgramId {
    final $$TrainingProgramTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainingProgramId,
      referencedTable: $db.trainingProgramTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingProgramTableTableFilterComposer(
            $db: $db,
            $table: $db.trainingProgramTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dayScheduleTableRefs(
    Expression<bool> Function($$DayScheduleTableTableFilterComposer f) f,
  ) {
    final $$DayScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayScheduleTable,
      getReferencedColumn: (t) => t.weekScheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.dayScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeekScheduleTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $WeekScheduleTableTable> {
  $$WeekScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekNumber => $composableBuilder(
    column: $table.weekNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitionDuration => $composableBuilder(
    column: $table.repetitionDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TrainingProgramTableTableOrderingComposer get trainingProgramId {
    final $$TrainingProgramTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.trainingProgramId,
          referencedTable: $db.trainingProgramTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrainingProgramTableTableOrderingComposer(
                $db: $db,
                $table: $db.trainingProgramTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$WeekScheduleTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $WeekScheduleTableTable> {
  $$WeekScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get weekNumber => $composableBuilder(
    column: $table.weekNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitionDuration => $composableBuilder(
    column: $table.repetitionDuration,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TrainingProgramTableTableAnnotationComposer get trainingProgramId {
    final $$TrainingProgramTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.trainingProgramId,
          referencedTable: $db.trainingProgramTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TrainingProgramTableTableAnnotationComposer(
                $db: $db,
                $table: $db.trainingProgramTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> dayScheduleTableRefs<T extends Object>(
    Expression<T> Function($$DayScheduleTableTableAnnotationComposer a) f,
  ) {
    final $$DayScheduleTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayScheduleTable,
      getReferencedColumn: (t) => t.weekScheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayScheduleTableTableAnnotationComposer(
            $db: $db,
            $table: $db.dayScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeekScheduleTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $WeekScheduleTableTable,
          WeekScheduleTableData,
          $$WeekScheduleTableTableFilterComposer,
          $$WeekScheduleTableTableOrderingComposer,
          $$WeekScheduleTableTableAnnotationComposer,
          $$WeekScheduleTableTableCreateCompanionBuilder,
          $$WeekScheduleTableTableUpdateCompanionBuilder,
          (WeekScheduleTableData, $$WeekScheduleTableTableReferences),
          WeekScheduleTableData,
          PrefetchHooks Function({
            bool trainingProgramId,
            bool dayScheduleTableRefs,
          })
        > {
  $$WeekScheduleTableTableTableManager(
    _$EkafitzDatabase db,
    $WeekScheduleTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeekScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeekScheduleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeekScheduleTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> trainingProgramId = const Value.absent(),
                Value<int> weekNumber = const Value.absent(),
                Value<int> repetitionDuration = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeekScheduleTableCompanion(
                id: id,
                trainingProgramId: trainingProgramId,
                weekNumber: weekNumber,
                repetitionDuration: repetitionDuration,
                startDate: startDate,
                endDate: endDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String trainingProgramId,
                required int weekNumber,
                required int repetitionDuration,
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeekScheduleTableCompanion.insert(
                id: id,
                trainingProgramId: trainingProgramId,
                weekNumber: weekNumber,
                repetitionDuration: repetitionDuration,
                startDate: startDate,
                endDate: endDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WeekScheduleTableTable, WeekScheduleTableData>(
                    table,
                  ),
                  $$WeekScheduleTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({trainingProgramId = false, dayScheduleTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dayScheduleTableRefs) db.dayScheduleTable,
                  ],
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
                        if (trainingProgramId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.trainingProgramId,
                            referencedTable: $$WeekScheduleTableTableReferences
                                ._trainingProgramIdTable(db),
                            referencedColumn: $$WeekScheduleTableTableReferences
                                ._trainingProgramIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dayScheduleTableRefs)
                        await $_getPrefetchedData<
                          WeekScheduleTableData,
                          $WeekScheduleTableTable,
                          DayScheduleTableData
                        >(
                          currentTable: table,
                          referencedTable: $$WeekScheduleTableTableReferences
                              ._dayScheduleTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeekScheduleTableTableReferences(
                                db,
                                table,
                                p0,
                              ).dayScheduleTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weekScheduleId == item.id,
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

typedef $$WeekScheduleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $WeekScheduleTableTable,
      WeekScheduleTableData,
      $$WeekScheduleTableTableFilterComposer,
      $$WeekScheduleTableTableOrderingComposer,
      $$WeekScheduleTableTableAnnotationComposer,
      $$WeekScheduleTableTableCreateCompanionBuilder,
      $$WeekScheduleTableTableUpdateCompanionBuilder,
      (WeekScheduleTableData, $$WeekScheduleTableTableReferences),
      WeekScheduleTableData,
      PrefetchHooks Function({
        bool trainingProgramId,
        bool dayScheduleTableRefs,
      })
    >;
typedef $$DayScheduleTableTableCreateCompanionBuilder =
    DayScheduleTableCompanion Function({
      required String id,
      required String weekScheduleId,
      required DayOfWeek dayOfWeek,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$DayScheduleTableTableUpdateCompanionBuilder =
    DayScheduleTableCompanion Function({
      Value<String> id,
      Value<String> weekScheduleId,
      Value<DayOfWeek> dayOfWeek,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$DayScheduleTableTableReferences
    extends
        BaseReferences<
          _$EkafitzDatabase,
          $DayScheduleTableTable,
          DayScheduleTableData
        > {
  $$DayScheduleTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WeekScheduleTableTable _weekScheduleIdTable(_$EkafitzDatabase db) =>
      db.weekScheduleTable.createAlias(
        'day_schedule_table__week_schedule_id__week_schedule_table__id',
      );

  $$WeekScheduleTableTableProcessedTableManager get weekScheduleId {
    final $_column = $_itemColumn<String>('week_schedule_id')!;

    final manager = $$WeekScheduleTableTableTableManager(
      $_db,
      $_db.weekScheduleTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weekScheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $WorkoutInstanceTableTable,
    List<WorkoutInstanceTableData>
  >
  _workoutInstanceTableRefsTable(_$EkafitzDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workoutInstanceTable,
        aliasName:
            'day_schedule_table__id__workout_instance_table__day_schedule_id',
      );

  $$WorkoutInstanceTableTableProcessedTableManager
  get workoutInstanceTableRefs {
    final manager = $$WorkoutInstanceTableTableTableManager(
      $_db,
      $_db.workoutInstanceTable,
    ).filter((f) => f.dayScheduleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutInstanceTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DayScheduleTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $DayScheduleTableTable> {
  $$DayScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DayOfWeek, DayOfWeek, String> get dayOfWeek =>
      $composableBuilder(
        column: $table.dayOfWeek,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeekScheduleTableTableFilterComposer get weekScheduleId {
    final $$WeekScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weekScheduleId,
      referencedTable: $db.weekScheduleTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeekScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.weekScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workoutInstanceTableRefs(
    Expression<bool> Function($$WorkoutInstanceTableTableFilterComposer f) f,
  ) {
    final $$WorkoutInstanceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutInstanceTable,
      getReferencedColumn: (t) => t.dayScheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutInstanceTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutInstanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DayScheduleTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $DayScheduleTableTable> {
  $$DayScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeekScheduleTableTableOrderingComposer get weekScheduleId {
    final $$WeekScheduleTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weekScheduleId,
      referencedTable: $db.weekScheduleTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeekScheduleTableTableOrderingComposer(
            $db: $db,
            $table: $db.weekScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayScheduleTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $DayScheduleTableTable> {
  $$DayScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DayOfWeek, String> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeekScheduleTableTableAnnotationComposer get weekScheduleId {
    final $$WeekScheduleTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.weekScheduleId,
          referencedTable: $db.weekScheduleTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WeekScheduleTableTableAnnotationComposer(
                $db: $db,
                $table: $db.weekScheduleTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> workoutInstanceTableRefs<T extends Object>(
    Expression<T> Function($$WorkoutInstanceTableTableAnnotationComposer a) f,
  ) {
    final $$WorkoutInstanceTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workoutInstanceTable,
          getReferencedColumn: (t) => t.dayScheduleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutInstanceTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workoutInstanceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DayScheduleTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $DayScheduleTableTable,
          DayScheduleTableData,
          $$DayScheduleTableTableFilterComposer,
          $$DayScheduleTableTableOrderingComposer,
          $$DayScheduleTableTableAnnotationComposer,
          $$DayScheduleTableTableCreateCompanionBuilder,
          $$DayScheduleTableTableUpdateCompanionBuilder,
          (DayScheduleTableData, $$DayScheduleTableTableReferences),
          DayScheduleTableData,
          PrefetchHooks Function({
            bool weekScheduleId,
            bool workoutInstanceTableRefs,
          })
        > {
  $$DayScheduleTableTableTableManager(
    _$EkafitzDatabase db,
    $DayScheduleTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayScheduleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayScheduleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> weekScheduleId = const Value.absent(),
                Value<DayOfWeek> dayOfWeek = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayScheduleTableCompanion(
                id: id,
                weekScheduleId: weekScheduleId,
                dayOfWeek: dayOfWeek,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String weekScheduleId,
                required DayOfWeek dayOfWeek,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayScheduleTableCompanion.insert(
                id: id,
                weekScheduleId: weekScheduleId,
                dayOfWeek: dayOfWeek,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DayScheduleTableTable, DayScheduleTableData>(
                    table,
                  ),
                  $$DayScheduleTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({weekScheduleId = false, workoutInstanceTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutInstanceTableRefs) db.workoutInstanceTable,
                  ],
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
                        if (weekScheduleId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.weekScheduleId,
                            referencedTable: $$DayScheduleTableTableReferences
                                ._weekScheduleIdTable(db),
                            referencedColumn: $$DayScheduleTableTableReferences
                                ._weekScheduleIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutInstanceTableRefs)
                        await $_getPrefetchedData<
                          DayScheduleTableData,
                          $DayScheduleTableTable,
                          WorkoutInstanceTableData
                        >(
                          currentTable: table,
                          referencedTable: $$DayScheduleTableTableReferences
                              ._workoutInstanceTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DayScheduleTableTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutInstanceTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayScheduleId == item.id,
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

typedef $$DayScheduleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $DayScheduleTableTable,
      DayScheduleTableData,
      $$DayScheduleTableTableFilterComposer,
      $$DayScheduleTableTableOrderingComposer,
      $$DayScheduleTableTableAnnotationComposer,
      $$DayScheduleTableTableCreateCompanionBuilder,
      $$DayScheduleTableTableUpdateCompanionBuilder,
      (DayScheduleTableData, $$DayScheduleTableTableReferences),
      DayScheduleTableData,
      PrefetchHooks Function({
        bool weekScheduleId,
        bool workoutInstanceTableRefs,
      })
    >;
typedef $$WorkoutTableTableCreateCompanionBuilder =
    WorkoutTableCompanion Function({
      Value<int> id,
      required String workoutName,
      Value<String?> description,
      required int sets,
      required int reps,
      required double weight,
      Value<WorkoutEquipment?> equipment,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$WorkoutTableTableUpdateCompanionBuilder =
    WorkoutTableCompanion Function({
      Value<int> id,
      Value<String> workoutName,
      Value<String?> description,
      Value<int> sets,
      Value<int> reps,
      Value<double> weight,
      Value<WorkoutEquipment?> equipment,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$WorkoutTableTableReferences
    extends
        BaseReferences<
          _$EkafitzDatabase,
          $WorkoutTableTable,
          WorkoutTableData
        > {
  $$WorkoutTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $WorkoutInstanceTableTable,
    List<WorkoutInstanceTableData>
  >
  _workoutInstanceTableRefsTable(_$EkafitzDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workoutInstanceTable,
        aliasName: 'workout_table__id__workout_instance_table__workout_id',
      );

  $$WorkoutInstanceTableTableProcessedTableManager
  get workoutInstanceTableRefs {
    final manager = $$WorkoutInstanceTableTableTableManager(
      $_db,
      $_db.workoutInstanceTable,
    ).filter((f) => f.workoutId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutInstanceTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $WorkoutTableTable> {
  $$WorkoutTableTableFilterComposer({
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

  ColumnFilters<String> get workoutName => $composableBuilder(
    column: $table.workoutName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WorkoutEquipment?, WorkoutEquipment, String>
  get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> workoutInstanceTableRefs(
    Expression<bool> Function($$WorkoutInstanceTableTableFilterComposer f) f,
  ) {
    final $$WorkoutInstanceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutInstanceTable,
      getReferencedColumn: (t) => t.workoutId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutInstanceTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutInstanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $WorkoutTableTable> {
  $$WorkoutTableTableOrderingComposer({
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

  ColumnOrderings<String> get workoutName => $composableBuilder(
    column: $table.workoutName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $WorkoutTableTable> {
  $$WorkoutTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workoutName => $composableBuilder(
    column: $table.workoutName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WorkoutEquipment?, String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> workoutInstanceTableRefs<T extends Object>(
    Expression<T> Function($$WorkoutInstanceTableTableAnnotationComposer a) f,
  ) {
    final $$WorkoutInstanceTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workoutInstanceTable,
          getReferencedColumn: (t) => t.workoutId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutInstanceTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workoutInstanceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WorkoutTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $WorkoutTableTable,
          WorkoutTableData,
          $$WorkoutTableTableFilterComposer,
          $$WorkoutTableTableOrderingComposer,
          $$WorkoutTableTableAnnotationComposer,
          $$WorkoutTableTableCreateCompanionBuilder,
          $$WorkoutTableTableUpdateCompanionBuilder,
          (WorkoutTableData, $$WorkoutTableTableReferences),
          WorkoutTableData,
          PrefetchHooks Function({bool workoutInstanceTableRefs})
        > {
  $$WorkoutTableTableTableManager(
    _$EkafitzDatabase db,
    $WorkoutTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> workoutName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> sets = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<WorkoutEquipment?> equipment = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => WorkoutTableCompanion(
                id: id,
                workoutName: workoutName,
                description: description,
                sets: sets,
                reps: reps,
                weight: weight,
                equipment: equipment,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String workoutName,
                Value<String?> description = const Value.absent(),
                required int sets,
                required int reps,
                required double weight,
                Value<WorkoutEquipment?> equipment = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => WorkoutTableCompanion.insert(
                id: id,
                workoutName: workoutName,
                description: description,
                sets: sets,
                reps: reps,
                weight: weight,
                equipment: equipment,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WorkoutTableTable, WorkoutTableData>(table),
                  $$WorkoutTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workoutInstanceTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (workoutInstanceTableRefs) db.workoutInstanceTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workoutInstanceTableRefs)
                    await $_getPrefetchedData<
                      WorkoutTableData,
                      $WorkoutTableTable,
                      WorkoutInstanceTableData
                    >(
                      currentTable: table,
                      referencedTable: $$WorkoutTableTableReferences
                          ._workoutInstanceTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorkoutTableTableReferences(
                            db,
                            table,
                            p0,
                          ).workoutInstanceTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.workoutId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $WorkoutTableTable,
      WorkoutTableData,
      $$WorkoutTableTableFilterComposer,
      $$WorkoutTableTableOrderingComposer,
      $$WorkoutTableTableAnnotationComposer,
      $$WorkoutTableTableCreateCompanionBuilder,
      $$WorkoutTableTableUpdateCompanionBuilder,
      (WorkoutTableData, $$WorkoutTableTableReferences),
      WorkoutTableData,
      PrefetchHooks Function({bool workoutInstanceTableRefs})
    >;
typedef $$WorkoutInstanceTableTableCreateCompanionBuilder =
    WorkoutInstanceTableCompanion Function({
      required String id,
      required String dayScheduleId,
      required int workoutId,
      required int scheduledReps,
      required double scheduledWeight,
      required int completedReps,
      required double completedWeight,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$WorkoutInstanceTableTableUpdateCompanionBuilder =
    WorkoutInstanceTableCompanion Function({
      Value<String> id,
      Value<String> dayScheduleId,
      Value<int> workoutId,
      Value<int> scheduledReps,
      Value<double> scheduledWeight,
      Value<int> completedReps,
      Value<double> completedWeight,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$WorkoutInstanceTableTableReferences
    extends
        BaseReferences<
          _$EkafitzDatabase,
          $WorkoutInstanceTableTable,
          WorkoutInstanceTableData
        > {
  $$WorkoutInstanceTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DayScheduleTableTable _dayScheduleIdTable(_$EkafitzDatabase db) =>
      db.dayScheduleTable.createAlias(
        'workout_instance_table__day_schedule_id__day_schedule_table__id',
      );

  $$DayScheduleTableTableProcessedTableManager get dayScheduleId {
    final $_column = $_itemColumn<String>('day_schedule_id')!;

    final manager = $$DayScheduleTableTableTableManager(
      $_db,
      $_db.dayScheduleTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayScheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkoutTableTable _workoutIdTable(_$EkafitzDatabase db) => db
      .workoutTable
      .createAlias('workout_instance_table__workout_id__workout_table__id');

  $$WorkoutTableTableProcessedTableManager get workoutId {
    final $_column = $_itemColumn<int>('workout_id')!;

    final manager = $$WorkoutTableTableTableManager(
      $_db,
      $_db.workoutTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkoutInstanceTableTableFilterComposer
    extends Composer<_$EkafitzDatabase, $WorkoutInstanceTableTable> {
  $$WorkoutInstanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduledReps => $composableBuilder(
    column: $table.scheduledReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get scheduledWeight => $composableBuilder(
    column: $table.scheduledWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedReps => $composableBuilder(
    column: $table.completedReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get completedWeight => $composableBuilder(
    column: $table.completedWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DayScheduleTableTableFilterComposer get dayScheduleId {
    final $$DayScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayScheduleId,
      referencedTable: $db.dayScheduleTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.dayScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTableTableFilterComposer get workoutId {
    final $$WorkoutTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutId,
      referencedTable: $db.workoutTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutInstanceTableTableOrderingComposer
    extends Composer<_$EkafitzDatabase, $WorkoutInstanceTableTable> {
  $$WorkoutInstanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduledReps => $composableBuilder(
    column: $table.scheduledReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get scheduledWeight => $composableBuilder(
    column: $table.scheduledWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedReps => $composableBuilder(
    column: $table.completedReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get completedWeight => $composableBuilder(
    column: $table.completedWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DayScheduleTableTableOrderingComposer get dayScheduleId {
    final $$DayScheduleTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayScheduleId,
      referencedTable: $db.dayScheduleTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayScheduleTableTableOrderingComposer(
            $db: $db,
            $table: $db.dayScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTableTableOrderingComposer get workoutId {
    final $$WorkoutTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutId,
      referencedTable: $db.workoutTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTableTableOrderingComposer(
            $db: $db,
            $table: $db.workoutTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutInstanceTableTableAnnotationComposer
    extends Composer<_$EkafitzDatabase, $WorkoutInstanceTableTable> {
  $$WorkoutInstanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get scheduledReps => $composableBuilder(
    column: $table.scheduledReps,
    builder: (column) => column,
  );

  GeneratedColumn<double> get scheduledWeight => $composableBuilder(
    column: $table.scheduledWeight,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedReps => $composableBuilder(
    column: $table.completedReps,
    builder: (column) => column,
  );

  GeneratedColumn<double> get completedWeight => $composableBuilder(
    column: $table.completedWeight,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DayScheduleTableTableAnnotationComposer get dayScheduleId {
    final $$DayScheduleTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayScheduleId,
      referencedTable: $db.dayScheduleTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayScheduleTableTableAnnotationComposer(
            $db: $db,
            $table: $db.dayScheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTableTableAnnotationComposer get workoutId {
    final $$WorkoutTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutId,
      referencedTable: $db.workoutTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTableTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutInstanceTableTableTableManager
    extends
        RootTableManager<
          _$EkafitzDatabase,
          $WorkoutInstanceTableTable,
          WorkoutInstanceTableData,
          $$WorkoutInstanceTableTableFilterComposer,
          $$WorkoutInstanceTableTableOrderingComposer,
          $$WorkoutInstanceTableTableAnnotationComposer,
          $$WorkoutInstanceTableTableCreateCompanionBuilder,
          $$WorkoutInstanceTableTableUpdateCompanionBuilder,
          (WorkoutInstanceTableData, $$WorkoutInstanceTableTableReferences),
          WorkoutInstanceTableData,
          PrefetchHooks Function({bool dayScheduleId, bool workoutId})
        > {
  $$WorkoutInstanceTableTableTableManager(
    _$EkafitzDatabase db,
    $WorkoutInstanceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutInstanceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutInstanceTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkoutInstanceTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dayScheduleId = const Value.absent(),
                Value<int> workoutId = const Value.absent(),
                Value<int> scheduledReps = const Value.absent(),
                Value<double> scheduledWeight = const Value.absent(),
                Value<int> completedReps = const Value.absent(),
                Value<double> completedWeight = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutInstanceTableCompanion(
                id: id,
                dayScheduleId: dayScheduleId,
                workoutId: workoutId,
                scheduledReps: scheduledReps,
                scheduledWeight: scheduledWeight,
                completedReps: completedReps,
                completedWeight: completedWeight,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dayScheduleId,
                required int workoutId,
                required int scheduledReps,
                required double scheduledWeight,
                required int completedReps,
                required double completedWeight,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutInstanceTableCompanion.insert(
                id: id,
                dayScheduleId: dayScheduleId,
                workoutId: workoutId,
                scheduledReps: scheduledReps,
                scheduledWeight: scheduledWeight,
                completedReps: completedReps,
                completedWeight: completedWeight,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $WorkoutInstanceTableTable,
                    WorkoutInstanceTableData
                  >(table),
                  $$WorkoutInstanceTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dayScheduleId = false, workoutId = false}) {
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
                    if (dayScheduleId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.dayScheduleId,
                        referencedTable: $$WorkoutInstanceTableTableReferences
                            ._dayScheduleIdTable(db),
                        referencedColumn: $$WorkoutInstanceTableTableReferences
                            ._dayScheduleIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (workoutId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.workoutId,
                        referencedTable: $$WorkoutInstanceTableTableReferences
                            ._workoutIdTable(db),
                        referencedColumn: $$WorkoutInstanceTableTableReferences
                            ._workoutIdTable(db)
                            .id,
                      ) as T;
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

typedef $$WorkoutInstanceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$EkafitzDatabase,
      $WorkoutInstanceTableTable,
      WorkoutInstanceTableData,
      $$WorkoutInstanceTableTableFilterComposer,
      $$WorkoutInstanceTableTableOrderingComposer,
      $$WorkoutInstanceTableTableAnnotationComposer,
      $$WorkoutInstanceTableTableCreateCompanionBuilder,
      $$WorkoutInstanceTableTableUpdateCompanionBuilder,
      (WorkoutInstanceTableData, $$WorkoutInstanceTableTableReferences),
      WorkoutInstanceTableData,
      PrefetchHooks Function({bool dayScheduleId, bool workoutId})
    >;

class $EkafitzDatabaseManager {
  final _$EkafitzDatabase _db;
  $EkafitzDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$FitnessProfileTableTableTableManager get fitnessProfileTable =>
      $$FitnessProfileTableTableTableManager(_db, _db.fitnessProfileTable);
  $$TrainingProgramTableTableTableManager get trainingProgramTable =>
      $$TrainingProgramTableTableTableManager(_db, _db.trainingProgramTable);
  $$WeekScheduleTableTableTableManager get weekScheduleTable =>
      $$WeekScheduleTableTableTableManager(_db, _db.weekScheduleTable);
  $$DayScheduleTableTableTableManager get dayScheduleTable =>
      $$DayScheduleTableTableTableManager(_db, _db.dayScheduleTable);
  $$WorkoutTableTableTableManager get workoutTable =>
      $$WorkoutTableTableTableManager(_db, _db.workoutTable);
  $$WorkoutInstanceTableTableTableManager get workoutInstanceTable =>
      $$WorkoutInstanceTableTableTableManager(_db, _db.workoutInstanceTable);
}
