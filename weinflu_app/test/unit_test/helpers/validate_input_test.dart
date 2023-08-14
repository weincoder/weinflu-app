import 'package:flutter_test/flutter_test.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/pages/helper/validate_input.dart';
void main() {
  group('Testing Validate Input', () {
    test('invalid user', ()  {
      //Arrenge -> nos preparamos para ejecutar el test
      const inputValue = 'Weincoders';
      const expectedError = WeinFluErrors.userErrorLen;

      //Act -> Ejecutamos la acción probar
      final currentValue = validateInput(inputValue);

      //Assert --> Evaluar si el resultado es el esperado
      expect(currentValue, expectedError);
    });
    test('invalid user null', ()  {
      //Arrenge -> nos preparamos para ejecutar el test
      String? inputValue;
      const expectedError = WeinFluErrors.userError;

      //Act -> Ejecutamos la acción probar
      final currentValue = validateInput(inputValue);

      //Assert --> Evaluar si el resultado es el esperado
      expect(currentValue, expectedError);
    });
    test('valid user', ()  {
      //Arrenge -> nos preparamos para ejecutar el test
      const inputValue = 'Weincoder';
      String? expectedError;

      //Act -> Ejecutamos la acción probar
      final currentValue = validateInput(inputValue);

      //Assert --> Evaluar si el resultado es el esperado
      expect(currentValue, expectedError);
    });
  });
}