import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class DeleteExamsScreen extends StatelessWidget {
  Future<List<dynamic>> fetchExams() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');


    if (token == null) {
      throw Exception('Token não encontrado');
    }


    final response = await http.get(
      Uri.parse('http://localhost:3000/api/exames'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar exames');
    }
  }


  Future<void> deleteExam(String examId, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');


    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: usuário não autenticado')),
      );
      return;
    }


    final response = await http.delete(
      Uri.parse('http://localhost:3000/api/exames/$examId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 204) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exame excluído com sucesso!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao excluir exame: ${response.body}')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluir Exames'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchExams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar exames: ${snapshot.error}'));
          } else {
            final exams = snapshot.data ?? [];
            if (exams.isEmpty) {
              return Center(child: Text('Nenhum exame cadastrado.'));
            }
            return ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final formattedDate = exam['data'].split('T')[0];
                return Card(
                  color: Colors.grey[200],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(exam['nome']),
                    subtitle: Text('Data: $formattedDate\nDescrição: ${exam['descricao']}'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () => deleteExam(exam['_id'], context),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}




