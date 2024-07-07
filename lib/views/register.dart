import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/autentication_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthServ _authServ = AuthServ();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  registerBtn() async {
    if (formKey.currentState!.validate()) {
      final nome = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      _authServ.cadastrarUsuario(nome: nome, email: email, password: password);

      try {
        final operation = await FirebaseFirestore.instance
            .collection("usuarios")
            .doc()
            .set({'nome': nome, 'email': email, 'senha': password});

        return operation;
      } catch (e) {
        print("Erro: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "O campo precisa ser preenchido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Insira seu nome",
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 25, 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 94, 92, 92),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "O campo precisa ser preenchido";
                  }
                  if (value.length < 5) {
                    return "O e-mail inserido é muito curto.";
                  }
                  if (!value.contains("@")) {
                    return "E-mail inválido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Insira seu e-mail",
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 25, 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 94, 92, 92),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "O campo precisa ser preenchido";
                  }
                  if (value.length < 6) {
                    return "A senha deve ter pelo menos 6 caracteres";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Insira sua senha",
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 25, 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 94, 92, 92),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "O campo precisa ser preenchido";
                  }
                  if (value != passwordController.text) {
                    return "As senhas não coincidem";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Confirme sua senha",
                  labelText: "Confirmar Senha",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 25, 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 94, 92, 92),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  BuildContext scaffoldContext = context;
                  final data = await registerBtn();
                  print(data);
                  if (data != null && scaffoldContext.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Usuário registrado com sucesso!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
