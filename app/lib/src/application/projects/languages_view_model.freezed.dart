/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 6/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'languages_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LanguagesStateTearOff {
  const _$LanguagesStateTearOff();

  _LanguagesState call(
      {bool isLoadingLanguages = false,
      NetworkFailure loadLanguageFailure,
      List<Language> languages = const [],
      Project project}) {
    return _LanguagesState(
      isLoadingLanguages: isLoadingLanguages,
      loadLanguageFailure: loadLanguageFailure,
      languages: languages,
      project: project,
    );
  }
}

// ignore: unused_element
const $LanguagesState = _$LanguagesStateTearOff();

mixin _$LanguagesState {
  bool get isLoadingLanguages;
  NetworkFailure get loadLanguageFailure;
  List<Language> get languages;
  Project get project;

  $LanguagesStateCopyWith<LanguagesState> get copyWith;
}

abstract class $LanguagesStateCopyWith<$Res> {
  factory $LanguagesStateCopyWith(
          LanguagesState value, $Res Function(LanguagesState) then) =
      _$LanguagesStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoadingLanguages,
      NetworkFailure loadLanguageFailure,
      List<Language> languages,
      Project project});

  $NetworkFailureCopyWith<$Res> get loadLanguageFailure;
}

class _$LanguagesStateCopyWithImpl<$Res>
    implements $LanguagesStateCopyWith<$Res> {
  _$LanguagesStateCopyWithImpl(this._value, this._then);

  final LanguagesState _value;
  // ignore: unused_field
  final $Res Function(LanguagesState) _then;

  @override
  $Res call({
    Object isLoadingLanguages = freezed,
    Object loadLanguageFailure = freezed,
    Object languages = freezed,
    Object project = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingLanguages: isLoadingLanguages == freezed
          ? _value.isLoadingLanguages
          : isLoadingLanguages as bool,
      loadLanguageFailure: loadLanguageFailure == freezed
          ? _value.loadLanguageFailure
          : loadLanguageFailure as NetworkFailure,
      languages:
          languages == freezed ? _value.languages : languages as List<Language>,
      project: project == freezed ? _value.project : project as Project,
    ));
  }

  @override
  $NetworkFailureCopyWith<$Res> get loadLanguageFailure {
    if (_value.loadLanguageFailure == null) {
      return null;
    }
    return $NetworkFailureCopyWith<$Res>(_value.loadLanguageFailure, (value) {
      return _then(_value.copyWith(loadLanguageFailure: value));
    });
  }
}

abstract class _$LanguagesStateCopyWith<$Res>
    implements $LanguagesStateCopyWith<$Res> {
  factory _$LanguagesStateCopyWith(
          _LanguagesState value, $Res Function(_LanguagesState) then) =
      __$LanguagesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoadingLanguages,
      NetworkFailure loadLanguageFailure,
      List<Language> languages,
      Project project});

  @override
  $NetworkFailureCopyWith<$Res> get loadLanguageFailure;
}

class __$LanguagesStateCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res>
    implements _$LanguagesStateCopyWith<$Res> {
  __$LanguagesStateCopyWithImpl(
      _LanguagesState _value, $Res Function(_LanguagesState) _then)
      : super(_value, (v) => _then(v as _LanguagesState));

  @override
  _LanguagesState get _value => super._value as _LanguagesState;

  @override
  $Res call({
    Object isLoadingLanguages = freezed,
    Object loadLanguageFailure = freezed,
    Object languages = freezed,
    Object project = freezed,
  }) {
    return _then(_LanguagesState(
      isLoadingLanguages: isLoadingLanguages == freezed
          ? _value.isLoadingLanguages
          : isLoadingLanguages as bool,
      loadLanguageFailure: loadLanguageFailure == freezed
          ? _value.loadLanguageFailure
          : loadLanguageFailure as NetworkFailure,
      languages:
          languages == freezed ? _value.languages : languages as List<Language>,
      project: project == freezed ? _value.project : project as Project,
    ));
  }
}

class _$_LanguagesState implements _LanguagesState {
  _$_LanguagesState(
      {this.isLoadingLanguages = false,
      this.loadLanguageFailure,
      this.languages = const [],
      this.project})
      : assert(isLoadingLanguages != null),
        assert(languages != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingLanguages;
  @override
  final NetworkFailure loadLanguageFailure;
  @JsonKey(defaultValue: const [])
  @override
  final List<Language> languages;
  @override
  final Project project;

  @override
  String toString() {
    return 'LanguagesState(isLoadingLanguages: $isLoadingLanguages, loadLanguageFailure: $loadLanguageFailure, languages: $languages, project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LanguagesState &&
            (identical(other.isLoadingLanguages, isLoadingLanguages) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingLanguages, isLoadingLanguages)) &&
            (identical(other.loadLanguageFailure, loadLanguageFailure) ||
                const DeepCollectionEquality()
                    .equals(other.loadLanguageFailure, loadLanguageFailure)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.project, project) ||
                const DeepCollectionEquality().equals(other.project, project)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoadingLanguages) ^
      const DeepCollectionEquality().hash(loadLanguageFailure) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(project);

  @override
  _$LanguagesStateCopyWith<_LanguagesState> get copyWith =>
      __$LanguagesStateCopyWithImpl<_LanguagesState>(this, _$identity);
}

abstract class _LanguagesState implements LanguagesState {
  factory _LanguagesState(
      {bool isLoadingLanguages,
      NetworkFailure loadLanguageFailure,
      List<Language> languages,
      Project project}) = _$_LanguagesState;

  @override
  bool get isLoadingLanguages;
  @override
  NetworkFailure get loadLanguageFailure;
  @override
  List<Language> get languages;
  @override
  Project get project;
  @override
  _$LanguagesStateCopyWith<_LanguagesState> get copyWith;
}
