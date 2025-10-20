SHELL=/bin/bash

ANDROID_ENV_FILE_PATH=android/secret.properties
IOS_ENV_FILE_PATH=ios/RUNNER/Environment.swift
ENV_FILE_DEFAULT_EXTENSION=.example
PROTOBUF_SRC_PATH=../bcrd_protobuf/src
GRPC_GEN_PATH=lib/grpc_gen

# firebase project
project=bcrd-dev

setup:
	flutter clean
	flutter pub get
	if [ ! -e "${ANDROID_ENV_FILE_PATH}" ]; then cp "${ANDROID_ENV_FILE_PATH}"{"${ENV_FILE_DEFAULT_EXTENSION}",}; fi
	if [ ! -e "${IOS_ENV_FILE_PATH}" ]; then cp "${IOS_ENV_FILE_PATH}"{"${ENV_FILE_DEFAULT_EXTENSION}",}; fi
	(cd ios && pod install)
# e.x.) make setup-firebase project=hogehoge
setup-firebase:
	flutterfire configure --project=${project}
protoc:
	if [ ! -e "${GRPC_GEN_PATH}" ]; then mkdir -p "${GRPC_GEN_PATH}"; fi
	protoc --dart_out=grpc:${GRPC_GEN_PATH} -I ${PROTOBUF_SRC_PATH} ${PROTOBUF_SRC_PATH}/*.proto google/protobuf/timestamp.proto
icon:
	flutter pub run flutter_launcher_icons:main
	flutter pub run flutter_native_splash:create
main-branch:
	git switch main
	git branch | grep -v "main" | xargs git branch -d
	git pull
develop-branch:
	git switch develop
	git branch | grep -v "develop" | xargs git branch -d
	git pull
build-runner:
	flutter pub run build_runner build --delete-conflicting-outputs
build-app:
	flutter build apk --release && mv build/app/outputs/flutter-apk/app-release.apk ./build/bcrd.apk
release-note:
	cat release_note.txt > android/fastlane/release_note.txt
	cat release_note.txt > ios/fastlane/release_note.txt
release-check:
	cat release_note.txt
	@echo ''
	cat android/fastlane/release_note.txt
	@echo ''
	cat ios/fastlane/release_note.txt
	@echo ''
	@if [ -n "`diff -u release_note.txt android/fastlane/release_note.txt`" ]; then echo 'Android用release_noteが更新されていません' && exit 1; fi
	@if [ -n "`diff -u release_note.txt ios/fastlane/release_note.txt`" ]; then echo 'iOS用release_noteが更新されていません' && exit 1; fi
	@diff_output="$$(diff <(cat pubspec.yaml | grep 'version:' | awk '{print $$2 ")"}' | tr '+' '(') <(cat release_note.txt | head -n 1))"; if [ -n "$${diff_output}" ]; then echo 'バージョン情報が更新されていません'; echo "$$diff_output" && exit 1; fi
	@echo 'release check ok'
deploy-android:
	(cd android && fastlane android deploy)
deploy-ios:
	(cd ios && fastlane ios deploy)
