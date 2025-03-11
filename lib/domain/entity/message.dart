// incommingMessage -> mensaje entrante
// replyMessage -> mensaje de respuesta
enum FromWho { incommingMessage, replyMessage }

class Message {
  final String text;
  //opcional
  final String? imageURL;
  final FromWho fromWho;

  //al instanciar la clase que tenga este constructor inicial
  Message({required this.text, this.imageURL, required this.fromWho});
}
