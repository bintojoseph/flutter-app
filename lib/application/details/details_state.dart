part of 'details_bloc.dart';

@freezed
class DetailsState with _$DetailsState{
  const factory DetailsState({
    required List<Details> details,
    required Option<Either<MainFailure, List<Details>>> failureorsuccess,
  }) = _DetailsState;

  factory DetailsState.initial() => const DetailsState(details: [],failureorsuccess: None());
}
