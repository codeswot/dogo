part of 'dogo_cubit.dart';

class DogoState extends Equatable {
  final Dogo dogo;

  const DogoState({
    this.dogo = const Dogo(
      url: '',
    ),
  });

  @override
  List<Object?> get props => [dogo];
}

class DogoInitial extends DogoState {
  const DogoInitial({Dogo dogo = const Dogo(url: '')}) : super(dogo: dogo);
}

class DogoLoading extends DogoState {
  const DogoLoading({Dogo dogo = const Dogo(url: '')}) : super(dogo: dogo);
}

class DogoSuccess extends DogoState {
  const DogoSuccess({required Dogo dogo}) : super(dogo: dogo);
}

class DogoFailure extends DogoState {
  const DogoFailure({Dogo dogo = const Dogo(url: '')}) : super(dogo: dogo);
}
