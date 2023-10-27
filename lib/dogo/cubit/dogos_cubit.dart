import 'package:bloc/bloc.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:equatable/equatable.dart';

part 'dogos_state.dart';

class DogosCubit extends Cubit<DogosState> {
  DogosCubit(this._repo) : super(const DogosInitial());
  final DogoRepository _repo;

  Future<void> getDogos({String? breed, String? subBreed}) async {
    try {
      if (breed != null && subBreed != null) {
        await _getDogosBySubBreed(breed, subBreed);
      } else if (breed != null) {
        await _getDogosByBreed(breed);
      }
    } catch (e) {
      emit(const DogosFailure());
    }
  }

  Future<void> _getDogosByBreed(String breed) async {
    _emitLoading();
    final dogos = await _repo.getDogosByBreed(breed);
    _emitSuccess(dogos);
  }

  Future<void> _getDogosBySubBreed(String breed, String subBreed) async {
    _emitLoading();
    final dogos = await _repo.getDogosByBreedAndSubBreed(
        breed: breed, subBreed: subBreed);
    _emitSuccess(dogos);
  }

  void _emitLoading() {
    emit(const DogosLoading());
  }

  void _emitSuccess(DogosList dogos) {
    emit(DogosSuccess(dogos: dogos));
  }
}
