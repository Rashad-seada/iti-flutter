import 'package:get_it/get_it.dart';
import '../core_feature/domain/usecases/validate_password_use_case.dart';
import '../core_feature/domain/usecases/validate_phone_use_case.dart';
import '../core_feature/domain/usecases/validate_sizes_use_case.dart';
import '../core_feature/domain/usecases/validate_text_use_case.dart';
import '../core_feature/domain/usecases/validate_username_use_case.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());

    // ----- Validation -----
    getIt.registerSingleton<ValidatePhoneUseCase>(ValidatePhoneUseCase());
    getIt.registerSingleton<ValidatePasswordUseCase>(ValidatePasswordUseCase());
    getIt.registerSingleton<ValidateUsernameUseCase>(ValidateUsernameUseCase());
    getIt.registerSingleton<ValidateTextUseCase>(ValidateTextUseCase());
    getIt.registerSingleton<ValidateSizesUseCase>(ValidateSizesUseCase());

  }


}

