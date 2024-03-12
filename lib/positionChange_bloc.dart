import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePostion extends Bloc<ChangeEvent, Alignment>
{
  final position1 = Alignment.topLeft;
  int pox = 1;
  int poy = 1;
  pox = newPox = newPox.clamp(1, 3);
  poy = newPoy = newPoy.clamp(1, 3);
  ChangePostion(): super(Alignment.topLeft){
    on<ChangeTop>(_onTop);
    on<ChangeBottom>(_onBottom);
    on<ChangeLeft>(_onLeft);
    on<ChangeRight>(_onRight);
  }
  _onTop(ChangeTop event, Emitter<Alignment>, emit){
    emit()
}
}

abstract class ChangeEvent{}
class ChangeTop extends ChangeEvent{}
class ChangeBottom extends ChangeEvent{}
class ChangeLeft extends ChangeEvent{}
class ChangeRight extends ChangeEvent{}