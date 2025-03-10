// ignore: depend_on_referenced_packages
// مهم لتجنب المشاكل


// حالات الكيوبت
import 'package:flutter_bloc/flutter_bloc.dart';

class TasbihState {
  final int sobhan;
  final int alhamd;
  final int laaaelaha;
  final int alla;

  TasbihState({
    required this.sobhan,
    required this.alhamd,
    required this.laaaelaha,
    required this.alla,
  });

  // نسخ الحالة مع تغيير قيمة واحدة فقط
  TasbihState copyWith({
    int? sobhan,
    int? alhamd,
    int? laaaelaha,
    int? alla,
  }) {
    return TasbihState(
      sobhan: sobhan ?? this.sobhan,
      alhamd: alhamd ?? this.alhamd,
      laaaelaha: laaaelaha ?? this.laaaelaha,
      alla: alla ?? this.alla,
    );
  }
}

// كلاس الكيوبت لإدارة الحالات
class TasbihCubit extends Cubit<TasbihState> {
  TasbihCubit()
      : super(TasbihState(sobhan: 0, alhamd: 0, laaaelaha: 0, alla: 0));

  void incrementSobhan() => emit(state.copyWith(sobhan: state.sobhan + 1));
  void incrementAlhamd() => emit(state.copyWith(alhamd: state.alhamd + 1));
  void incrementLaaaelaha() =>
      emit(state.copyWith(laaaelaha: state.laaaelaha + 1));
  void incrementAlla() => emit(state.copyWith(alla: state.alla + 1));

  void reset() =>
      emit(TasbihState(sobhan: 0, alhamd: 0, laaaelaha: 0, alla: 0));
}


