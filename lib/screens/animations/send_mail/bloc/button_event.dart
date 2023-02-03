part of 'button_bloc.dart';

@immutable
abstract class ButtonEvent {}

// class InitialEvent extends ButtonEvent {}
class SendEvent extends ButtonEvent {}

class CompletedEvent extends ButtonEvent {}

class ResetEvent extends ButtonEvent {}
