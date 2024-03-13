import 'dart:math';

class MessageFront {
  String author;
  int createdAt;
  String id;
  String text;

  MessageFront({
    required this.author,
    required this.createdAt,
    required this.id,
    required this.text,
  });

  // Method to generate a random string for id
  // Replace this with your own method if you have one
  static String randomString({int length = 16}) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return String.fromCharCodes(Iterable.generate(
      length,
          (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

// Optionally, add JSON serialization/deserialization methods if needed
}
