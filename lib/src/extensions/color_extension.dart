part of utility;

/* extension HexColorExtension on String {
  Color get color {
    String hexColor = this;
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) hexColor = "FF" + hexColor;

    try {
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      return null;
    }
  }
} */

/* extension ColorExtension on Color {
  String get toHex {
    if (this == null) return null;
    return '#${this?.value?.toRadixString(16)?.substring(2, 8)}';
  }
}
 */