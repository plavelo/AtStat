import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user.g.dart';

Future<User> getUser(String userId) async {
  final String uri = 'https://kenkoooo.com/atcoder/atcoder-api/v2/user_info?user=$userId';
  final Response response = await get(uri);
  return User.fromJson(json.decode(response.body));
}

@JsonSerializable()
class User {
  const User(
    this.userId,
    this.acceptedCount,
    this.acceptedCountRank,
    this.ratedPointSum,
    this.ratedPointSumRank);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'accepted_count')
  final int acceptedCount;
  @JsonKey(name: 'accepted_count_rank')
  final int acceptedCountRank;
  @JsonKey(name: 'rated_point_sum')
  final double ratedPointSum;
  @JsonKey(name: 'rated_point_sum_rank')
  final int ratedPointSumRank;
}