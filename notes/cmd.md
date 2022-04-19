

flutter build apk --obfuscate --split-debug-info=C:\Users\Cheikh\Documents\Works\Notes\mobile_dp
start C:\Users\Cheikh\Documents\Works\Notes\mobile_dp\build\app\outputs\flutter-apk


keytool -list -v -keystore "C:\Users\Cheikh\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android


flutter pub get
flutter pub run flutter_launcher_icons:main



    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
    ],

