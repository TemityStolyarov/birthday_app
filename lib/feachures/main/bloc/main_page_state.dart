part of 'main_page_bloc.dart';

abstract class MainPageState {
  bool isMenuWrapped = false;
  bool isEntertaimentsWrapped = true;
  MainPageState({
    required this.isMenuWrapped,
    required this.isEntertaimentsWrapped,
  });
}

class MainPageInitialState extends MainPageState {
  MainPageInitialState()
      : super(
          isMenuWrapped: false,
          isEntertaimentsWrapped: true,
        );
}

class MainPageWrapperChangedState extends MainPageState {
  MainPageWrapperChangedState(bool isMenuWrapped, bool isEntertaimentsWrapped)
      : super(
          isMenuWrapped: isMenuWrapped,
          isEntertaimentsWrapped: isEntertaimentsWrapped,
        );
}
