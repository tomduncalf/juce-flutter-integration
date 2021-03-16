rm -rf dart
cp -R `dirname $(which flutter)`/cache/dart-sdk/include/third_party/dart .
mv dart/runtime dart/internal