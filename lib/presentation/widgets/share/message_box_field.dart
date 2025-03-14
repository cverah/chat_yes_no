import 'package:flutter/material.dart';

class MessageBoxField extends StatelessWidget {
  //atributo de una función para que devuelva un valor de tipo string
  //valor requerido obligatoriamente
  final ValueChanged<String> onValue;
  const MessageBoxField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //limpiador de texto
    final textController = TextEditingController();

    //focus del texto
    final focusNode = FocusNode();

    final color = Theme.of(context).colorScheme;
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: color.primary),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
      //que este lleno
      filled: true,
      //que aparezca un icono
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          //sacar el valor del texto
          final textValue = textController.value.text;
          //borramos el texto asimismo ya por default lo mantiene el focus luego de ser borrado no es necesario el focusNode
          textController.clear();
          //mandamos el valor aquí
          //recordar que onValue tiene el tipo de dato de una función
          onValue(textValue);
        },
      ),
      //bordes redondeados
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      //como un place holder
      hintText: 'Escribe un mensaje que termine con "?"',
    );

    return Column(
      children: [
        TextFormField(
          decoration: inputDecoration,
          //agregar control de texto
          controller: textController,
          //iniciamos focus en textformfield
          focusNode: focusNode,
          //operaciones

          onFieldSubmitted: (value) => {
            //borrar el texto cuando haga enter
            textController.clear(),
            //mantener el foco en el texto luego del enter
            focusNode.requestFocus(),
            //aquí también mandamos el valor
            // el value de onFieldSubmit tiene el valor de lo que se ingresa en la caja de texto
            onValue(value),
          },

          //cuando haga click fuera del input text
          onTapOutside: (event) => {
            //perder le focus actual
            focusNode.unfocus(),
          },
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
