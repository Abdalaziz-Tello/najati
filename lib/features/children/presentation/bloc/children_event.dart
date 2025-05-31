part of 'children_bloc.dart';

abstract class ChildrenEvent extends Equatable {
  const ChildrenEvent();

  @override
  List<Object> get props => [];
}

class CreateChildEvent extends ChildrenEvent {
  final String name;
  final String gender;
  final String birthDate;
  final String imagePath;

  const CreateChildEvent({
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.imagePath,
  });

  @override
  List<Object> get props => [name, gender, birthDate, imagePath];
}

class GetChildrenEvent extends ChildrenEvent {}
