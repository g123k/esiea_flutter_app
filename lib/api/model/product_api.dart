import 'package:json_annotation/json_annotation.dart';
import 'package:untitled5/model/product.dart';

part 'product_api.g.dart';

@JsonSerializable()
class OFFServerResponse {
  @JsonKey(name: 'response')
  final OFFResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  OFFServerResponse(this.response, this.error);

  factory OFFServerResponse.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseToJson(this);
}

@JsonSerializable()
class OFFResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'altName')
  final String? altName;
  @JsonKey(name: 'barcode')
  final String barcode;
  @JsonKey(name: 'pictures')
  final OFFPictures? pictures;
  @JsonKey(name: 'quantity')
  final String? quantity;
  @JsonKey(name: 'brands')
  final List<String>? brands;
  @JsonKey(name: 'stores')
  final List<String>? stores;
  @JsonKey(name: 'countries')
  final List<String>? countries;
  @JsonKey(name: 'manufacturingCountries')
  final List<String>? manufacturingCountries;
  @JsonKey(name: 'nutriScore')
  final OFFNutriscore? nutriScore;
  @JsonKey(name: 'novaScore')
  final int? novaScore;
  @JsonKey(name: 'ecoScore')
  final int? ecoScore;
  @JsonKey(name: 'ecoScoreGrade')
  final String? ecoScoreGrade;
  @JsonKey(name: 'nutritionScore')
  final int? nutritionScore;
  @JsonKey(name: 'ingredients')
  final OFFIngredients? ingredients;
  @JsonKey(name: 'nutrientLevels')
  final OFFNutrientLevels? nutrientLevels;
  @JsonKey(name: 'nutritionFacts')
  final OFFNutritionFacts? nutritionFacts;
  @JsonKey(name: 'traces')
  final OFFTraces? traces;
  @JsonKey(name: 'additives')
  final Map<String, String>? additives;
  @JsonKey(name: 'allergens')
  final OFFAllergens? allergens;
  @JsonKey(name: 'packaging')
  final List<String>? packaging;
  @JsonKey(name: 'analysis')
  final OFFAnalysis? analysis;

  OFFResponse(
      this.name,
      this.altName,
      this.barcode,
      this.pictures,
      this.quantity,
      this.brands,
      this.stores,
      this.countries,
      this.manufacturingCountries,
      this.nutriScore,
      this.novaScore,
      this.ecoScore,
      this.ecoScoreGrade,
      this.nutritionScore,
      this.ingredients,
      this.nutrientLevels,
      this.nutritionFacts,
      this.traces,
      this.additives,
      this.allergens,
      this.packaging,
      this.analysis);

  factory OFFResponse.fromJson(Map<String, dynamic> json) =>
      _$OFFResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OFFResponseToJson(this);

  Product generateProduct() => Product(
        barcode: barcode,
        name: name,
        altName: altName,
        picture: pictures?.front,
        quantity: quantity,
        brands: brands,
        manufacturingCountries: manufacturingCountries,
        // TODO
        nutriScore: ProductNutriscore.A,
        novaScore: ProductNovaScore.Group1,
        ecoScore: ProductEcoScore.A,
        ingredients: ingredients?.list,
        traces: traces?.list,
        allergens: allergens?.list,
        additives: additives,
        nutrientLevels: nutrientLevels != null
            ? NutrientLevels(
                fat: nutrientLevels!.fat?.level,
                salt: nutrientLevels!.salt?.level,
                saturatedFat: nutrientLevels!.saturatedFat?.level,
                sugars: nutrientLevels!.sugars?.level,
              )
            : null,
        nutritionFacts: nutritionFacts != null
            ? NutritionFacts(
                servingSize: nutritionFacts!.servingSize,
                calories: nutritionFacts!.calories != null
                    ? Nutriment(
                        unit: nutritionFacts!.calories!.unit,
                        perServing: nutritionFacts!.calories!.perServing,
                      )
                    : null,
              )
            : null,
        ingredientsFromPalmOil: ingredients?.containsPalmOil,
      );
}

enum OFFNutriscore {
  @JsonValue('A')
  A,
  @JsonValue('B')
  B,
  @JsonValue('C')
  C,
  @JsonValue('D')
  D,
  @JsonValue('E')
  E,
}

@JsonSerializable()
class OFFPictures {
  @JsonKey(name: 'product')
  final String? product;
  @JsonKey(name: 'front')
  final String? front;
  @JsonKey(name: 'ingredients')
  final String? ingredients;
  @JsonKey(name: 'nutrition')
  final String? nutrition;

  OFFPictures(this.product, this.front, this.ingredients, this.nutrition);

  factory OFFPictures.fromJson(Map<String, dynamic> json) =>
      _$OFFPicturesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFPicturesToJson(this);
}

@JsonSerializable()
class OFFIngredients {
  @JsonKey(name: 'containsPalmOil')
  final bool containsPalmOil;
  @JsonKey(name: 'list')
  final List<String> list;
  @JsonKey(name: 'details')
  final List<OFFIngredientsDetails> details;

  OFFIngredients(this.containsPalmOil, this.list, this.details);

  factory OFFIngredients.fromJson(Map<String, dynamic> json) =>
      _$OFFIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$OFFIngredientsToJson(this);
}

@JsonSerializable()
class OFFIngredientsDetails {
  @JsonKey(name: 'vegan')
  final bool? vegan;
  @JsonKey(name: 'vegetarian')
  final bool? vegetarian;
  @JsonKey(name: 'containsPalmOil')
  final bool? containsPalmOil;
  @JsonKey(name: 'percent')
  final String? percent;
  @JsonKey(name: 'value')
  final String? value;

  OFFIngredientsDetails(
    this.vegan,
    this.vegetarian,
    this.containsPalmOil,
    this.percent,
    this.value,
  );

  factory OFFIngredientsDetails.fromJson(Map<String, dynamic> json) =>
      _$OFFIngredientsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OFFIngredientsDetailsToJson(this);
}

@JsonSerializable()
class OFFNutrientLevels {
  @JsonKey(name: 'fat')
  final OFFNutrientLevelItem? fat;
  @JsonKey(name: 'salt')
  final OFFNutrientLevelItem? salt;
  @JsonKey(name: 'saturatedFat')
  final OFFNutrientLevelItem? saturatedFat;
  @JsonKey(name: 'sugars')
  final OFFNutrientLevelItem? sugars;

  OFFNutrientLevels(this.fat, this.salt, this.saturatedFat, this.sugars);

  factory OFFNutrientLevels.fromJson(Map<String, dynamic> json) =>
      _$OFFNutrientLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$OFFNutrientLevelsToJson(this);
}

@JsonSerializable()
class OFFNutrientLevelItem {
  @JsonKey(name: 'level')
  final String level;
  @JsonKey(name: 'per100g')
  final int per100G;

  OFFNutrientLevelItem(this.level, this.per100G);

  factory OFFNutrientLevelItem.fromJson(Map<String, dynamic> json) =>
      _$OFFNutrientLevelItemFromJson(json);

  Map<String, dynamic> toJson() => _$OFFNutrientLevelItemToJson(this);
}

@JsonSerializable()
class OFFNutritionFacts {
  @JsonKey(name: 'servingSize')
  final String servingSize;
  @JsonKey(name: 'calories')
  final OFFNutritionFactsItem? calories;
  @JsonKey(name: 'fat')
  final OFFNutritionFactsItem? fat;
  @JsonKey(name: 'saturatedFat')
  final OFFNutritionFactsItem? saturatedFat;
  @JsonKey(name: 'carbohydrate')
  final OFFNutritionFactsItem? carbohydrate;
  @JsonKey(name: 'sugar')
  final OFFNutritionFactsItem? sugar;
  @JsonKey(name: 'fiber')
  final OFFNutritionFactsItem? fiber;
  @JsonKey(name: 'proteins')
  final OFFNutritionFactsItem? proteins;
  @JsonKey(name: 'sodium')
  final OFFNutritionFactsItem? sodium;
  @JsonKey(name: 'salt')
  final OFFNutritionFactsItem? salt;
  @JsonKey(name: 'energy')
  final OFFNutritionFactsItem? energy;

  OFFNutritionFacts(
    this.servingSize,
    this.calories,
    this.fat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugar,
    this.fiber,
    this.proteins,
    this.sodium,
    this.salt,
    this.energy,
  );

  factory OFFNutritionFacts.fromJson(Map<String, dynamic> json) =>
      _$OFFNutritionFactsFromJson(json);

  Map<String, dynamic> toJson() => _$OFFNutritionFactsToJson(this);
}

@JsonSerializable()
class OFFNutritionFactsItem {
  @JsonKey(name: 'unit')
  final String unit;
  @JsonKey(name: 'perServing')
  final String perServing;
  @JsonKey(name: 'per100g')
  final String per100G;

  OFFNutritionFactsItem(this.unit, this.perServing, this.per100G);

  factory OFFNutritionFactsItem.fromJson(Map<String, dynamic> json) =>
      _$OFFNutritionFactsItemFromJson(json);

  Map<String, dynamic> toJson() => _$OFFNutritionFactsItemToJson(this);
}

@JsonSerializable()
class OFFTraces {
  @JsonKey(name: 'list')
  final List<String> list;

  OFFTraces(this.list);

  factory OFFTraces.fromJson(Map<String, dynamic> json) =>
      _$OFFTracesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFTracesToJson(this);
}

@JsonSerializable()
class OFFAllergens {
  @JsonKey(name: 'list')
  final List<String> list;

  const OFFAllergens({
    this.list = const [],
  });

  factory OFFAllergens.fromJson(Map<String, dynamic> json) =>
      _$OFFAllergensFromJson(json);

  Map<String, dynamic> toJson() => _$OFFAllergensToJson(this);

  OFFAllergens copyWith({
    List<String>? list,
  }) {
    return OFFAllergens(
      list: list ?? this.list,
    );
  }
}

@JsonSerializable()
class OFFAnalysis {
  @JsonKey(name: 'palmOil')
  final String palmOil;
  @JsonKey(name: 'vegan')
  final String vegan;
  @JsonKey(name: 'vegetarian')
  final String vegetarian;

  OFFAnalysis(
    this.palmOil,
    this.vegan,
    this.vegetarian,
  );

  factory OFFAnalysis.fromJson(Map<String, dynamic> json) =>
      _$OFFAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$OFFAnalysisToJson(this);
}
