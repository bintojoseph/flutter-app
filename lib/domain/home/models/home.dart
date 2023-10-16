import 'package:freezed_annotation/freezed_annotation.dart';

part 'home.freezed.dart';
part 'home.g.dart';

@freezed
class Home with _$Home{
  const factory Home({
    @JsonKey(name: "idMeal") required String id,
    @JsonKey(name: "strMeal") required String title,
    @JsonKey(name: "strCategory") required String category,
    @JsonKey(name: "strMealThumb") required String imgUrl,
  }) = _Home;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}