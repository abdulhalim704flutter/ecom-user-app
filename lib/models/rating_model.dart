import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@unfreezed
class RatingModel with _$RatingModel{

  factory RatingModel({
    required String userId,
    required double rating,

}) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json)=>
      _$RatingModelFromJson(json);
}