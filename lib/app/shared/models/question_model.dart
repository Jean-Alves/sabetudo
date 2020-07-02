import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'botoes_model.dart';

class QuestionModel {
  String categoria;
  String texto;
  String image;
  List<BotoesModel> botoes;
  QuestionModel({
    this.categoria,
    this.texto,
    this.image,
    this.botoes,
  });

  QuestionModel copyWith({
    String categoria,
    String texto,
    String image,
    List<BotoesModel> botoes,
  }) {
    return QuestionModel(
      categoria: categoria ?? this.categoria,
      texto: texto ?? this.texto,
      image: image ?? this.image,
      botoes: botoes ?? this.botoes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoria': categoria,
      'texto': texto,
      'image': image,
      'botoes': botoes?.map((x) => x?.toMap())?.toList(),
    };
  }

  static QuestionModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuestionModel(
      categoria: map['categoria'],
      texto: map['texto'],
      image: map['image'],
      botoes: List<BotoesModel>.from(
          map['botoes']?.map((x) => BotoesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static QuestionModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel(categoria: $categoria, texto: $texto, image: $image, botoes: $botoes)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionModel &&
        o.categoria == categoria &&
        o.texto == texto &&
        o.image == image &&
        listEquals(o.botoes, botoes);
  }

  @override
  int get hashCode {
    return categoria.hashCode ^
        texto.hashCode ^
        image.hashCode ^
        botoes.hashCode;
  }
}
