export 'pokemon_helpers.dart';

String formatNumberWithThreeDigits(int id) {
  String formattedNumber = id.toString();
  while (formattedNumber.length < 3) {
    formattedNumber = '0$formattedNumber';
  }

  return formattedNumber;
}
