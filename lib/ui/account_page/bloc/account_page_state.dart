part of 'account_page_bloc.dart';

abstract class AccountPageState extends Equatable {
  const AccountPageState();

  @override
  List<Object> get props => [];
}

class Initial extends AccountPageState {}

class Loading extends AccountPageState {}

class UserInfoSucess extends AccountPageState {
  final User user;

  const UserInfoSucess({required this.user});
}

class UserInfoFail extends AccountPageState {}

class SignoutSuccess extends AccountPageState {}

class SignoutFail extends AccountPageState {}

