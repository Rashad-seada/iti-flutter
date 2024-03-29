import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_fabric_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/views/bloc/variation/variation_cubit.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/entities/fabric_entity.dart';

part 'fabric_state.dart';

class FabricCubit extends Cubit<FabricState> {
  FabricCubit() : super(FabricInitial());

  int fabricId = -1;


  getFabric(BuildContext context){
    emit(FabricIsLoading());
    getIt<GetFabricBySellerIdUseCase>().call(context.read<VariationCubit>().selectedSellerId).then(
            (value) => value.fold(
            (error) {
              emit(FabricError(error));

            },
            (success) {
              emit(FabricSuccess(success.obj ?? []));
            }
        ));
  }

  void onFabricCardTap(int fabricId, BuildContext context) {
    this.fabricId = fabricId;
    context.read<VariationCubit>().onFabricNextClick(context);
  }

}
