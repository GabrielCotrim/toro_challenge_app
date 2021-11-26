import 'package:equatable/equatable.dart';

import 'position.dart';

class UserPosition extends Equatable {
  final double checkingAccountAmount;
  final List<Position> positions;
  final double consolidated;

  const UserPosition({
    required this.checkingAccountAmount,
    required this.consolidated,
    required this.positions,
  });

  @override
  List<Object?> get props => [checkingAccountAmount, consolidated, positions];
}
