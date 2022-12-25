part of 'account_page_bloc.dart';

abstract class AccountPageEvent extends Equatable {
  const AccountPageEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfo extends AccountPageEvent {
  final String accessToken;

  const GetUserInfo({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}

class Signout extends AccountPageEvent {}
