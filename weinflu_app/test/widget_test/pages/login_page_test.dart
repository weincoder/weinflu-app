import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weinflu_app/config/providers/user_provider.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/models/user.dart';
import 'package:weinflu_app/pages/login_page.dart';

final fakeApp = UserProvider(
  userData: User(name: ''),
  child: MaterialApp(
    home: const LogInPage(),
    routes: {'home': (context) => const Scaffold()},
  ),
);
void main() {
  group('Encontrar todos los widgets en pantalla', () {
    testWidgets('find title', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const title = WeinfluCopys.hello;
      //Act
      final findedTitle = find.text(title);
      //Assert
      expect(findedTitle, findsOneWidget);
    });
    testWidgets('find by key the input name', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const inputNameKey = Key('input-name');
      //Act
      final findedInputName = find.byKey(inputNameKey);
      //Assert
      expect(findedInputName, findsOneWidget);
    });
    testWidgets('find button by type', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      //Act
      final findedInputPswd = find.byType(ElevatedButton);
      //Assert
      expect(findedInputPswd, findsOneWidget);
    });
  });
  group('Ser capaz de interactuar con los widgets en pantalla', () {
    testWidgets('fill user name', (widgetTester) async {
      //Arrenge
      const userName = 'Weincode';
      await widgetTester.pumpWidget(fakeApp);
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      //Assert
      final findedUserName = find.text(userName);
      expect(findedUserName, findsOneWidget);
    });
  });
  group('Probar los escenarios de interacción del usuario con nuestros widgets',
      () {
    testWidgets('Se llena el usuario correctamente pero no la contaseña', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const expectError = WeinFluErrors.userPsw;
      const userName = 'Weincode';
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      final findedBtn = find.byType(ElevatedButton);
      String? userPsw;
      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      final findedError = find.text(expectError);
      expect(findedError, findsOneWidget);
    });
    testWidgets('Se llena el usuario mal pero la contaseña correctamente', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const expectError = WeinFluErrors.userErrorLen;
      const userName = 'Weincoders';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-psw');
      final findedInputName = find.byKey(inputNameKey);
      final findedInpuPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);
      String? userPsw;
      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInpuPsw, userName);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      final findedError = find.text(expectError);
      expect(findedError, findsOneWidget);
    });
    testWidgets('Se llena los datos de manera incorrecta', (widgetTester) async {
      //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const expectError = WeinFluErrors.userPsw;
      const expectErrorName = WeinFluErrors.userError;
      const userName = 'Weincode';
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      final findedBtn = find.byType(ElevatedButton);
      String? userPsw;
      //Act
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      final findedError = find.text(expectError);
      final findedErrorName = find.text(expectErrorName);
      expect(findedError, findsOneWidget);
      expect(findedErrorName, findsOneWidget);
    });
    testWidgets('Se llena toda la info de manera correcta', (widgetTester) async {
        //Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const userName = 'Weincode';
      const userPsw = 'Weincoders';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-psw');
      final findedInputName = find.byKey(inputNameKey);
      final findedInpuPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);
      //Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInpuPsw, userPsw);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();
      //Assert
      expect(find.text(WeinFluErrors.userError), findsNothing);
      expect(find.text(WeinFluErrors.userErrorLen), findsNothing);
      expect(find.text(WeinFluErrors.userPsw), findsNothing);
    });
  });
}
