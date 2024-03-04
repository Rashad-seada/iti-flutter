import 'package:get_it/get_it.dart';
import 'package:smart_soft/core/infrastructure/api/api.dart';
import 'package:smart_soft/core/infrastructure/services/image_picker_service.dart';
import 'package:smart_soft/core/usecases/validate_password_use_case.dart';
import 'package:smart_soft/core/usecases/validate_phone_use_case.dart';
import 'package:smart_soft/core/usecases/validate_text_use_case.dart';
import 'package:smart_soft/core/usecases/validate_username_use_case.dart';
import 'package:smart_soft/core/utils/token_helper.dart';
import 'package:smart_soft/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:smart_soft/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:smart_soft/features/auth/data/repo/auth_repo_impl.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';
import 'package:smart_soft/features/auth/domain/usecases/confirm_otp_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/delete_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_customer_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_seller_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/send_otp_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/login_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/set_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/update_user_use_case.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());
    getIt.registerSingleton<Api>(ApiImpl());
    getIt.registerSingleton<ImagePickerService>(ImagePickerServiceImpl());
    getIt.registerSingleton<TokenHelper>(TokenHelperImpl());

    //data source
    // ------ Auth ------
    getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
    getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());

    //repos
    // ------ Auth ------
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

    //use case
    // ------ Auth ------
    getIt.registerSingleton<LoginUseCase>(LoginUseCase());
    getIt.registerSingleton<RegisterSellerUseCase>(RegisterSellerUseCase());
    getIt.registerSingleton<RegisterCustomerUseCase>(RegisterCustomerUseCase());
    getIt.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
    getIt.registerSingleton<SendOtpUseCase>(SendOtpUseCase());
    getIt.registerSingleton<ConfirmOtpUseCase>(ConfirmOtpUseCase());

    // ----- User -----
    getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());
    getIt.registerSingleton<SetUserUseCase>(SetUserUseCase());
    getIt.registerSingleton<DeleteUserUseCase>(DeleteUserUseCase());
    getIt.registerSingleton<UpdateUserUseCase>(UpdateUserUseCase());

    // ----- Validation -----
    getIt.registerSingleton<ValidatePhoneUseCase>(ValidatePhoneUseCase());
    getIt.registerSingleton<ValidatePasswordUseCase>(ValidatePasswordUseCase());
    getIt.registerSingleton<ValidateUsernameUseCase>(ValidateUsernameUseCase());
    getIt.registerSingleton<ValidateTextUseCase>(ValidateTextUseCase());

  }


}

