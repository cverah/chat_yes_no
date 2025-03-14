import 'package:chat_app/domain/entity/message.dart';
import 'package:chat_app/infraestructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  // _ para que solo esta variable este disponible en esta clase
  final _dio = Dio();
  //método para la petición https

  //retorna una instancia de la clase Message
  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    //llamamos a nuestro model que mapeara la respuesta json
    //véase que de frente se llama al método y no a la instancia de constructor inicial
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //retornamos el mensaje
    // return Message(
    //     text: yesNoModel.answer,
    //     imageURL: yesNoModel.image,
    //     fromWho: FromWho.replyMessage);
    return yesNoModel.toEntity();
  }
}
