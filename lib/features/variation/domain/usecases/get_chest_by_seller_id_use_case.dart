
import 'package:dartz/dartz.dart';
import 'package:smart_soft/features/variation/data/entities/get_chest_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_collar_response.dart';
import 'package:smart_soft/features/variation/data/entities/get_fabric_response.dart';
import 'package:smart_soft/features/variation/domain/repo/variation_repo.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/failure.dart';
import '../../data/entities/get_all_sellers_response.dart';

class GetChestBySellerIdUseCase {

  VariationRepo repo = getIt<VariationRepo>();

  Future<Either<Failure, GetChestResponse>> call(int id) async {
    return await repo.getChestBySellerId(id);
  }

}