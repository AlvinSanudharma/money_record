import 'package:get/get.dart';

class CLogin extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(n) {
    _isLoading = n;

    update();
  }
}
