part of 'carousel_bloc.dart';

abstract class CarouselState {
  int index;
  CarouselState({required this.index});
}

class CarouselInitialState extends CarouselState {
  CarouselInitialState() : super(index: 0);
}

class CarouselSwapState extends CarouselState {
  CarouselSwapState(int index) : super(index: index);
}
