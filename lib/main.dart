import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //gestor de estados provider a nivel raíz
    //multiprovider para multiples gestores de estado
    return MultiProvider(
      //que providers de gestores de estado
      //ChangeNotifierProvider para notificar cambios
      //create para la creación de la instancia inicial aquí iría nuestra ChatProvider
      // por que _ este _ es el build context osea el context pero sino usamos el context usaremos el _ (el _ es como decir no me interesa ese argumento)
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        //instancia la clase AppTheme
        theme: AppTheme(selectedColor: 4).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
