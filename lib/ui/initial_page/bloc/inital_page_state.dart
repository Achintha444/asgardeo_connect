part of 'inital_page_bloc.dart';

abstract class InitalPageState extends Equatable {
  const InitalPageState();
  
  @override
  List<Object> get props => [];
}

class Initial extends InitalPageState {}

class Loading extends InitalPageState {}

class SigninSuccess extends InitalPageState {}

class SigninFail extends InitalPageState {}
