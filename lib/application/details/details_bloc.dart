import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:exercise_app/domain/core/failures/main_failure.dart';
import 'package:exercise_app/domain/details/i_details_repo.dart';
import 'package:exercise_app/domain/details/model/details.dart';
import 'package:exercise_app/domain/home/models/home.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_bloc.freezed.dart';

part 'details_event.dart';
part 'details_state.dart';

@Injectable()
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final IDetailsRepo detailsRepo;
  DetailsBloc(this.detailsRepo) : super(DetailsState.initial()) {
    on<_GetDetails>((event, emit) async{
      print("test");
      final Either<MainFailure, List<Details>> homeOPtion =
          await detailsRepo.getDetails(id: event.id);
      log(homeOPtion.toString());
      
      print(homeOPtion.toString());
      emit(
        homeOPtion.fold(
          (failure) => state.copyWith(
            failureorsuccess: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            details: success,
            failureorsuccess: Some(
              right(success),
            ),
          ),
        ),
      );
    });
  }
}
