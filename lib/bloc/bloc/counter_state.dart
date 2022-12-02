part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  late final int count = 0;
  @override
  List<Object?> get props => [count];
}

class CounterInitial extends CounterState {}

class CounterLoaded extends CounterState {
  final int count;

  CounterLoaded({required this.count});
}
