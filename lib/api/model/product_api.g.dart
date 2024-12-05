// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponse _$OFFServerResponseFromJson(Map<String, dynamic> json) =>
    OFFServerResponse(
      OFFResponse.fromJson(json['response'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$OFFServerResponseToJson(OFFServerResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'error': instance.error,
    };

OFFResponse _$OFFResponseFromJson(Map<String, dynamic> json) => OFFResponse(
      json['name'] as String?,
      json['altName'] as String?,
      json['barcode'] as String,
      json['pictures'] == null
          ? null
          : OFFPictures.fromJson(json['pictures'] as Map<String, dynamic>),
      json['quantity'] as String?,
      (json['brands'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['stores'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['countries'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['manufacturingCountries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      $enumDecodeNullable(_$OFFNutriscoreEnumMap, json['nutriScore']),
      (json['novaScore'] as num?)?.toInt(),
      (json['ecoScore'] as num?)?.toInt(),
      json['ecoScoreGrade'] as String?,
      (json['nutritionScore'] as num?)?.toInt(),
      json['ingredients'] == null
          ? null
          : OFFIngredients.fromJson(
              json['ingredients'] as Map<String, dynamic>),
      json['nutrientLevels'] == null
          ? null
          : OFFNutrientLevels.fromJson(
              json['nutrientLevels'] as Map<String, dynamic>),
      json['nutritionFacts'] == null
          ? null
          : OFFNutritionFacts.fromJson(
              json['nutritionFacts'] as Map<String, dynamic>),
      json['traces'] == null
          ? null
          : OFFTraces.fromJson(json['traces'] as Map<String, dynamic>),
      (json['additives'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['allergens'] == null
          ? null
          : OFFAllergens.fromJson(json['allergens'] as Map<String, dynamic>),
      (json['packaging'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['analysis'] == null
          ? null
          : OFFAnalysis.fromJson(json['analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OFFResponseToJson(OFFResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'altName': instance.altName,
      'barcode': instance.barcode,
      'pictures': instance.pictures,
      'quantity': instance.quantity,
      'brands': instance.brands,
      'stores': instance.stores,
      'countries': instance.countries,
      'manufacturingCountries': instance.manufacturingCountries,
      'nutriScore': _$OFFNutriscoreEnumMap[instance.nutriScore],
      'novaScore': instance.novaScore,
      'ecoScore': instance.ecoScore,
      'ecoScoreGrade': instance.ecoScoreGrade,
      'nutritionScore': instance.nutritionScore,
      'ingredients': instance.ingredients,
      'nutrientLevels': instance.nutrientLevels,
      'nutritionFacts': instance.nutritionFacts,
      'traces': instance.traces,
      'additives': instance.additives,
      'allergens': instance.allergens,
      'packaging': instance.packaging,
      'analysis': instance.analysis,
    };

const _$OFFNutriscoreEnumMap = {
  OFFNutriscore.A: 'A',
  OFFNutriscore.B: 'B',
  OFFNutriscore.C: 'C',
  OFFNutriscore.D: 'D',
  OFFNutriscore.E: 'E',
};

OFFPictures _$OFFPicturesFromJson(Map<String, dynamic> json) => OFFPictures(
      json['product'] as String?,
      json['front'] as String?,
      json['ingredients'] as String?,
      json['nutrition'] as String?,
    );

Map<String, dynamic> _$OFFPicturesToJson(OFFPictures instance) =>
    <String, dynamic>{
      'product': instance.product,
      'front': instance.front,
      'ingredients': instance.ingredients,
      'nutrition': instance.nutrition,
    };

OFFIngredients _$OFFIngredientsFromJson(Map<String, dynamic> json) =>
    OFFIngredients(
      json['containsPalmOil'] as bool,
      (json['list'] as List<dynamic>).map((e) => e as String).toList(),
      (json['details'] as List<dynamic>)
          .map((e) => OFFIngredientsDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OFFIngredientsToJson(OFFIngredients instance) =>
    <String, dynamic>{
      'containsPalmOil': instance.containsPalmOil,
      'list': instance.list,
      'details': instance.details,
    };

OFFIngredientsDetails _$OFFIngredientsDetailsFromJson(
        Map<String, dynamic> json) =>
    OFFIngredientsDetails(
      json['vegan'] as bool?,
      json['vegetarian'] as bool?,
      json['containsPalmOil'] as bool?,
      json['percent'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$OFFIngredientsDetailsToJson(
        OFFIngredientsDetails instance) =>
    <String, dynamic>{
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
      'containsPalmOil': instance.containsPalmOil,
      'percent': instance.percent,
      'value': instance.value,
    };

OFFNutrientLevels _$OFFNutrientLevelsFromJson(Map<String, dynamic> json) =>
    OFFNutrientLevels(
      json['fat'] == null
          ? null
          : OFFNutrientLevelItem.fromJson(json['fat'] as Map<String, dynamic>),
      json['salt'] == null
          ? null
          : OFFNutrientLevelItem.fromJson(json['salt'] as Map<String, dynamic>),
      json['saturatedFat'] == null
          ? null
          : OFFNutrientLevelItem.fromJson(
              json['saturatedFat'] as Map<String, dynamic>),
      json['sugars'] == null
          ? null
          : OFFNutrientLevelItem.fromJson(
              json['sugars'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OFFNutrientLevelsToJson(OFFNutrientLevels instance) =>
    <String, dynamic>{
      'fat': instance.fat,
      'salt': instance.salt,
      'saturatedFat': instance.saturatedFat,
      'sugars': instance.sugars,
    };

OFFNutrientLevelItem _$OFFNutrientLevelItemFromJson(
        Map<String, dynamic> json) =>
    OFFNutrientLevelItem(
      json['level'] as String,
      (json['per100g'] as num).toInt(),
    );

Map<String, dynamic> _$OFFNutrientLevelItemToJson(
        OFFNutrientLevelItem instance) =>
    <String, dynamic>{
      'level': instance.level,
      'per100g': instance.per100G,
    };

OFFNutritionFacts _$OFFNutritionFactsFromJson(Map<String, dynamic> json) =>
    OFFNutritionFacts(
      json['servingSize'] as String,
      json['calories'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['calories'] as Map<String, dynamic>),
      json['fat'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(json['fat'] as Map<String, dynamic>),
      json['saturatedFat'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['saturatedFat'] as Map<String, dynamic>),
      json['carbohydrate'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['carbohydrate'] as Map<String, dynamic>),
      json['sugar'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['sugar'] as Map<String, dynamic>),
      json['fiber'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['fiber'] as Map<String, dynamic>),
      json['proteins'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['proteins'] as Map<String, dynamic>),
      json['sodium'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['sodium'] as Map<String, dynamic>),
      json['salt'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['salt'] as Map<String, dynamic>),
      json['energy'] == null
          ? null
          : OFFNutritionFactsItem.fromJson(
              json['energy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OFFNutritionFactsToJson(OFFNutritionFacts instance) =>
    <String, dynamic>{
      'servingSize': instance.servingSize,
      'calories': instance.calories,
      'fat': instance.fat,
      'saturatedFat': instance.saturatedFat,
      'carbohydrate': instance.carbohydrate,
      'sugar': instance.sugar,
      'fiber': instance.fiber,
      'proteins': instance.proteins,
      'sodium': instance.sodium,
      'salt': instance.salt,
      'energy': instance.energy,
    };

OFFNutritionFactsItem _$OFFNutritionFactsItemFromJson(
        Map<String, dynamic> json) =>
    OFFNutritionFactsItem(
      json['unit'] as String,
      json['perServing'] as String,
      json['per100g'] as String,
    );

Map<String, dynamic> _$OFFNutritionFactsItemToJson(
        OFFNutritionFactsItem instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'perServing': instance.perServing,
      'per100g': instance.per100G,
    };

OFFTraces _$OFFTracesFromJson(Map<String, dynamic> json) => OFFTraces(
      (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OFFTracesToJson(OFFTraces instance) => <String, dynamic>{
      'list': instance.list,
    };

OFFAllergens _$OFFAllergensFromJson(Map<String, dynamic> json) => OFFAllergens(
      list:
          (json['list'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$OFFAllergensToJson(OFFAllergens instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

OFFAnalysis _$OFFAnalysisFromJson(Map<String, dynamic> json) => OFFAnalysis(
      json['palmOil'] as String,
      json['vegan'] as String,
      json['vegetarian'] as String,
    );

Map<String, dynamic> _$OFFAnalysisToJson(OFFAnalysis instance) =>
    <String, dynamic>{
      'palmOil': instance.palmOil,
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
    };
