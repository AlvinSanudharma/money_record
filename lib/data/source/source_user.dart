import 'package:d_info/d_info.dart';
import 'package:money_record/config/api.dart';
import 'package:money_record/config/app_request.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/data/models/user.dart';

class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';

    Map? responseBody =
        await AppRequest.posts(url, {'email': email, 'password': password});

    if (responseBody == null) return false;

    if (responseBody['success']) {
      var mapUser = responseBody['data'];

      Session.saveUser(User.fromJson(mapUser));
    } else {
      if (responseBody['message'] == 'Password salah') {
        DInfo.dialogError('Password yang anda masukan salah');
      } else {
        DInfo.dialogError('Gagal Login');
      }
      DInfo.closeDialog();
    }

    return responseBody['success'];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = '${Api.user}/register.php';

    Map? responseBody = await AppRequest.posts(url, {
      'name': name,
      'email': email,
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String()
    });

    if (responseBody == null) return false;

    if (responseBody['success']) {
      DInfo.dialogSuccess('Berhasil Register');
      DInfo.closeDialog();
    } else {
      if (responseBody['message'] == 'email') {
        DInfo.dialogError('Email sudah terdaftar');
      } else {
        DInfo.dialogError('Gagal Register');
      }
      DInfo.closeDialog();
    }

    return responseBody['success'];
  }
}
