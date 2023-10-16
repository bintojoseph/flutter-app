import 'package:freezed_annotation/freezed_annotation.dart';
part 'details.freezed.dart';
part 'details.g.dart';

@freezed
class Details with _$Details{
  const factory Details({
    @JsonKey(name: "idMeal") required String id,
    @JsonKey(name: "strMeal") required String title,
    @JsonKey(name: "strInstructions") required String recipe,
    @JsonKey(name: "strMealThumb") required String imgUrl,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
}