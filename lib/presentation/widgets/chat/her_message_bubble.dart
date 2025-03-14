import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  final String? imageURL;
  const HerMessageBubble({super.key, required this.message, this.imageURL});

  @override
  Widget build(BuildContext context) {
    // busca el tema dentro del contexto
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: color.secondary, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(
          height: 5,
        ),
        //TODO IMAGE
        _ImageNetwork(imageURL!),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

class _ImageNetwork extends StatelessWidget {
  final String imageURL;

  const _ImageNetwork(this.imageURL);

  @override
  Widget build(BuildContext context) {
    //sacar las dimensiones del dispositivo Movil
    final size = MediaQuery.of(context).size;
    //print("dimensiones del dispositivo móvil $size");

    return ClipRRect(
      //bored redondeando en imagen
      borderRadius: BorderRadius.circular(8),
      child: Image.network(imageURL,
          //ocupar el 70% del total de la dimension
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          // builder que significa que se ejecuta en ejecucion
          loadingBuilder: (context, child, loadingProgress) {
        // si hay imagen que retorne
        if (loadingProgress == null) return child;
        // sino que muestre este widget
        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: const Text("...Cargando imagen"),
        );
      }),
    );
  }
}
