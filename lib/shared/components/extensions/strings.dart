extension StringExtensions on String {
  String digitsOnly() => replaceAll(RegExp(r'\D'), '');

  String removeWhiteSpace() => replaceAll(RegExp(r'\s+'), '');
}
