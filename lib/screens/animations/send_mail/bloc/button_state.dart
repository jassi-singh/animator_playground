part of 'button_bloc.dart';

@immutable
abstract class ButtonState {}

class InitialState extends ButtonState {}

class LoadingState extends ButtonState {}

class CompletedState extends ButtonState {}
