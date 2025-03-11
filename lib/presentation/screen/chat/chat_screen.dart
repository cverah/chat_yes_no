import 'package:chat_app/domain/entity/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/share/message_box_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Anónimos X"),
        centerTitle: false,
        //leading al costado izquierdo
        //circleAvatar crear un avatar circular
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            //traer imágenes en linea con networks images
            backgroundImage: NetworkImage(
                "https://static1.squarespace.com/static/59e7ad0cd7bdce1a63515d5c/59ec29ba0abd04cc6dd7eede/63f7a78bdb3a6a1e75b4c146/1738423072188/avril-lavigne-059-5ad6296eab12ae40f66f78f5.jpg?format=1500w"),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context watch de chat_provider con esto traerá los datos de esa clase
    final chatProvider = context.watch<ChatProvider>();

    //safe area para que el widget no ocupe areas seguras de los controles que por defecto tiene el celular
    return SafeArea(
      //padding dar espacio hacia adentro
      child: Padding(
        //symmetric para que de espacios simétricamente tanto horizontal y vertical
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //para expandir el ancho disponible en el expand
            Expanded(
              child: ListView.builder(
                  //controlador del scroller
                  //llamar al controlador del chatScrollController
                  // se creo la conexión del scroll en el list view
                  controller: chatProvider.chatScrollController,
                  //se puede poner la cantidad de elementos que queremos
                  //ya tengo acceso a los datos que llenaremos en la clase ChatProvider con la variable chatProvider
                  itemCount: chatProvider.messageList.length,
                  //empezar a construir elementos
                  // impar mensajes del lado derecho par mensajes del lado izquierdo
                  itemBuilder: (context, index) {
                    //tomar el item de cada indice del array (en este caso lista en flutter) de la lista de mensajes
                    final message = chatProvider.messageList[index];
                    //estoy en el item del array y quiero comparar el mensaje si es enviado o es la respuesta
                    return message.fromWho == FromWho.incommingMessage
                        ? MyMessageBubble(message: message.text)
                        : const HerMessageBubble();
                  }),
            ),

            //aquí caja de texto
            //aquí recordar que según lo agregamos tiene un instanciar obligatoriamente con una función con nombre onValue
            //llamamos al método sendMessage que creamos en nuestro chat provider para que este lo agregue y sea visible en nuestro ListView
            MessageBoxField(
                // onValue: (value) => chatProvider.sendMessage(value)),
                onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
