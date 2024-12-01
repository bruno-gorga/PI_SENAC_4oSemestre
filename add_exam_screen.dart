import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class AddExamScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

// Add codigo aqui



Future<void> addExam(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // Recupera o token armazenado


    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: usuário não autenticado')),
      );
      return;
    }


    final dateText = dateController.text;
    DateTime? parsedDate;
    try {
      parsedDate = DateFormat('yyyy-MM-dd').parseStrict(dateText);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formato de data inválido. Use YYYY-MM-DD.')),
      );
      return;
    }


    final response = await http.post(
      Uri.parse('http://localhost:3000/api/exames'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'nome': nameController.text,
        'data': DateFormat('yyyy-MM-dd').format(parsedDate),
        'descricao': descriptionController.text,
      }),
    );


    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exame adicionado com sucesso!'))); // Mensagem de sucesso
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao adicionar exame: ${response.body}')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao conectar ao servidor: $e')),
    );
  }
}








// Add codigo aqui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Exame'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do Exame'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Data do Exame (YYYY-MM-DD)'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () => addExam(context),
              child: Text('Adicionar Exame', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}





