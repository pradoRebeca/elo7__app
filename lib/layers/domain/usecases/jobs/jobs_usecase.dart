import 'package:elo7_app/layers/shared/response_presentation.dart';

abstract class JobsUsecase {
  Future<ResponsePresentation> call(String? query);
}
