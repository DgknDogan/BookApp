import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            isChecked: false,
          ),
        );

  void onRememberButtonPressed(bool? value) {
    emit(state.copyWith(isChecked: value));
  }
}
