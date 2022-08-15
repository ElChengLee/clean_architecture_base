
import 'package:core/core/core_view_model.dart';
import 'package:core/service/toast_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../common/routes/router.gr.dart';

@Injectable()
class LoginViewModel extends CoreViewModel {

  final LoginUseCase _loginUseCase;
  final ToastService _toastService;

  String _userName = "";
  String _password = "";

  LoginViewModel(this._loginUseCase, this._toastService);

  void onLoginButtonPressed() async {
    loading();

    final result = await _loginUseCase.performLogin(
        LoginRequestModel(username: _userName, password: _password));
    result.when(
      success: (data) => navigationService.pushAndRemoveUntil(HomeScreenRoute()),
      error: (errorType, message) => _toastService.show(msg: message),
    );

    loaded(result.isSuccessful);
  }

  void updateUserName(String username) {
    _userName = username;
  }

  void updatePassword(String password) {
    _password = password;
  }
}