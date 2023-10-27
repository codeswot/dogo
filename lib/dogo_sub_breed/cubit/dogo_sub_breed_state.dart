part of 'dogo_sub_breed_cubit.dart';

sealed class DogoSubBreedState extends Equatable {
  final DogoSubBreedList dogoSubBreed;

  const DogoSubBreedState(
      {this.dogoSubBreed = const DogoSubBreedList(subBreeds: [])});
  @override
  List<Object> get props => [];
}

final class DogoSubBreedInitial extends DogoSubBreedState {
  const DogoSubBreedInitial(
      {DogoSubBreedList dogoSubBreed = const DogoSubBreedList(subBreeds: [])})
      : super(dogoSubBreed: dogoSubBreed);
}

final class DogoSubBreedLoading extends DogoSubBreedState {
  const DogoSubBreedLoading(
      {DogoSubBreedList dogoSubBreed = const DogoSubBreedList(subBreeds: [])})
      : super(dogoSubBreed: dogoSubBreed);
}

final class DogoSubBreedSuccess extends DogoSubBreedState {
  const DogoSubBreedSuccess({
    required DogoSubBreedList dogoSubBreed,
  }) : super(dogoSubBreed: dogoSubBreed);
}

final class DogoSubBreedFailure extends DogoSubBreedState {
  const DogoSubBreedFailure(
      {DogoSubBreedList dogoSubBreed =
          const DogoSubBreedList(subBreeds: [], status: 'Error')})
      : super(dogoSubBreed: dogoSubBreed);
}
