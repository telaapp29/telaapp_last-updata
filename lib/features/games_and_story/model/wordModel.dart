class WordModel {
  final String name;
  final String value;
  bool accepting;

  WordModel({required this.name, required this.value, this.accepting = false});
}

class WordModel2 {
  final String name; // The Arabic word or label
  final String value; // The unique identifier for matching (e.g., file name or identifier)
  final String image; // The path to the image asset
  bool accepting; // Indicates whether the target is accepting a dragged item

  WordModel2({
    required this.name,
    required this.value,
    required this.image,
    this.accepting = false,
  });
}
