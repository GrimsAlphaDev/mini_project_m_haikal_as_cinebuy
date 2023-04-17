import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:cinebuy_app/view/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            ClipRRect(
              child: Image.asset(
                'assets/images/movies_ilustration.png',
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Center(
                  child: Text('Register',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 70)),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Masukkan Email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Email tidak boleh kosong';
                            }
                            if (value.contains('@') == false) {
                              return 'Email tidak valid';
                            }
                            if (value.contains('.') == false) {
                              return 'Email tidak valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Masukan Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Password tidak boleh kosong';
                            }
                            if (value.length < 6) {
                              return 'Password minimal 6 karakter';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              await authService.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Sudah memiliki akun?"),
                          TextButton(
                            onPressed: () async {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
