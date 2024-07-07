import 'package:firebase_auth/firebase_auth.dart';

class AuthServ{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String nome,
    required String email,
    required String password,
r

  }) async {
UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
  email: email, 
  password: password,
  );
  await userCredential.user!.updateDisplayName(nome);
  }
}