import 'package:flutter/cupertino.dart';

class ConfirmedCase {
  final String? ID;
  final String? Country;
  final int? TotalConfirmed;
  final int? TotalDeaths;
  final int? NewConfirmed;
  final int? NewDeaths;
  final int? NewRecovered;
  final int? TotalRecovered;

  ConfirmedCase({
    @required this.ID,
    @required this.Country,
    @required this.TotalConfirmed,
    this.TotalDeaths,
    this.NewConfirmed,
    this.NewDeaths,
    this.NewRecovered,
    this.TotalRecovered,
  });
}
