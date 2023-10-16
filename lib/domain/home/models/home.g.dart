// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeImpl _$$HomeImplFromJson(Map<String, dynamic> json) => _$HomeImpl(
      id: json['idMeal'] as String,
      title: json['strMeal'] as String,
      category: json['strCategory'] as String,
      imgUrl: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$$HomeImplToJson(_$HomeImpl instance) =>
    <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.title,
      'strCategory': instance.category,
      'strMealThumb': instance.imgUrl,
    };
