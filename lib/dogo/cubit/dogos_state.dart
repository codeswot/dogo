part of 'dogos_cubit.dart';

sealed class DogosState extends Equatable {
  const DogosState({
    this.dogos = const DogosList(
      urls: [],
    ),
  });
  final DogosList dogos;

  @override
  List<Object> get props => [dogos];
}

final class DogosInitial extends DogosState {
  const DogosInitial({DogosList dogos = const DogosList(urls: [])})
      : super(dogos: dogos);
}

final class DogosLoading extends DogosState {
  const DogosLoading({DogosList dogos = const DogosList(urls: [])})
      : super(dogos: dogos);
}

final class DogosSuccess extends DogosState {
  const DogosSuccess({required DogosList dogos}) : super(dogos: dogos);
}

final class DogosFailure extends DogosState {
  const DogosFailure({DogosList dogos = const DogosList(urls: [])})
      : super(dogos: dogos);
}
