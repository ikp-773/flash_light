import 'package:get/get.dart';
import 'package:torch_controller/torch_controller.dart';

class BulbController extends GetxController {
  RxBool flashState = false.obs;
  final torchController = TorchController();

  @override
  void onInit() async {
    torchController.initialize();
    flashState.value = (await torchController.isTorchActive)!;
    super.onInit();
  }

  switchState() async {
    flashState.value = (await torchController.toggle())!;
  }
}
