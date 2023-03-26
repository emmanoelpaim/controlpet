import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is Register) {
        if (event.userName.isEmpty || event.password.isEmpty) {
          emit(RegisterError());
        } else {
          emit(RegisterLoading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(RegisterLoaded(event.userName));
          });
        }
      }
    });
  }
}
