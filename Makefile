
%/.keep:
	mkdir $*
	touch $*/.keep

downloads/android-sdk.zip: downloads/.keep
	wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O downloads/android-sdk.zip
	touch $@

downloads/flutter-sdk.tar.xz: downloads/.keep
	wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.9-stable.tar.xz -O downloads/flutter-sdk.tar.xz
	touch $@
