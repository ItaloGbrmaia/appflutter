enum DomainError {
  invalidCredentials('Credenciais inválidas'),
  unexpected('Algo errado aconteceu. Tente novamente mais tarde.'),
  emailInUse('Este e-mail já possui cadastro.'),
  emailAndSenhaInvalid('E-mail ou Senha inválidos'),
  ;

  const DomainError(this.description);

  final String description;
}
