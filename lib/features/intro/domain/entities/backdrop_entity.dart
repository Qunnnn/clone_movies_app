import 'package:equatable/equatable.dart';

class BackDropEntity extends Equatable {
  final String backdropPath;
  const BackDropEntity({required this.backdropPath});
  @override
  List<Object?> get props => [backdropPath];
}
