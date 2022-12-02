part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class LoadCounter extends CounterEvent {}

class CounterIncrement extends CounterEvent {
  final int count;

  const CounterIncrement(this.count);
  @override
  List<Object> get props => [count];
}

class CounterDecrement extends CounterEvent {
  final int count;

  const CounterDecrement(this.count);
  @override
  List<Object> get props => [count];
}
