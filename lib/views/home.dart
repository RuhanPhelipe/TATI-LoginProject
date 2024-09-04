import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import 'package:tati0814/common/errors/errors_classes.dart';
import 'package:tati0814/common/errors/errors_messagens.dart';
import 'package:tati0814/common/routes/routes.dart';
import 'package:tati0814/common/validators/empty_str_validator.dart';
import 'package:tati0814/common/validators/min_lenght_str_validator.dart';
import 'package:tati0814/common/validators/text_field_validator.dart';
import 'package:tati0814/components/input_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool initView;

  final _formKey = GlobalKey<FormState>();

  final _loginFieldKey = GlobalKey<FormFieldState>();
  final _loginFieldController = TextEditingController();
  final _loginFieldFocusNode = FocusNode();

  final _passwordFieldKey = GlobalKey<FormFieldState>();
  final _passwordFieldController = TextEditingController();
  final _passwordFieldFocusNode = FocusNode();

  final _signInButtonFocusNode = FocusNode();

  @override
  void dispose() {
    _loginFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Form(
                  child: SafeArea(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputTextField(
                          textEditingController: _loginFieldController,
                          label: 'Usuário',
                          icon: Icons.account_circle,
                          onFieldSubmitted: (value) {
                            if (!_loginFieldKey.currentState!.validate()) {
                              FocusScope.of(context)
                                  .requestFocus(_loginFieldFocusNode);
                            } else {
                              _loginFieldFocusNode.unfocus();
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
                            } else {
                              _passwordFieldFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_signInButtonFocusNode);
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
                        height: 30,
                      ),
                      ElevatedButton(
                        focusNode: _signInButtonFocusNode,
                        onPressed: () {},
                        child: const Text('Entrar'),
                      )
                    ],
                  )),
                ),
              ),
              TextButton(
                onPressed: () => context.goNamed(RoutesApp.signUp.name),
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ));
  }
}
