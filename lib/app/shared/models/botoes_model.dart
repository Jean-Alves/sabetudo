import 'dart:convert';

class BotoesModel {
  String text;
  bool isCorrect;
  BotoesModel(
    this.text,
    this.isCorrect,
  );

  BotoesModel copyWith({
    String text,
    bool isCorrect,
  }) {
    return BotoesModel(
      text ?? this.text,
      isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isCorrect': isCorrect,
    };
  }

  static BotoesModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BotoesModel(
      map['text'],
      map['isCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  static BotoesModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'BotoesModel(text: $text, isCorrect: $isCorrect)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BotoesModel && o.text == text && o.isCorrect == isCorrect;
  }

  @override
  int get hashCode => text.hashCode ^ isCorrect.hashCode;
}
