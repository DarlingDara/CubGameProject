import 'package:flutter_bloc/flutter_bloc.dart';

class CubePosition {
  double x;
  double y;
  CubePosition(this.x, this.y);
}

class PositionCubit extends Cubit<CubePosition> {
  PositionCubit() : super(CubePosition(0, 0));

  void changePosition(int newPox, int newPoy) {
    double x = state.x;
    double y = state.y;
    if (newPox > 0) {
      x = (x < 1) ? x + 1 : x;
    } else if (newPox < 0) {
      x = (x > -1) ? x - 1 : x;
    }
    if (newPoy > 0) {
      y = (y < 1) ? y + 1 : y;
    } else if (newPoy < 0) {
      y = (y > -1) ? y - 1 : y;
    }
    emit(CubePosition(x, y));
  }
}
