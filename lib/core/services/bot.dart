class Bot {
  final String name;
  final String description;
  final String token;
  bool status;
  bool used;
  final int messagesSent;

  Bot({
    required this.name,
    required this.description,
    required this.token,
    this.status = false, // по умолчанию активный
    this.messagesSent = 0,
    this.used = false,
  });

  Bot copyWith({
    String? name,
    String? description,
    String? token,
    bool? status,
    bool used = false,
  }) {
    return Bot(
      used: used,
      name: name ?? this.name,
      description: description ?? this.description,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }
}
