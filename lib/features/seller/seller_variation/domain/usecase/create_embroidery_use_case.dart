
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/features/seller/seller_variation/domain/repo/seller_variation_repo.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';

class CreateEmbroideryUseCase {

  SellerVariationRepo repo = getIt<SellerVariationRepo>();

  Future<Either<Failure, void>> call({   required String token,   required String title,   required String description,   XFile? image, }) async {
    return await repo.createEmbroidery(token: token, title: title, description: description,image: image);
  }

}