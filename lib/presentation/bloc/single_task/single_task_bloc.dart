import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_task_event.dart';
part 'single_task_state.dart';

class SingleTaskBloc extends Bloc<SingleTaskEvent, SingleTaskState> {
  SingleTaskBloc() : super(SingleTaskInitial()) {
    on<SingleTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
