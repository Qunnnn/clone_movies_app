import 'package:equatable/equatable.dart';

class UpComingMovieEntity extends Equatable {
  final String backdropPath;
  final String posterPath;
    final String title;
  const UpComingMovieEntity({required this.backdropPath , required this.posterPath , required this.title});
  @override
  List<Object?> get props => [backdropPath, posterPath,title];
}
