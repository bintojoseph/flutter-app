part of 'details_bloc.dart';

@freezed
class DetailsEvent with _$DetailsEvent{
  const factory DetailsEvent.getDetails({required int id}) = _GetDetails;
}
