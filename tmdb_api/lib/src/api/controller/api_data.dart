part of 'api_controller.dart';

class TApiData {
  final String apiKey;
  bool includeAdult;
  TApiConfigurationLanguage language;
  TApiPosterSize posterSize;
  TApiBackdropSize backdropSize;
  TApiProfileSize profileSize;
  TApiStillSize stillSize;
  TApiLogoSize logoSize;

  TApiData({
    @required this.apiKey,
    @required this.includeAdult,
    this.language = TApiConfigurationLanguage.en_US,
    this.posterSize = TApiPosterSize.w342,
    this.backdropSize = TApiBackdropSize.w300,
    this.profileSize = TApiProfileSize.w185,
    this.stillSize = TApiStillSize.w300,
    this.logoSize = TApiLogoSize.w300,
  });
}
