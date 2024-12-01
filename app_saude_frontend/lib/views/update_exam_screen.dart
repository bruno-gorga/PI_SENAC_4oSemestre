import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class UpdateExamScreen extends StatelessWidget {
  final dynamic exam;


  UpdateExamScreen({required this.exam});


  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  Future<void> updateExam(BuildContext context) async {
    try {
      // Recupera o token do SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');


      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: usuário não autenticado')),
        );
        return;
      }


      final response = await http.put(
        Uri.parse('http://localhost:3000/api/exames/${exam['_id']}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'nome': nameController.text,
          'data': dateController.text,
          'descricao': descriptionController.text,
        }),
      );


      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Exame atualizado com sucesso!')),
        );
        Navigator.pop(context); // Volta para a tela anterior
      } else {
        throw Exception('Erro ao atualizar exame: ${response.body}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao conectar ao servidor: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    nameController.text = exam['nome'];
    dateController.text = exam['data'].split('T')[0]; // Formata a data para YYYY-MM-DD
    descriptionController.text = exam['descricao'];


    return Scaffold(
      appBar: AppBar(title: Text('Atualizar Exame')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Exame',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Data do Exame (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Descrição do Exame',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => updateExam(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                'Atualizar Exame',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





