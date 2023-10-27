import 'package:bloc/bloc.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:equatable/equatable.dart';

part 'dogo_sub_breed_state.dart';

class DogoSubBreedCubit extends Cubit<DogoSubBreedState> {
  DogoSubBreedCubit(this._repo) : super(const DogoSubBreedInitial());
  final DogoRepository _repo;

  Future<void> getDogoSubBreed(String breed) async {
    emit(const DogoSubBreedLoading());
    await _repo.getSubBreedsByBreed(breed).then((dogoSubBreed) {
      emit(DogoSubBreedSuccess(dogoSubBreed: dogoSubBreed));
    }).catchError(
      (e) {
        emit(const DogoSubBreedFailure());
      },
    );
  }
}
