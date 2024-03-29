
import 'package:dartz/dartz.dart';
import 'package:smart_soft/features/variation/domain/repo/variation_repo.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/failure.dart';
import '../../data/entities/get_all_sellers_response.dart';

class GetAllSellersUseCase {

  VariationRepo repo = getIt<VariationRepo>();

  Future<Either<Failure, GetAllSellersResponse>> call() async {
    return await repo.getAllSellers();
  }

}