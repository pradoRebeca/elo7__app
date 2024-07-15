import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/external/datasource/jobs_datasource_impl.dart';
import 'package:elo7_app/layers/external/datasource/section_data_datasouce_impl.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/shared/http_client_adapter.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    _bindSectionDataController();
    _bindJobsController();
  }

  void _bindSectionDataController() {
    Get.lazyPut<SectionDataDatasource>(
      () => SectionDataDatasouceImpl(),
    );
    Get.lazyPut<SectionDataRepositoy>(
      () => SectionDataRepositoryImpl(Get.find()),
    );
    Get.lazyPut<SectionDataUsecase>(
      () => SectionDataUsecaseImpl(
        Get.find(),
      ),
    );
  }

  void _bindJobsController() {
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
        Get.find(),
      ),
    );
  }
}
