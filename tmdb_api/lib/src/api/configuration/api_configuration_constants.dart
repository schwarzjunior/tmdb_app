class TApiConfigurationLanguage {
  const TApiConfigurationLanguage._(this.index);

  final int index;

  static const TApiConfigurationLanguage en_US = TApiConfigurationLanguage._(0);

  static const TApiConfigurationLanguage pt_BR = TApiConfigurationLanguage._(1);

  static const List<TApiConfigurationLanguage> values = <TApiConfigurationLanguage>[
    en_US,
    pt_BR,
  ];

  static const List<String> _strValues = <String>[
    'en-US',
    'pt-BR',
  ];

  String get language => _strValues[index];
}

class TApiPosterSize {
  const TApiPosterSize._(this.index);

  final int index;

  static const TApiPosterSize w92 = TApiPosterSize._(0);

  static const TApiPosterSize w154 = TApiPosterSize._(1);

  static const TApiPosterSize w185 = TApiPosterSize._(2);

  static const TApiPosterSize w342 = TApiPosterSize._(3);

  static const TApiPosterSize w500 = TApiPosterSize._(4);

  static const TApiPosterSize w780 = TApiPosterSize._(5);

  static const TApiPosterSize original = TApiPosterSize._(6);

  static const List<TApiPosterSize> values = <TApiPosterSize>[
    w92,
    w154,
    w185,
    w342,
    w500,
    w780,
    original,
  ];

  static const List<String> _stringValues = <String>[
    'w92',
    'w154',
    'w185',
    'w342',
    'w500',
    'w780',
    'original',
  ];

  String get size => _stringValues[index];
}

class TApiBackdropSize {
  const TApiBackdropSize._(this.index);

  final int index;

  static const TApiBackdropSize w300 = TApiBackdropSize._(0);
  static const TApiBackdropSize w780 = TApiBackdropSize._(1);
  static const TApiBackdropSize w1280 = TApiBackdropSize._(2);
  static const TApiBackdropSize original = TApiBackdropSize._(3);

  static const List<TApiBackdropSize> values = <TApiBackdropSize>[
    w300,
    w780,
    w1280,
    original,
  ];

  static const List<String> _stringValues = <String>[
    'w300',
    'w780',
    'w1280',
    'original',
  ];

  String get size => _stringValues[index];
}

class TApiProfileSize {
  const TApiProfileSize._(this.index);

  final int index;

  static const TApiProfileSize w45 = TApiProfileSize._(0);
  static const TApiProfileSize w185 = TApiProfileSize._(1);
  static const TApiProfileSize h632 = TApiProfileSize._(2);
  static const TApiProfileSize original = TApiProfileSize._(3);

  static const List<TApiProfileSize> values = <TApiProfileSize>[
    w45,
    w185,
    h632,
    original,
  ];

  static const List<String> _stringValues = <String>[
    'w45',
    'w185',
    'h632',
    'original',
  ];

  String get size => _stringValues[index];
}

class TApiStillSize {
  const TApiStillSize._(this.index);

  final int index;

  static const TApiStillSize w92 = TApiStillSize._(0);
  static const TApiStillSize w185 = TApiStillSize._(1);
  static const TApiStillSize w300 = TApiStillSize._(2);
  static const TApiStillSize original = TApiStillSize._(3);

  static const List<TApiStillSize> values = <TApiStillSize>[
    w92,
    w185,
    w300,
    original,
  ];

  static const List<String> _stringValues = <String>[
    'w92',
    'w185',
    'w300',
    'original',
  ];

  String get size => _stringValues[index];
}

class TApiLogoSize {
  const TApiLogoSize._(this.index);

  final int index;

  static const TApiLogoSize w45 = TApiLogoSize._(0);
  static const TApiLogoSize w92 = TApiLogoSize._(1);
  static const TApiLogoSize w154 = TApiLogoSize._(2);
  static const TApiLogoSize w185 = TApiLogoSize._(3);
  static const TApiLogoSize w300 = TApiLogoSize._(4);
  static const TApiLogoSize w500 = TApiLogoSize._(5);
  static const TApiLogoSize original = TApiLogoSize._(6);

  static const List<TApiLogoSize> values = <TApiLogoSize>[
    w45,
    w92,
    w154,
    w185,
    w300,
    w500,
    original,
  ];

  static const List<String> _stringValues = <String>[
    'w45',
    'w92',
    'w154',
    'w185',
    'w300',
    'w500',
    'original',
  ];

  String get size => _stringValues[index];
}
