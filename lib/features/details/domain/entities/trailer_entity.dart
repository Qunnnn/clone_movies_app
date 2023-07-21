import 'package:equatable/equatable.dart';

class TrailerEntity extends Equatable {
  final String id;
  const TrailerEntity({required this.id});
  @override
  List<Object?> get props => [id];

  factory TrailerEntity.empty() {
    return const TrailerEntity(
      id: ''
    );
  }
}
