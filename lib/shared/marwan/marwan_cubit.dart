import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'marwan_state.dart';

class MarwanCubit extends Cubit<MarwanState> {
  MarwanCubit() : super(MarwanInitial());
  static MarwanCubit get(context) => BlocProvider.of(context);
  int i=0;
  void iPlus(){
    i++;
    emit(MarwanPlus());
  }
   void iMinimize(){
    if(i==0){
      print('sss');
    }
    else{
      i--;
    }

    emit(MarwanMinimize());
  }
  
}
