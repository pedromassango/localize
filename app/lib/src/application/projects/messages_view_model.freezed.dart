/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'messages_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MessagesStateTearOff {
  const _$MessagesStateTearOff();

  _MessagesState call(
      {List<Message> projectMessages = const [],
      bool loadingProjectMessages = false,
      NetworkFailure loadMessagesFailure,
      Project selectedProject}) {
    return _MessagesState(
      projectMessages: projectMessages,
      loadingProjectMessages: loadingProjectMessages,
      loadMessagesFailure: loadMessagesFailure,
      selectedProject: selectedProject,
    );
  }
}

// ignore: unused_element
const $MessagesState = _$MessagesStateTearOff();

mixin _$MessagesState {
  List<Message> get projectMessages;
  bool get loadingProjectMessages;
  NetworkFailure get loadMessagesFailure;
  Project get selectedProject;

  $MessagesStateCopyWith<MessagesState> get copyWith;
}

abstract class $MessagesStateCopyWith<$Res> {
  factory $MessagesStateCopyWith(
          MessagesState value, $Res Function(MessagesState) then) =
      _$MessagesStateCopyWithImpl<$Res>;
  $Res call(
      {List<Message> projectMessages,
      bool loadingProjectMessages,
      NetworkFailure loadMessagesFailure,
      Project selectedProject});

  $NetworkFailureCopyWith<$Res> get loadMessagesFailure;
}

class _$MessagesStateCopyWithImpl<$Res>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._value, this._then);

  final MessagesState _value;
  // ignore: unused_field
  final $Res Function(MessagesState) _then;

  @override
  $Res call({
    Object projectMessages = freezed,
    Object loadingProjectMessages = freezed,
    Object loadMessagesFailure = freezed,
    Object selectedProject = freezed,
  }) {
    return _then(_value.copyWith(
      projectMessages: projectMessages == freezed
          ? _value.projectMessages
          : projectMessages as List<Message>,
      loadingProjectMessages: loadingProjectMessages == freezed
          ? _value.loadingProjectMessages
          : loadingProjectMessages as bool,
      loadMessagesFailure: loadMessagesFailure == freezed
          ? _value.loadMessagesFailure
          : loadMessagesFailure as NetworkFailure,
      selectedProject: selectedProject == freezed
          ? _value.selectedProject
          : selectedProject as Project,
    ));
  }

  @override
  $NetworkFailureCopyWith<$Res> get loadMessagesFailure {
    if (_value.loadMessagesFailure == null) {
      return null;
    }
    return $NetworkFailureCopyWith<$Res>(_value.loadMessagesFailure, (value) {
      return _then(_value.copyWith(loadMessagesFailure: value));
    });
  }
}

abstract class _$MessagesStateCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$MessagesStateCopyWith(
          _MessagesState value, $Res Function(_MessagesState) then) =
      __$MessagesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Message> projectMessages,
      bool loadingProjectMessages,
      NetworkFailure loadMessagesFailure,
      Project selectedProject});

  @override
  $NetworkFailureCopyWith<$Res> get loadMessagesFailure;
}

class __$MessagesStateCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res>
    implements _$MessagesStateCopyWith<$Res> {
  __$MessagesStateCopyWithImpl(
      _MessagesState _value, $Res Function(_MessagesState) _then)
      : super(_value, (v) => _then(v as _MessagesState));

  @override
  _MessagesState get _value => super._value as _MessagesState;

  @override
  $Res call({
    Object projectMessages = freezed,
    Object loadingProjectMessages = freezed,
    Object loadMessagesFailure = freezed,
    Object selectedProject = freezed,
  }) {
    return _then(_MessagesState(
      projectMessages: projectMessages == freezed
          ? _value.projectMessages
          : projectMessages as List<Message>,
      loadingProjectMessages: loadingProjectMessages == freezed
          ? _value.loadingProjectMessages
          : loadingProjectMessages as bool,
      loadMessagesFailure: loadMessagesFailure == freezed
          ? _value.loadMessagesFailure
          : loadMessagesFailure as NetworkFailure,
      selectedProject: selectedProject == freezed
          ? _value.selectedProject
          : selectedProject as Project,
    ));
  }
}

class _$_MessagesState implements _MessagesState {
  _$_MessagesState(
      {this.projectMessages = const [],
      this.loadingProjectMessages = false,
      this.loadMessagesFailure,
      this.selectedProject})
      : assert(projectMessages != null),
        assert(loadingProjectMessages != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Message> projectMessages;
  @JsonKey(defaultValue: false)
  @override
  final bool loadingProjectMessages;
  @override
  final NetworkFailure loadMessagesFailure;
  @override
  final Project selectedProject;

  @override
  String toString() {
    return 'MessagesState(projectMessages: $projectMessages, loadingProjectMessages: $loadingProjectMessages, loadMessagesFailure: $loadMessagesFailure, selectedProject: $selectedProject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessagesState &&
            (identical(other.projectMessages, projectMessages) ||
                const DeepCollectionEquality()
                    .equals(other.projectMessages, projectMessages)) &&
            (identical(other.loadingProjectMessages, loadingProjectMessages) ||
                const DeepCollectionEquality().equals(
                    other.loadingProjectMessages, loadingProjectMessages)) &&
            (identical(other.loadMessagesFailure, loadMessagesFailure) ||
                const DeepCollectionEquality()
                    .equals(other.loadMessagesFailure, loadMessagesFailure)) &&
            (identical(other.selectedProject, selectedProject) ||
                const DeepCollectionEquality()
                    .equals(other.selectedProject, selectedProject)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projectMessages) ^
      const DeepCollectionEquality().hash(loadingProjectMessages) ^
      const DeepCollectionEquality().hash(loadMessagesFailure) ^
      const DeepCollectionEquality().hash(selectedProject);

  @override
  _$MessagesStateCopyWith<_MessagesState> get copyWith =>
      __$MessagesStateCopyWithImpl<_MessagesState>(this, _$identity);
}

abstract class _MessagesState implements MessagesState {
  factory _MessagesState(
      {List<Message> projectMessages,
      bool loadingProjectMessages,
      NetworkFailure loadMessagesFailure,
      Project selectedProject}) = _$_MessagesState;

  @override
  List<Message> get projectMessages;
  @override
  bool get loadingProjectMessages;
  @override
  NetworkFailure get loadMessagesFailure;
  @override
  Project get selectedProject;
  @override
  _$MessagesStateCopyWith<_MessagesState> get copyWith;
}
