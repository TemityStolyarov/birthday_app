import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitialState()) {
    on<MainPageMenuWrapperChangedEvent>((event, emit) {
      emit(MainPageWrapperChangedState(
        state.isMenuWrapped = !state.isMenuWrapped,
        state.isEntertaimentsWrapped,
      ));
    });

    on<MainPageEntertaimentsWrapperChangedEvent>((event, emit) {
      emit(MainPageWrapperChangedState(
        state.isMenuWrapped,
        state.isEntertaimentsWrapped = !state.isEntertaimentsWrapped,
      ));
    });
  }
}
