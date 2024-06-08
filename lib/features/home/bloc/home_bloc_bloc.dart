import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeEvent, HomeState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeEvent>((event, emit) {
     
    });
  }
}
