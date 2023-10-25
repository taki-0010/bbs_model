import 'package:model/model.dart';

class MalData {
  late String _clientId;
  String get clientId => _clientId;
  MalData._internal();
  static final MalData instance = MalData._internal();
  factory MalData() => instance;
  void set(final String value) => _clientId = value;
  bool get error => clientId == ConstantsDataBase.notFound;
}
