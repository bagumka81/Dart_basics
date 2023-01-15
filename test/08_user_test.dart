import 'package:test/test.dart';
import 'package:dart_basics/08_user.dart' as user;

void main() {
  user.UserManager userManager = user.UserManager();
  group('Success test', () {
    setUp(() {
      // it is called before each test
      userManager.addUser(user.GeneralUser("user1@mail.ru"));
      userManager.addUser(user.AdminUser("admUser@mail.ru"));
      userManager.addUser(user.GeneralUser("user2@ya.ru"));
      userManager.addUser(user.GeneralUser("user_to_del@ya.ru"));
      userManager.removeUser("user_to_del@ya.ru");
    });
    test('Check AdminUser(admUser@mail.ru) getMailSystem retrurns mail.ru', () {
      expect(
          (userManager.users[1] as user.AdminUser).getMailSystem(), "mail.ru");
    });
    test('Check printing all users emails im UserManager', () {
      expect(
          userManager.toString(),
          "GeneralUser: user1@mail.ru\n"
          "AdminUser: mail.ru\nGeneralUser: user2@ya.ru\n");
    });
    tearDown(() {
      // it is called after each test
      userManager.clearUsers();
    });
  });
}
