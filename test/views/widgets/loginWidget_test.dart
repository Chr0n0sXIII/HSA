import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_service_app/views/widgets/loginWidget.dart';

void main() {
  Widget make({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('loginWidget ...', (tester) async {
    // TODO: Implement test
    await tester.pumpWidget(make(child: LoginWidget()));

    final loginswitch = find.byKey(Key("switch login"));
    print(loginswitch);

    // await tester.tap(loginswitch);
    // await tester.pump();

    final signupbutton = "f";
    expect(signupbutton, signupbutton);
  });
}
