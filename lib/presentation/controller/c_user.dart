import 'package:get/get.dart';
import 'package:money_record/data/models/user.dart';

class CUser extends GetxController {
  final _data = User().obs;

  // NOTE: Getter
  User get data => _data.value;

  // NOTE: Setter
  setData(n) => _data.value = n;
}
