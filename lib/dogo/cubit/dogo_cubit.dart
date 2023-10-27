import 'package:bloc/bloc.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:equatable/equatable.dart';

part 'dogo_state.dart';

class DogoCubit extends Cubit<DogoState> {
  DogoCubit(this._repo) : super(const DogoInitial());
  final DogoRepository _repo;

  Future<void> getDogo({String? breed, String? subBreed}) async {
    try {
      if (breed == null && subBreed == null) {
        await _fetchRandomDogo();
      } else if (breed != null && subBreed == null) {
        await _fetchDogoByBreed(breed);
      } else if (breed != null && subBreed != null) {
        await _fetchDogoBySubBreed(breed, subBreed);
      }
    } catch (e) {
      _emitDogoFailure();
    }
  }

  Future<void> _fetchRandomDogo() async {
    _emitDogoLoading();
    final dogo = await _repo.getRandomDogo();
    _emitDogoSuccess(dogo);
  }

  Future<void> _fetchDogoByBreed(String breed) async {
    _emitDogoLoading();
    final dogo = await _repo.getRandomDogoByBreed(breed);
    _emitDogoSuccess(dogo);
  }

  Future<void> _fetchDogoBySubBreed(String breed, String subBreed) async {
    _emitDogoLoading();
    final dogo = await _repo.getRandomDogoByBreedAndSubBreed(
        breed: breed, subBreed: subBreed);
    _emitDogoSuccess(dogo);
  }

  void _emitDogoLoading() {
    emit(const DogoLoading());
  }

  void _emitDogoSuccess(Dogo dogo) {
    emit(DogoSuccess(dogo: dogo));
  }

  void _emitDogoFailure() {
    emit(const DogoFailure());
  }
}
