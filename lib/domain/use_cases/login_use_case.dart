import '../repos/auth_repo/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;
  LoginUseCase(this.repo);
  bool execute(String email, String password){
    repo.login(email, password);
    return true;
  }
}