import 'package:equatable/equatable.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/login_controller/login_controller.dart';

part 'inital_page_event.dart';
part 'inital_page_state.dart';

class InitalPageBloc extends Bloc<InitalPageEvent, InitalPageState> {
  InitalPageBloc() : super(Initial()) {
    on<Signin>((event, emit) async {
      emit(Loading());

      try {
        final AuthorizationTokenResponse? response =
            await LoginController.loginAction();

        if (response is AuthorizationResponse) {
          emit(SigninSuccess());
        } else {
          emit(SigninFail());
        }
      } catch (e) {
        emit(SigninFail());
      }
    });
  }
}
