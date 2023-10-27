

 dart run build_runner build --delete-conflicting-outputs

flutter test --coverage
genhtml coverage/lcov.info -o coverage
open coverage/index.html

