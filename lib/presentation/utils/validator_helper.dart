class ValidatorHelper{
  static String emailValidator(final String email)
  {
    String message = '';
    RegExp emailPattern = RegExp(r'^[a-zA-Z0-9+_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if(email.trim().isEmpty)message = 'Please enter email';
    if(email.trim().isNotEmpty&&!emailPattern.hasMatch(email)){
      message = 'Please enter email in valid format';
    }
    if(emailPattern.hasMatch(email))
    {
      message = 'Email is valid';
    }
    return message;
  }

  static String passwordValidator(final String password)
  {
    String message = '';
    RegExp numericRegex = RegExp(r'[0-9]');
    RegExp specialCharRegex = RegExp(r'[!@#\$&*~]');
    RegExp upperCaseRegex = RegExp(r'[A-Z]');
    if(password.trim().isEmpty)message = 'Please enter password';

    if(password.trim().isNotEmpty && password.length<8 &&
        numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain 8 characters';
    }
    if(password.trim().isNotEmpty && password.length>7 &&!
    numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should contain at least one digit';
    }
    if(password.trim().isNotEmpty && password.length>7 &&
        numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should contain at least one special character';
    }
    if(password.trim().isNotEmpty && password.length>7 &&
        numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&!
    upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should contain at least one uppercase alphabet';
    }

    if(password.trim().isNotEmpty && password.length<8 &&!
    numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n 8 characters  \n minimum one numeric number';
    }

    if(password.trim().isNotEmpty && password.length<8 &&
        numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n 8 characters \n minimum one special character';
    }

    if(password.trim().isNotEmpty && password.length<8 &&
        numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&!
    upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n 8 characters \n minimum one uppercase alphabet';
    }

    if(password.trim().isNotEmpty && password.length>7 &&!
    numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n minimum one special character  \n minimum one numeric number';
    }

    if(password.trim().isNotEmpty && password.length>7 &&!
    numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n minimum one numeric number \n minimum one uppercase alphabet';
    }

    if(password.trim().isNotEmpty && password.length>7 &&
        numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&!
    upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n minimum one special character \n minimum one uppercase alphabet';
    }
    if(password.trim().isNotEmpty && password.length<8 &&!
    numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n 8 characters \n minimum one numeric number \n minimum one special character';
    }
    if(password.trim().isNotEmpty && password.length<8 &&!
    numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&!
    upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n 8 characters \n minimum one numeric number \n minimum one uppercase alphabet';
    }
    if(password.trim().isNotEmpty && password.length<8 &&
        numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&!
    upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n 8 characters \n minimum one special character \n minimum one uppercase alphabet';
    }
    if(password.trim().isNotEmpty && password.length>7 &&!
    numericRegex.hasMatch(password) &&! specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password should be contain: \n one uppercase alphabet \n minimum one numeric number \n minimum one special character';
    }
    if(password.trim().isNotEmpty && password.length>7 &&
        numericRegex.hasMatch(password) && specialCharRegex.hasMatch(password) &&
        upperCaseRegex.hasMatch(password)
    )
    {
      message = 'Password is valid';
    }
    return message;
  }
}
