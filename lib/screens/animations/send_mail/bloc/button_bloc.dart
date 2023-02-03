import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(InitialState()) {
    on<ButtonEvent>((event, emit) {
      if (event is SendEvent) {
        emit(LoadingState());
      } else if (event is CompletedEvent) {
        emit(CompletedState());
      } else if (event is ResetEvent) {
        emit(InitialState());
      }
    });
  }
}
