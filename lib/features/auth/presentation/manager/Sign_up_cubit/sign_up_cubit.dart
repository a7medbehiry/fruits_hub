import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
