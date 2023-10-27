import 'package:bloc/bloc.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:equatable/equatable.dart';

part 'dogo_breed_state.dart';

class DogoBreedCubit extends Cubit<DogoBreedState> {
  DogoBreedCubit(this._repo) : super(const DogoBreedInitial());
  final DogoRepository _repo;

  Future<void> getDogoBreed() async {
    emit(const DogoBreedLoading());
    await _repo.getBreeds().then((dogoBreed) {
      emit(DogoBreedSuccess(dogoBreed: dogoBreed));
    }).catchError((e) {
      emit(const DogoBreedFailure());
    });
  }
}
