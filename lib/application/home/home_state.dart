part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required List<Home> homedata,
    required Option<Either<MainFailure, List<Home>>> failureorsuccess,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        isLoading: false,
        homedata: [],
        failureorsuccess: None(),
      );
}
