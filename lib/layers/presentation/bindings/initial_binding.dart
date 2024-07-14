import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/external/datasource/jobs_datasource_impl.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/shared/http_client_adapter.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    _bindSearchUserController();
  }

  void _bindSearchUserController() {
    Get.lazyPut<JobsDatasource>(
      () => JobsDatasourceImpl(HttpClientAdapter()),
    );
    Get.lazyPut<JobsRepository>(
      () => JobsRepositoryImpl(Get.find()),
    );
    Get.lazyPut<JobsUsecase>(
      () => JobsUsecaseImpl(Get.find(), JobFormatter()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find(),
      ),
    );
  }
}
