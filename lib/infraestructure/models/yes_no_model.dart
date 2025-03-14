// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:chat_app/domain/entity/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  // Método para que se mapee el mensaje y lo retornemos directo el Message
  Message toEntity() => Message(
        text: answer == "yes" ? "Si" : "No",
        imageURL: image,
        fromWho: FromWho.replyMessage,
      );
}
