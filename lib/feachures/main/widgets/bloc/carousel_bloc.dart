import 'package:flutter_bloc/flutter_bloc.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitialState()) {
    on<CarouselSwapEvent>((event, emit) {
      emit(CarouselSwapState(event.index));
      //state.index,
    });
  }
}
