import 'package:get/get.dart';

class ExploreController extends GetxController {
  List<String> _likedList = [];

  List<String> get likedList => _likedList;

  void setLikedList(String value) {
    if (_likedList.contains(value)) {
      _likedList.remove(value);
    } else {
      _likedList.add(value);
    }
    update();
  }
}
