part of 'carousel_bloc.dart';

abstract class CarouselEvent {
  int index;
  CarouselEvent(this.index);
}

class CarouselSwapEvent extends CarouselEvent {
  CarouselSwapEvent(super.index);

}
