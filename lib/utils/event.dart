import 'package:vector_math/hash.dart';
///Data контейнер с возможностью единоразового использования содержания
class Event<T> {
  final T _data;
  bool _isHadled = false;
  Event(this._data);

  ///Возвращает [_data] только по первому вызову
  T get dataIfNotHandled {
    if (!_isHadled) {
      _isHadled = true;
      return _data;
    } else
      return null;
  }

  ///Возвращает [_data] не зависимо от предыдующих вызовов
  T get data => _data;

  @override
  bool operator ==(other) => (other is Event<T>)&&(other.hashCode == hashCode);

  @override

  @override
  int get hashCode => hashObjects([_isHadled, _data]);


}