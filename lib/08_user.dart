/// Class User
class User {
  /// User email
  final String email;

  ///Main constructor, initializing [email]
  User(this.email);

  @override
  String toString() {
    return "$runtimeType: $email";
  }
}

/// Class for privileged users
class AdminUser extends User with MailSystem {
  /// Main constructor, initializing [email]
  AdminUser(String email) : super(email);

  @override
  String toString() {
    return "$runtimeType: ${getMailSystem()}";
  }
}

/// Class for usual users
class GeneralUser extends User {
  ///Main constructor, initializing [email]
  GeneralUser(String email) : super(email);
}

/// MailSystem mixin
mixin MailSystem on User {
  String getMailSystem() => email.split('@').last;
}

/// UserManager class
class UserManager<T extends User> {
  List<T> users = [];

  /// Add [newUser] to [users]
  void addUser(T newUser) {
    if (users.any((user) => user.email == newUser.email)) {
      throw ArgumentError("User with that email is already registered");
    }
    users.add(newUser);
  }

  /// Remove user with [email] from [users]
  void removeUser(String email) {
    users.removeWhere((user) => user.email == email);
  }

  /// Method is used in tests to clear userManager
  void clearUsers() => users.clear();

  void printEmails() {
    print("Users emails:");
    users.forEach((user) {
      print(user.runtimeType == AdminUser ? (user as AdminUser).getMailSystem()
          : user.email);
    });
  }

  @override
  String toString() {
    String result = "";
    for (T element in users) {
      result += "$element\n";
    }
    return result;
  }
}
