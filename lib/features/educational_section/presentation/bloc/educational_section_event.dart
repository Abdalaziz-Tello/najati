part of 'educational_section_bloc.dart';

abstract class EducationalSectionEvent extends Equatable {
  const EducationalSectionEvent();

  @override
  List<Object> get props => [];
}

class GetAllStoriesEvent extends EducationalSectionEvent {}
