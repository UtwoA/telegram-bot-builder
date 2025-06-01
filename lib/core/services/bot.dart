class Bot {
  final String name;
  final String description;
  final String token;
  final bool status;
  final int messagesSent;

  Bot({
    required this.name,
    required this.description,
    required this.token,
    this.status = true, // по умолчанию активный
    this.messagesSent = 0,
  });

  Bot copyWith({
    String? name,
    String? description,
    String? token,
    bool? status,
  }) {
    return Bot(
      name: name ?? this.name,
      description: description ?? this.description,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }



}