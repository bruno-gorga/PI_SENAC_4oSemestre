import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {
  String nomeUsuario = 'Usuário';


  @override
  void initState() {
    super.initState();
    _carregarNomeUsuario();
  }


  Future<void> _carregarNomeUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuario = prefs.getString('nome') ?? 'Usuário';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo(a), $nomeUsuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-exam');
              },
              child: Text('Adicionar Exame'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/view-exams');
              },
              child: Text('Consultar Exames'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/delete-exams');
              },
              child: Text('Excluir Exame'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/update-exams'); // Navega para listar exames a serem atualizados
              },
              child: Text('Atualizar Exame'),
            ),
          ],
        ),
      ),
    );
  }
}





