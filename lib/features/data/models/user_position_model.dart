import '../../domain/entities/position.dart';
import '../../domain/entities/user_position.dart';
import 'position_model.dart';

class UserPositionModel extends UserPosition {
  const UserPositionModel({
    required double checkingAccountAmount,
    required List<Position> positions,
    required double consolidated,
  }) : super(
          consolidated: consolidated,
          checkingAccountAmount: checkingAccountAmount,
          positions: positions,
        );

  factory UserPositionModel.fromJson(Map<String, dynamic> json) {
    return UserPositionModel(
        consolidated: json['consolidated'],
        checkingAccountAmount: json['checkingAccountAmount'],
        positions: (json['positions'] as List)
            .map((e) => PositionModel.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'consolidated': consolidated,
      'checkingAccountAmount': checkingAccountAmount,
      'positions': positions,
    };
  }
}
