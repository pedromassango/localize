/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/messages_repository.dart';
import 'package:cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_view_model.freezed.dart';

@freezed
abstract class MessagesState with _$MessagesState {
  factory MessagesState({
    @Default([]) List<Message> projectMessages,
    @Default(false) bool loadingProjectMessages,
    NetworkFailure loadMessagesFailure,
    Project selectedProject,
  }) = _MessagesState;

}

extension Ext on MessagesState {
  bool get hasFailure => loadMessagesFailure != null;
}

class MessagesViewModel extends Cubit<MessagesState> {
  MessagesViewModel(this._messagesRepository) : super(MessagesState());

  final MessagesRepository _messagesRepository;

  // This need to be called before using any other method inside of this class.
  Future onSelectedProjectChanged(Project selectedProject) async {
    emit(state.copyWith.call(selectedProject: selectedProject, projectMessages: []));
    await loadProjectMessages();
  }

  Future loadProjectMessages() {
    ArgumentError.checkNotNull(state.selectedProject, 'selectedProject must not be null');

    //emit(state.copyWith.call(loadingProjectMessages: true, projectMessages: []));

    // TODO: load project messages
  }
}