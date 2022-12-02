import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<LoadCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(CounterLoaded(count: 1));
    });
    on<CounterIncrement>((event, emit) {
      if (state is CounterLoaded) {
        final state = this.state as CounterLoaded;
        int c = event.count + 1;
        emit(CounterLoaded(count: c));
      }
    });
    on<CounterDecrement>((event, emit) {
      if (state is CounterLoaded) {
        final state = this.state as CounterLoaded;
        int c = event.count - 1;
        emit(CounterLoaded(count: c));
      }
    });
  }
}
