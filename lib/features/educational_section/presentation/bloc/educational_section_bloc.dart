import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/educational_section/get_all_stories_response.dart';
import '../../domain/usecases/get_all_stories_usecase.dart';

part 'educational_section_event.dart';
part 'educational_section_state.dart';

class EducationalSectionBloc
    extends Bloc<EducationalSectionEvent, EducationalSectionState> {
  final GetAllStoriesUseCase getAllStoriesUseCase;

  EducationalSectionBloc({required this.getAllStoriesUseCase})
    : super(EducationalSectionInitial()) {
    on<GetAllStoriesEvent>(_onGetAllStories);
  }

  Future<void> _onGetAllStories(
    GetAllStoriesEvent event,
    Emitter<EducationalSectionState> emit,
  ) async {
    emit(EducationalSectionLoading());

    final result = await getAllStoriesUseCase();

    result.fold(
      (failure) => emit(EducationalSectionError(message: failure.message)),
      (stories) => emit(EducationalSectionLoaded(stories: stories)),
    );
  }
}
