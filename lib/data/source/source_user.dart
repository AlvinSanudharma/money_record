import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
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
    }

    return responseBody['success'];
  }

  static Future<bool> register(
      context, String name, String email, String password) async {
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
      DInfo.dialogSuccess(context, 'Berhasil Register');
      DInfo.closeDialog(context);
    } else {
      if (responseBody['message'] == 'email') {
        DInfo.dialogError(context, 'Email sudah terdaftar');
      } else {
        DInfo.dialogError(context, 'Gagal Register');
      }
      DInfo.closeDialog(context);
    }

    return responseBody['success'];
  }
}
