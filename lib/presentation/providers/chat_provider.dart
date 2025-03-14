import 'package:chat_app/domain/entity/message.dart';
import 'package:chat_app/helpers/get_yes_no_answer.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  //lista de mensaje en nuestro ListView
  //List en dart es cun array solo que tiene el nombre de List en vez de array
  //lista de la clase Message o en español seria message es una variable de arreglo de la Clase Message
  List<Message> messageList = [
    // Message(text: "Hola buen dia", fromWho: FromWho.incommingMessage),
    // Message(text: "estas bien", fromWho: FromWho.incommingMessage),
  ];

  //controlador de scroll del ListView sera de tipo ScrollController
  final ScrollController chatScrollController = ScrollController();

  //instanciar la clase GetYesNoAnswer
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  //método para enviar Message
  //Future tipo de dato para una función que es para peticiones asíncronas
  //Future necesita async await
  Future<void> sendMessage(String text) async {
    //validación de mensajes vacíos
    if (text.isEmpty) return;

    //para verificar si el mensaje es un pregunta
    if (text.endsWith("?")) {
      sendReply();
    }

    //ingresara un nuevo mensaje como escribir desde la caja de texto el mensaje es mio
    final newMessage = Message(text: text, fromWho: FromWho.incommingMessage);
    //agregar a la lista de message para que renderice
    messageList.add(newMessage);

    //para que actualice los cambios en caliente en provider
    notifyListeners();
    //luego de renderizar la imagen que haga esta función que es mover el scroll abajo
    moveScrollController();
  }

  Future<void> moveScrollController() async {
    //tiempo de espera para que luego mueva el scroll
    await Future.delayed(const Duration(milliseconds: 100));

    //usaremos la propiedad animateTo
    chatScrollController.animateTo(
        //ofsset a donde quieres mover el scroll
        //que se vaya el scroll hasta el el máximo de abajo
        chatScrollController.position.maxScrollExtent,
        //la duración de la animación para mover el scroll
        duration: const Duration(milliseconds: 300),
        //curve es el tipo de animación que queremos cunado se mueva el scroll
        //curves.easeOut es una animación
        curve: Curves.easeOut);
  }

  Future<void> sendReply() async {
    // llamamos al método
    final replyMessage = await getYesNoAnswer.getAnswer();
    //agregamos al ListView
    messageList.add(replyMessage);
    //notificamos los cambios
    notifyListeners();
    //método para que se baje el scroll hasta abajo en el ListView
    moveScrollController();
  }
}
