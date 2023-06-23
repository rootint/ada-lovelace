part of 'single_task_bloc.dart';

abstract class SingleTaskState extends Equatable {
  const SingleTaskState();
  
  @override
  List<Object> get props => [];
}

class SingleTaskInitial extends SingleTaskState {}
