import 'package:get/get.dart';

class MainController extends GetxController{
  var currentPage = 0.obs;

  currentPageOnChange(int index){
    currentPage.value = index;
  }
}