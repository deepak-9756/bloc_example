import 'package:flutter_bloc/flutter_bloc.dart';

part 'counterbloc_event.dart';
part 'counterbloc_state.dart';

class CounterblocBloc extends Bloc<CounterblocEvent, CounterblocState> {
  CounterblocBloc() : super(CounterblocState(0)) {
    on<IncrementCounter>((event, emit) {
      emit(CounterblocState(state.counter + 1));
    });
    on<DecrementCounter>((event, emit) {
      emit(CounterblocState(state.counter - 1));
    });
  }
}
