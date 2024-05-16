import 'package:get/get.dart';
import 'package:hiero_job_seeker/presentation/welcome/welcome_screen.dart';

void splashtime() async {
  Future.delayed(
    const Duration(seconds: 4),
    () async {
      Get.off(() => const WelcomeScrn());
    },
  );
}
