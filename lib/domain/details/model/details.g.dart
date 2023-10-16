// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailsImpl _$$DetailsImplFromJson(Map<String, dynamic> json) =>
    _$DetailsImpl(
      id: json['idMeal'] as String,
      title: json['strMeal'] as String,
      recipe: json['strInstructions'] as String,
      imgUrl: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$$DetailsImplToJson(_$DetailsImpl instance) =>
    <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.title,
      'strInstructions': instance.recipe,
      'strMealThumb': instance.imgUrl,
    };
