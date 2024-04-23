class PokemonHelpers {
  PokemonHelpers._();

  static String formatNumberWithThreeDigits(String id) {
    return id.padLeft(3, '0');
  }

  static String formatTitle(String input) {
    List<String> words = input.split(RegExp(r'[\s-]'));

    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return '';
    }).toList();

    final formattedTitle = words.join(' ');

    return formattedTitle;
  }
}
