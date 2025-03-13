import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbihState {
  final int sobhan;
  final int alhamd;
  final int laaaelaha;
  final int alla;
  final bool showGraph;

  TasbihState({
    required this.sobhan,
    required this.alhamd,
    required this.laaaelaha,
    required this.alla,
    required this.showGraph,
  });

  TasbihState copyWith({
    int? sobhan,
    int? alhamd,
    int? laaaelaha,
    int? alla,
    bool? showGraph,
  }) {
    return TasbihState(
      sobhan: sobhan ?? this.sobhan,
      alhamd: alhamd ?? this.alhamd,
      laaaelaha: laaaelaha ?? this.laaaelaha,
      alla: alla ?? this.alla,
      showGraph: showGraph ?? this.showGraph,
    );
  }
}

class TasbihCubit extends Cubit<TasbihState> {
  TasbihCubit()
      : super(TasbihState(
          sobhan: 0,
          alhamd: 0,
          laaaelaha: 0,
          alla: 0,
          showGraph: false,
        )) {
    _loadCounters();
  }

  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(
      sobhan: prefs.getInt('sobhan') ?? 0,
      alhamd: prefs.getInt('alhamd') ?? 0,
      laaaelaha: prefs.getInt('laaaelaha') ?? 0,
      alla: prefs.getInt('alla') ?? 0,
    ));
  }

  Future<void> _updateCounter(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  void incrementCounter(String key) {
    int newValue = _getCounterValue(key) + 1;
    switch (key) {
      case 'sobhan':
        emit(state.copyWith(sobhan: newValue));
        break;
      case 'alhamd':
        emit(state.copyWith(alhamd: newValue));
        break;
      case 'laaaelaha':
        emit(state.copyWith(laaaelaha: newValue));
        break;
      case 'alla':
        emit(state.copyWith(alla: newValue));
        break;
    }
    _updateCounter(key, newValue);

    if (newValue % 100 == 0) {
      _showDialogIfNeeded(newValue, key);
    }
  }

  void resetCounters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(TasbihState(
      sobhan: 0,
      alhamd: 0,
      laaaelaha: 0,
      alla: 0,
      showGraph: state.showGraph,
    ));
  }

  void toggleGraph() {
    emit(state.copyWith(showGraph: !state.showGraph));
  }

  int _getCounterValue(String key) {
    switch (key) {
      case 'sobhan':
        return state.sobhan;
      case 'alhamd':
        return state.alhamd;
      case 'laaaelaha':
        return state.laaaelaha;
      case 'alla':
        return state.alla;
      default:
        return 0;
    }
  }

  void _showDialogIfNeeded(int value, String key) {
    print("🎉 تهانينا لقد وصلت إلى $value من $key");
  }
}
