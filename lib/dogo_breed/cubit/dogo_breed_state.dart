part of 'dogo_breed_cubit.dart';

sealed class DogoBreedState extends Equatable {
  final DogoBreedList dogoBreed;
  const DogoBreedState({
    this.dogoBreed = const DogoBreedList(breeds: []),
  });

  @override
  List<Object> get props => [dogoBreed];
}

final class DogoBreedInitial extends DogoBreedState {
  const DogoBreedInitial(
      {DogoBreedList dogoBreed = const DogoBreedList(breeds: [])})
      : super(dogoBreed: dogoBreed);
}

final class DogoBreedLoading extends DogoBreedState {
  const DogoBreedLoading(
      {DogoBreedList dogoBreed = const DogoBreedList(breeds: [])})
      : super(dogoBreed: dogoBreed);
}

final class DogoBreedSuccess extends DogoBreedState {
  const DogoBreedSuccess({
    required DogoBreedList dogoBreed,
  }) : super(dogoBreed: dogoBreed);
}

final class DogoBreedFailure extends DogoBreedState {
  const DogoBreedFailure(
      {DogoBreedList dogoBreed =
          const DogoBreedList(breeds: [], status: 'Error')})
      : super(dogoBreed: dogoBreed);
}
