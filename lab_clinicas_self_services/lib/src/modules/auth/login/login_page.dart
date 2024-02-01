import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_services/src/modules/auth/login/login_controller.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessagesViewMixin {
  final controller = Injector.get<LoginController>();

  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    messageListener(controller);
    effect(() {
      if (controller.logged) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: sizeOf.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              constraints: BoxConstraints(maxWidth: sizeOf.width * .8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: LabClinicasTheme.titleStyle,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('obrigatorio'),
                        Validatorless.email('e-mail invalido'),
                      ]),
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Watch(
                      (_) => TextFormField(
                        controller: passwordEC,
                        obscureText: controller.viewPassword,
                        validator: Validatorless.required('obrigatorio'),
                        decoration: InputDecoration(
                          label: const Text('Senha'),
                          suffixIcon: IconButton(
                            onPressed: () => controller.passwordToggle(),
                            icon: controller.viewPassword
                                ? const Icon(
                                    Icons.visibility,
                                  )
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: sizeOf.width * .8,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid =
                              formKey.currentState?.validate() ?? false;

                          if (valid) {
                            controller.login(
                              emailEC.text.trim(),
                              passwordEC.text.trim(),
                            );
                          }
                        },
                        child: const Text('Entrar'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
