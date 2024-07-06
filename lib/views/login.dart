import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/user_list.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    loginBtn() {
      if (formKey.currentState!.validate()) {
        return Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const UserList()));
      }
    }

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        key: const Key("email"),
                        validator: (String? value) {
                          if (value == null) {
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
                            hintText: "Insira seu login",
                            labelText: "Login",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 25, 25)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 94, 92, 92),
                                    width: 2))),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: (String? value) {
                          if (value == null) {
                            return "O campo precisa ser preenchido";
                          }
                          if (value.length < 3) {
                            return "Senha muito curta";
                          }
                          return null;
                        },
                        key: const Key("senha"),
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Insira sua senha",
                            labelText: "Senha",
                            labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 25, 25)),
                            suffixIcon: Icon(Icons.password),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 94, 92, 92),
                                    width: 2))),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                loginBtn();
                              },
                              child: const Text("Entrar"))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Esqueci minha senha",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ]))));
  }
}
