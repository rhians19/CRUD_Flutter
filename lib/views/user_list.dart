import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/user_tile.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserList();
}

class _UserList extends State<UserList> {
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> userList = [];

  @override
  void initState() {
    super.initState();
    listUsers();
  }

  listUsers() async {
    final users = await FirebaseFirestore.instance.collection("usuarios").get();
    setState(() {
      userList = users.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Usuários',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.blue,
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.User_Form);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (ctx, i) {
          var currentUser = userList[i].data();
          var nome = currentUser['nome'];
          var email = currentUser['email'];
          return UserTile(User(name: nome, email: email, avatarUrl: ""));
        },
      ),
    );
  }
}
