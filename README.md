# text_sns

# dev
flutter run --flavor dev -t lib/main_dev.dart
# prod
flutter run --flavor prod -t lib/main_prod.dart


# dev:

flutterfire configure --out lib/gen/firebase_options_dev.dart --no-apply-gradle-plugins --platforms=android,ios --ios-bundle-id=com.firebaeaspp.textSnsDev3f53f --android-package-name=com.firebaseapp.text_sns_dev_3f53f


# production:

flutterfire configure --out lib/gen/firebase_options_prod.dart --no-apply-gradle-plugins --platforms=android,ios --ios-bundle-id=com.firebaseapp.textSnsProdF7210 --android-package-name=com.firebaseapp.text_sns_prod_f7210

## Format
    dart format --set-exit-if-changed .
     
    flutter analyze .

## freezed自動生成

flutter pub run build_runner build --delete-conflicting-outputs