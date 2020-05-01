import 'package:equatable/equatable.dart';

enum TMediaType { movie, tv, person, other }

enum TGender { female, male, other }

enum TTrendingMediaType { all, movie, tv, person }

abstract class TObject extends Equatable {}

abstract class TMediaObject extends TObject {
  TMediaObject(this.id);

  final int id;
}
