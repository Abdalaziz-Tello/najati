import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../models/child/create_child_response.dart';
import '../../../../models/child/get_children_response.dart';
import '../../domain/usecases/create_child_usecase.dart';
import '../../domain/usecases/get_children_usecase.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  final CreateChildUseCase createChildUseCase;
  final GetChildrenUseCase getChildrenUseCase;

  ChildrenBloc({
    required this.createChildUseCase,
    required this.getChildrenUseCase,
  }) : super(ChildrenInitial()) {
    on<CreateChildEvent>(_onCreateChild);
    on<GetChildrenEvent>(_onGetChildren);
  }

  Future<void> _onCreateChild(
    CreateChildEvent event,
    Emitter<ChildrenState> emit,
  ) async {
    emit(ChildrenLoading());

    final result = await createChildUseCase(
      name: event.name,
      gender: event.gender,
      birthDate: event.birthDate,
      imagePath: event.imagePath,
    );

    result.fold(
      (failure) => emit(ChildrenError(message: failure.message)),
      (child) => emit(ChildCreated(child: child)),
    );
  }

  Future<void> _onGetChildren(
    GetChildrenEvent event,
    Emitter<ChildrenState> emit,
  ) async {
    emit(ChildrenLoading());

    final result = await getChildrenUseCase();

    result.fold(
      (failure) => emit(ChildrenError(message: failure.message)),
      (children) => emit(ChildrenLoaded(children: children)),
    );
  }
}
