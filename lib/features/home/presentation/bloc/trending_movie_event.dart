import 'package:equatable/equatable.dart';

abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();

  @override
  List<Object> get props => [];
}

class LoadTrendingMovie extends TrendingMovieEvent {
  final String timeWindow;
  const LoadTrendingMovie({required this.timeWindow});
    @override
  List<Object> get props => [timeWindow];
}
