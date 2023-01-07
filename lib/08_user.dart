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
  addUser(T newUser) {
    for (T element in users) {
      if (element.email == newUser.email) {
        throw ArgumentError("User with that email is already registered");
      }
    }
    users.add(newUser);
  }

  /// Remove user with [email] from [users]
  removeUser(String email) {
    for (T element in users) {
      if (element.email == email) {
        users.remove(element);
        return;
      }
    }
    throw ArgumentError("User with that email doesn't exist!");
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
