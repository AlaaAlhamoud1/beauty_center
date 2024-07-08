import 'package:beauty_center/application/authentication/models/user_model.dart';
import 'package:beauty_center/application/authentication/repository/auth_repository.dart';
import 'package:beauty_center/configure_di.dart';
import 'package:beauty_center/core/utils/common.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<LogInEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, user: null));
      await getIt<AuthRepo>()
          .logIn(phoneNumber: event.phoneNumber, password: event.password)
          .then((value) {
        if (value is UserModel) {
          emit(state.copyWith(user: value, isLoading: false));
        }
        EasyLoading.dismiss();
      }).catchError((e) {
        EasyLoading.dismiss();
        emit(
          state.copyWith(message: e.toString(), isLoading: false, user: null),
        );
        toast(e.toString());
      });
    });
  }
}
