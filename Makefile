.PHONY: build prepare clean

FLUTTER_VERSION=1.22.2-stable
FLUTTER_DOWNLOAD_URL=https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_$(FLUTTER_VERSION).tar.xz
ANDROID_SDKTOOLS_DOWNLOAD_URL=https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip

build: .build

.build: prepare Dockerfile
	docker build .
	touch .build

prepare: flutter-sdk/.keep flutter-sdk/android-sdk/.keep downloads/android-sdk.zip downloads/flutter-sdk.tar.xz

clean:
	rm -r downloads/ flutter-sdk/

%/.keep:
	mkdir $*
	touch $*/.keep

flutter-sdk/android-sdk/.keep : flutter-sdk/.keep

downloads/android-sdk.zip: downloads/.keep
	wget $(ANDROID_SDKTOOLS_DOWNLOAD_URL) -O $@
	touch $@

downloads/flutter-sdk$(FLUTTER_VERSION).tar.xz: downloads/.keep
	wget $(FLUTTER_DOWNLOAD_URL) -O $@

downloads/flutter-sdk.tar.xz: downloads/flutter-sdk$(FLUTTER_VERSION).tar.xz
	ln $< $@
	touch $@
