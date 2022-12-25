part of 'inital_page_bloc.dart';

abstract class InitalPageEvent extends Equatable {
  const InitalPageEvent();

  @override
  List<Object> get props => [];
}

class Signin extends InitalPageEvent {}
