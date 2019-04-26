import 'package:aqueduct/aqueduct.dart';

class Fabricante extends ManagedObject<_Fabricante> implements _Fabricante {}

class _Fabricante {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

}