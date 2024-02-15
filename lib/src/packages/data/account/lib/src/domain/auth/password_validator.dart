class PasswordValidator {
  const PasswordValidator();

  bool isConfirmationValid(String password, String confirmation) {
    return password == confirmation;
  }
}
