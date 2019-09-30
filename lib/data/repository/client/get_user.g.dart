// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['user_id'] as String,
    json['accepted_count'] as int,
    json['accepted_count_rank'] as int,
    (json['rated_point_sum'] as num)?.toDouble(),
    json['rated_point_sum_rank'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'accepted_count': instance.acceptedCount,
      'accepted_count_rank': instance.acceptedCountRank,
      'rated_point_sum': instance.ratedPointSum,
      'rated_point_sum_rank': instance.ratedPointSumRank,
    };
