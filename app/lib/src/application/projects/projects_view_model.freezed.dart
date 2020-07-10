/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'projects_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ProjectsStateTearOff {
  const _$ProjectsStateTearOff();

  _ProjectsState call(
      {List<Project> projects = const [],
      Project selectedProject,
      NetworkFailure loadProjectsFailure,
      bool isLoadingProjects = false}) {
    return _ProjectsState(
      projects: projects,
      selectedProject: selectedProject,
      loadProjectsFailure: loadProjectsFailure,
      isLoadingProjects: isLoadingProjects,
    );
  }
}

// ignore: unused_element
const $ProjectsState = _$ProjectsStateTearOff();

mixin _$ProjectsState {
  List<Project> get projects;
  Project get selectedProject;
  NetworkFailure get loadProjectsFailure;
  bool get isLoadingProjects;

  $ProjectsStateCopyWith<ProjectsState> get copyWith;
}

abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
          ProjectsState value, $Res Function(ProjectsState) then) =
      _$ProjectsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Project> projects,
      Project selectedProject,
      NetworkFailure loadProjectsFailure,
      bool isLoadingProjects});

  $NetworkFailureCopyWith<$Res> get loadProjectsFailure;
}

class _$ProjectsStateCopyWithImpl<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  final ProjectsState _value;
  // ignore: unused_field
  final $Res Function(ProjectsState) _then;

  @override
  $Res call({
    Object projects = freezed,
    Object selectedProject = freezed,
    Object loadProjectsFailure = freezed,
    Object isLoadingProjects = freezed,
  }) {
    return _then(_value.copyWith(
      projects:
          projects == freezed ? _value.projects : projects as List<Project>,
      selectedProject: selectedProject == freezed
          ? _value.selectedProject
          : selectedProject as Project,
      loadProjectsFailure: loadProjectsFailure == freezed
          ? _value.loadProjectsFailure
          : loadProjectsFailure as NetworkFailure,
      isLoadingProjects: isLoadingProjects == freezed
          ? _value.isLoadingProjects
          : isLoadingProjects as bool,
    ));
  }

  @override
  $NetworkFailureCopyWith<$Res> get loadProjectsFailure {
    if (_value.loadProjectsFailure == null) {
      return null;
    }
    return $NetworkFailureCopyWith<$Res>(_value.loadProjectsFailure, (value) {
      return _then(_value.copyWith(loadProjectsFailure: value));
    });
  }
}

abstract class _$ProjectsStateCopyWith<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  factory _$ProjectsStateCopyWith(
          _ProjectsState value, $Res Function(_ProjectsState) then) =
      __$ProjectsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Project> projects,
      Project selectedProject,
      NetworkFailure loadProjectsFailure,
      bool isLoadingProjects});

  @override
  $NetworkFailureCopyWith<$Res> get loadProjectsFailure;
}

class __$ProjectsStateCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res>
    implements _$ProjectsStateCopyWith<$Res> {
  __$ProjectsStateCopyWithImpl(
      _ProjectsState _value, $Res Function(_ProjectsState) _then)
      : super(_value, (v) => _then(v as _ProjectsState));

  @override
  _ProjectsState get _value => super._value as _ProjectsState;

  @override
  $Res call({
    Object projects = freezed,
    Object selectedProject = freezed,
    Object loadProjectsFailure = freezed,
    Object isLoadingProjects = freezed,
  }) {
    return _then(_ProjectsState(
      projects:
          projects == freezed ? _value.projects : projects as List<Project>,
      selectedProject: selectedProject == freezed
          ? _value.selectedProject
          : selectedProject as Project,
      loadProjectsFailure: loadProjectsFailure == freezed
          ? _value.loadProjectsFailure
          : loadProjectsFailure as NetworkFailure,
      isLoadingProjects: isLoadingProjects == freezed
          ? _value.isLoadingProjects
          : isLoadingProjects as bool,
    ));
  }
}

class _$_ProjectsState implements _ProjectsState {
  const _$_ProjectsState(
      {this.projects = const [],
      this.selectedProject,
      this.loadProjectsFailure,
      this.isLoadingProjects = false})
      : assert(projects != null),
        assert(isLoadingProjects != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Project> projects;
  @override
  final Project selectedProject;
  @override
  final NetworkFailure loadProjectsFailure;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingProjects;

  @override
  String toString() {
    return 'ProjectsState(projects: $projects, selectedProject: $selectedProject, loadProjectsFailure: $loadProjectsFailure, isLoadingProjects: $isLoadingProjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProjectsState &&
            (identical(other.projects, projects) ||
                const DeepCollectionEquality()
                    .equals(other.projects, projects)) &&
            (identical(other.selectedProject, selectedProject) ||
                const DeepCollectionEquality()
                    .equals(other.selectedProject, selectedProject)) &&
            (identical(other.loadProjectsFailure, loadProjectsFailure) ||
                const DeepCollectionEquality()
                    .equals(other.loadProjectsFailure, loadProjectsFailure)) &&
            (identical(other.isLoadingProjects, isLoadingProjects) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingProjects, isLoadingProjects)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projects) ^
      const DeepCollectionEquality().hash(selectedProject) ^
      const DeepCollectionEquality().hash(loadProjectsFailure) ^
      const DeepCollectionEquality().hash(isLoadingProjects);

  @override
  _$ProjectsStateCopyWith<_ProjectsState> get copyWith =>
      __$ProjectsStateCopyWithImpl<_ProjectsState>(this, _$identity);
}

abstract class _ProjectsState implements ProjectsState {
  const factory _ProjectsState(
      {List<Project> projects,
      Project selectedProject,
      NetworkFailure loadProjectsFailure,
      bool isLoadingProjects}) = _$_ProjectsState;

  @override
  List<Project> get projects;
  @override
  Project get selectedProject;
  @override
  NetworkFailure get loadProjectsFailure;
  @override
  bool get isLoadingProjects;
  @override
  _$ProjectsStateCopyWith<_ProjectsState> get copyWith;
}
