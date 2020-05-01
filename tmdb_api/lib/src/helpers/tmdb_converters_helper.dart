import 'package:tmdb_api/src/models/base/base.dart';

abstract class TConvertersHelper {
  static DateTime dateTimeFromString(String value) {
    return DateTime.tryParse(value ?? '');
  }

  static String dateTimeToString(DateTime dateTime) {
    return dateTime == null
        ? ''
        : '${_padZeros(dateTime.year, 4)}'
            '-${_padZeros(dateTime.month)}'
            '-${_padZeros(dateTime.day)}';
  }

  static TMediaType mediaTypeFromString(String value) {
    switch (value) {
      case 'movie':
        return TMediaType.movie;
      case 'tv':
        return TMediaType.tv;
      case 'person':
        return TMediaType.person;
      default:
        return TMediaType.other;
    }
  }

  static String mediaTypeToString(TMediaType type) {
    switch (type) {
      case TMediaType.movie:
        return 'movie';
      case TMediaType.tv:
        return 'tv';
      case TMediaType.person:
        return 'person';
      case TMediaType.other:
      default:
        return 'other';
    }
  }

  static TGender genderFromInt(int value) {
    switch (value) {
      case 1:
        return TGender.female;
      case 2:
        return TGender.male;
      default:
        return TGender.other;
    }
  }

  static int genderToInt(TGender gender) {
    switch (gender) {
      case TGender.female:
        return 1;
      case TGender.male:
        return 2;
      case TGender.other:
      default:
        return 0;
    }
  }

  static String _padZeros(num value, [int size = 2]) {
    return value == null ? '' : value.toString().padLeft(size, '0');
  }
}
