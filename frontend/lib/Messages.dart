class Message {
  String message;
  String name;

  Message({required this.message, required this.name});

  // Optionally, you can add methods for serialization/deserialization
  // if you need to convert messages to/from JSON, for example.

  // Convert a Message instance to a Map. Useful for JSON serialization.
  Map<String, dynamic> toJson() => {
    'message': message,
    'name': name,
  };

  // Create a Message from a Map. Useful for JSON deserialization.
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'],
      name: json['name'],
    );
  }
}
