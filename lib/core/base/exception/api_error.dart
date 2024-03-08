class APIError {
  final List<String> messages;

  APIError({required this.messages});

  @override
  String toString() {
    return 'API Error:${messages.map((e) => '- $e').join('\n')}';
  }
}
