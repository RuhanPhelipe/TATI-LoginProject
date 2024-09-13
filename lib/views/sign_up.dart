import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/errors/errors_classes.dart';
import '../common/errors/errors_messagens.dart';
import '../common/routes/routes.dart';
import '../common/validators/empty_str_validator.dart';
import '../common/validators/min_lenght_str_validator.dart';
import '../common/validators/text_field_validator.dart';
import '../components/input_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final _loginFieldKey = GlobalKey<FormFieldState>();
  final _loginFieldController = TextEditingController();
  final _loginFieldFocusNode = FocusNode();

  final _nameFieldKey = GlobalKey<FormFieldState>();
  final _nameFieldController = TextEditingController();
  final _nameFieldFocusNode = FocusNode();

  final _emailFieldKey = GlobalKey<FormFieldState>();
  final _emailFieldController = TextEditingController();
  final _emailFieldFocusNode = FocusNode();

  final _cellFieldKey = GlobalKey<FormFieldState>();
  final _cellFieldController = TextEditingController();
  final _cellFieldFocusNode = FocusNode();

  final _passwordFieldKey = GlobalKey<FormFieldState>();
  final _passwordFieldController = TextEditingController();
  final _passwordFieldFocusNode = FocusNode();

  final _confirmPasswordFieldKey = GlobalKey<FormFieldState>();
  final _confirmPasswordFieldController = TextEditingController();
  final _confirmPasswordFieldFocusNode = FocusNode();

  final _signUpButtonFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuário'),
        leading: IconButton(
          onPressed: () => context.goNamed(RoutesApp.home.name),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTextField(
                  textEditingController: _loginFieldController,
                  label: 'Usuário',
                  icon: Icons.account_circle,
                  onFieldSubmitted: (value) {
                    if (!_loginFieldKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(_loginFieldFocusNode);
                    } else {
                      _loginFieldFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_nameFieldFocusNode);
                    }
                  },
                  onValidator: (value) {
                    try {
                      var isValid = TextFieldValidator(validators: [
                        EmptyStrValidator(),
                        MinLengthStrValidator(),
                      ]).validations(value);

                      if (!isValid) {
                        return MessagesError.defaultError;
                      }

                      return null;
                    } on Failure catch (e) {
                      return e.msg;
                    } catch (e) {
                      return e.toString();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                  textEditingController: _nameFieldController,
                  label: 'Nome',
                  icon: Icons.lock_person_rounded,
                  onFieldSubmitted: (value) {
                    if (!_nameFieldKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(_nameFieldFocusNode);
                    } else {
                      _nameFieldFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_emailFieldFocusNode);
                    }
                  },
                  onValidator: (value) {
                    try {
                      var isValid = TextFieldValidator(validators: [
                        EmptyStrValidator(),
                        MinLengthStrValidator(),
                      ]).validations(value);

                      if (!isValid) {
                        return MessagesError.defaultError;
                      }

                      return null;
                    } on Failure catch (e) {
                      return e.msg;
                    } catch (e) {
                      return e.toString();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                  textEditingController: _emailFieldController,
                  label: 'Email',
                  icon: Icons.email_rounded,
                  onFieldSubmitted: (value) {
                    if (!_emailFieldKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(_emailFieldFocusNode);
                    } else {
                      _emailFieldFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_cellFieldFocusNode);
                    }
                  },
                  onValidator: (value) {
                    try {
                      var isValid = TextFieldValidator(validators: [
                        EmptyStrValidator(),
                        MinLengthStrValidator(),
                      ]).validations(value);

                      if (!isValid) {
                        return MessagesError.defaultError;
                      }

                      return null;
                    } on Failure catch (e) {
                      return e.msg;
                    } catch (e) {
                      return e.toString();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                  textEditingController: _cellFieldController,
                  label: 'Telefone',
                  icon: Icons.phone,
                  onFieldSubmitted: (value) {
                    if (!_cellFieldKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(_cellFieldFocusNode);
                    } else {
                      _cellFieldFocusNode.unfocus();
                      FocusScope.of(context)
                          .requestFocus(_passwordFieldFocusNode);
                    }
                  },
                  onValidator: (value) {
                    try {
                      var isValid = TextFieldValidator(validators: [
                        EmptyStrValidator(),
                        MinLengthStrValidator(),
                      ]).validations(value);

                      if (!isValid) {
                        return MessagesError.defaultError;
                      }

                      return null;
                    } on Failure catch (e) {
                      return e.msg;
                    } catch (e) {
                      return e.toString();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                  textEditingController: _passwordFieldController,
                  label: 'Senha',
                  icon: Icons.lock_person_rounded,
                  onFieldSubmitted: (value) {
                    if (!_passwordFieldKey.currentState!.validate()) {
                      FocusScope.of(context)
                          .requestFocus(_passwordFieldFocusNode);
                    } else {}
                  },
                  onValidator: (value) {
                    try {
                      var isValid = TextFieldValidator(validators: [
                        EmptyStrValidator(),
                        MinLengthStrValidator(),
                      ]).validations(value);

                      if (!isValid) {
                        return MessagesError.defaultError;
                      }

                      return null;
                    } on Failure catch (e) {
                      return e.msg;
                    } catch (e) {
                      return e.toString();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                  textEditingController: _confirmPasswordFieldController,
                  label: 'Confirmar Senha',
                  icon: Icons.lock_person_rounded,
                  onFieldSubmitted: (value) {
                    if (!_confirmPasswordFieldKey.currentState!.validate()) {
                      FocusScope.of(context)
                          .requestFocus(_confirmPasswordFieldFocusNode);
                    } else {}
                  },
                  onValidator: (value) {
                    try {
                      var isValid = TextFieldValidator(validators: [
                        EmptyStrValidator(),
                        MinLengthStrValidator(),
                      ]).validations(value);

                      if (!isValid) {
                        return MessagesError.defaultError;
                      }

                      return null;
                    } on Failure catch (e) {
                      return e.msg;
                    } catch (e) {
                      return e.toString();
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                focusNode: _signUpButtonFocusNode,
                onPressed: () {},
                child: const Text('Confirmar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
