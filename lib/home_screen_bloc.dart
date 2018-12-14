import 'package:flutter_bloc_example/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends BlocBase {
  final _isCheckedController = BehaviorSubject<bool>();

  Stream<bool> get isCheckedStream => _isCheckedController.stream;

  Function(bool) get updateIsChecked => _isCheckedController.sink.add;

  @override
  void dispose() {
    _isCheckedController.close();
  }

// There is a place for any logic and transformations.
// Nothing have to be in HomeScreen, only values that comes as stream from StreamBuilder

}
