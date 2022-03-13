import 'package:get/get.dart';
import 'package:mental_health/data/repo/addAvailabilityRepo.dart';
import 'package:mental_health/data/repo/avialabiltirepo.dart';
import 'package:mental_health/models/addAvailabilityModel.dart';
import 'package:mental_health/models/avalabilitymodel.dart';

enum Status { INITIAL, LOADING, ERROR, COMPLETE }

class ShowTimesController extends GetxController {
  Rx<Status> getAvailabilityApiResponse = Status.INITIAL.obs;
  Rx<AvailabiltiyModel> getAvailabilityData = AvailabiltiyModel().obs;
  Rx<Status> addAvailabilityApiResponse = Status.INITIAL.obs;

  Future<AvailabiltiyModel> getAvailability() async {
    getAvailabilityApiResponse = Status.LOADING.obs;
    update();
    try {
      AvailabiltiyModel response = await Avalabilityrepo.avialabilityRepo();
      getAvailabilityApiResponse = Status.COMPLETE.obs;
      getAvailabilityData = response.obs;
    } catch (e) {
      print('getAvailabilityApiResponse Error :$e');
      getAvailabilityApiResponse = Status.ERROR.obs;
    }
    update();
  }

  Future<AddAvailabilityResponseModel> addAvailability(
      List<Map<String, dynamic>> body) async {
    addAvailabilityApiResponse = Status.LOADING.obs;
    update();
    try {
      AddAvailabilityResponseModel response =
          await AddAvailabilityRepo.addAvailability(body);
      await getAvailability();
      addAvailabilityApiResponse = Status.COMPLETE.obs;
    } catch (e) {
      print('addAvailabilityApiResponse Error :$e');
      addAvailabilityApiResponse = Status.ERROR.obs;
    }
    update();
  }

  RxBool _isDeleteStatus = false.obs;

  RxBool get isDeleteStatus => _isDeleteStatus;

  void setIsDeleteStatus(bool value) {
    _isDeleteStatus = value.obs;
    update();
  }

  RxList _radioStatusList = [].obs;

  RxList get radioStatusList => _radioStatusList;

  void setRadioStatusList({String value, int index}) {
    getAvailabilityData.value.availability[index]['availability_status'] =
        value;
    update();
  }

  RxList _deleteStatusList = [].obs;

  RxList get deleteStatusList => _deleteStatusList;

  void setDeleteStatusMap(String value) {
    if (_deleteStatusList.contains(value)) {
      _deleteStatusList.remove(value);
    } else {
      _deleteStatusList.add(value);
    }
    update();
  }

  void clearDeleteStatus() {
    _deleteStatusList.clear();
    update();
  }

  void clearRadioStatus() {
    _deleteStatusList.clear();
    update();
  }
}
