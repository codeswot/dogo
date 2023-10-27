import 'package:deliveristo_challenge/dogo/cubit/dogo_cubit.dart';
import 'package:deliveristo_challenge/dogo/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogoView extends StatefulWidget {
  const DogoView({Key? key}) : super(key: key);

  @override
  State<DogoView> createState() => _DogoViewState();
}

class _DogoViewState extends State<DogoView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: BlocBuilder<DogoCubit, DogoState>(
        builder: (context, state) {
          if (state is DogoLoading) {
            return const DogoLoadingWidget();
          } else if (state is DogoSuccess) {
            return DogoSuccessWidget(state.dogo.url);
          } else if (state is DogoFailure) {
            //setup error later
            return const DogoFailureWidget('an error occured');
          }
          return const DogoEmptyWidget();
        },
      ),
    );
  }
}
