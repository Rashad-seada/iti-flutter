import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_sleeve_by_seller_id_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/entities/hand_entity.dart';
import '../../../domain/usecases/get_chest_by_seller_id_use_case.dart';
import '../variation/variation_cubit.dart';

part 'sleeve_state.dart';

class SleeveCubit extends Cubit<SleeveState> {
  SleeveCubit() : super(SleeveInitial());

  int sleeveId = -1;


  getSleeve(BuildContext context){
    emit(SleeveIsLoading());
    getIt<GetSleeveBySellerIdUseCase>().call(context.read<VariationCubit>().selectedSellerId).then(
            (value) => value.fold(
            (error) {
              emit(SleeveError(error));
            },
            (success) {
              emit(SleeveSuccess(success.obj ?? []));

            }
        ));
  }

  void onSleeveTap(int sleeveId, BuildContext context) {
    this.sleeveId = sleeveId;
    context.read<VariationCubit>().onSleeveNextClick(context);
  }
}
