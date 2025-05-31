part of 'educational_section_bloc.dart';

abstract class EducationalSectionState extends Equatable {
  const EducationalSectionState();

  @override
  List<Object> get props => [];
}

class EducationalSectionInitial extends EducationalSectionState {}

class EducationalSectionLoading extends EducationalSectionState {}

class EducationalSectionLoaded extends EducationalSectionState {
  final GetAllStoriesResponse stories;

  const EducationalSectionLoaded({required this.stories});

  @override
  List<Object> get props => [stories];
}

class EducationalSectionError extends EducationalSectionState {
  final String message;

  const EducationalSectionError({required this.message});

  @override
  List<Object> get props => [message];
}
