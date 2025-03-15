import 'package:get/get.dart';

class PasswordController extends GetxController{

  RxBool show=true.obs;

  void showPassword(){
    show.value=!show.value;
  }
}