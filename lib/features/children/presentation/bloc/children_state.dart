part of 'children_bloc.dart';

abstract class ChildrenState extends Equatable {
  const ChildrenState();

  @override
  List<Object> get props => [];
}

class ChildrenInitial extends ChildrenState {}

class ChildrenLoading extends ChildrenState {}

class ChildCreated extends ChildrenState {
  final CreateChildResponse child;

  const ChildCreated({required this.child});

  @override
  List<Object> get props => [child];
}

class ChildrenLoaded extends ChildrenState {
  final GetChildrenResponse children;

  const ChildrenLoaded({required this.children});
}

class ChildrenError extends ChildrenState {
  final String message;


  const ChildrenError({required this.message});

  @override
  List<Object> get props => [message];
}
