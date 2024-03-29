
import 'package:dartz/dartz.dart';
import 'package:smart_soft/features/variation/domain/repo/variation_repo.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/failure.dart';
import '../../data/entities/get_all_sellers_response.dart';

class GetSellersByLocationIdUseCase {

  VariationRepo repo = getIt<VariationRepo>();

  Future<Either<Failure, GetAllSellersResponse>> call(int id) async {
    return await repo.getSellersByLocationId(id);
  }

}