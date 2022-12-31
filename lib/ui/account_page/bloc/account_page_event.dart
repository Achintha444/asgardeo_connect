part of 'account_page_bloc.dart';

abstract class AccountPageEvent extends Equatable {
  const AccountPageEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfo extends AccountPageEvent {
  final AuthorizationTokenResponse authorizationTokenResponse;

  const GetUserInfo({required this.authorizationTokenResponse});

  @override
  List<Object> get props => [authorizationTokenResponse];
}

class Signout extends AccountPageEvent {}
