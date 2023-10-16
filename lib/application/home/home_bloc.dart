import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:exercise_app/domain/core/failures/main_failure.dart';
import 'package:exercise_app/domain/home/i_home_repo.dart';
import 'package:exercise_app/domain/home/models/home.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_bloc.freezed.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeState.initial()) {
    on<_GetHomeData>((event, emit) async{
      emit(
        state.copyWith(
          isLoading: true,
          failureorsuccess: none(),
        ),
      );
      print("test");
      final Either<MainFailure, List<Home>> homeOPtion =
          await homeRepo.getHomeData();
      log(homeOPtion.toString());
      
      print(homeOPtion.toString());
      emit(
        homeOPtion.fold(
          (failure) => state.copyWith(
            isLoading: false,
            failureorsuccess: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            homedata: success,
            failureorsuccess: Some(
              right(success),
            ),
          ),
        ),
      );
    });
  }
}
