part of 'top_trends_bloc.dart';

abstract class TopTrendsEvent extends Equatable {
  const TopTrendsEvent();

  @override
  List<Object> get props => [];
}

class GetTopTrendsEvent extends TopTrendsEvent {}