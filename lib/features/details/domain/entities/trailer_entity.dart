import 'package:equatable/equatable.dart';

class TrailerEntity extends Equatable {
  final String key;
  const TrailerEntity({required this.key});
  @override
  List<Object?> get props => [key];

  factory TrailerEntity.empty() {
    return const TrailerEntity(
      key: ''
    );
  }
}
