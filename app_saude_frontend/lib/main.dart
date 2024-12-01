import 'package:flutter/material.dart';
import 'views/login_screen.dart';
import 'views/register_screen.dart';
import 'views/welcome_screen.dart';
import 'views/add_exam_screen.dart';
import 'views/view_exams_screen.dart';
import 'views/delete_exams_screen.dart';
import 'views/update_exams_list_screen.dart'; // Nova tela para listar exames a serem atualizados
import 'views/update_exam_screen.dart'; // Tela para editar um exame específico


void main() {
  runApp(AppSaude());
}


class AppSaude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'App Saúde',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Fundo branco para as telas
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/add-exam': (context) => AddExamScreen(),
        '/view-exams': (context) => ViewExamsScreen(),
        '/delete-exams': (context) => DeleteExamsScreen(),
        '/update-exams': (context) => UpdateExamsListScreen(), // Nova rota para listar exames
      },
    );
  }
}


class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Saúde')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Navega para a tela de cadastro
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 20), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navega para a tela de login
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}





