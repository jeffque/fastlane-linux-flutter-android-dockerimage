.PHONY: build clean

build: flutter-sdk/.keep flutter-sdk/android-sdk/.keep downloads/android-sdk.zip downloads/flutter-sdk.tar.xz Dockerfile
	docker build .

clean:
	rm -r downloads/ flutter-sdk/

%/.keep:
	mkdir $*
	touch $*/.keep

flutter-sdk/android-sdk/.keep : flutter-sdk/.keep

downloads/android-sdk.zip: downloads/.keep
	wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O downloads/android-sdk.zip
	touch $@

downloads/flutter-sdk.tar.xz: downloads/.keep
	wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.9-stable.tar.xz -O downloads/flutter-sdk.tar.xz
	touch $@
