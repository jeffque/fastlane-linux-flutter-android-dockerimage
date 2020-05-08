FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade
RUN apt-get install gcc -y
RUN apt-get install make -y
RUN apt-get install g++ -y
RUN apt-get install build-essential  -y
RUN apt-get install ruby ruby-dev gem -y
RUN apt-get install libglu1-mesa -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install git -y
RUN gem install bundler -NV
RUN gem install fastlane -NV


# copy stuff
COPY downloads/ /downloads
COPY flutter-sdk/ /flutter-sdk

# extract stuff
RUN cd /flutter-sdk/android-sdk; unzip /downloads/android-sdk.zip 
RUN cd /flutter-sdk; tar -xvf /downloads/flutter-sdk.tar.xz

ENV FLUTTER_HOME=/flutter-sdk/flutter
ENV ANDROID_HOME=/flutter-sdk/android-sdk

ENV PATH=$PATH:$FLUTTER_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin

RUN yes | sdkmanager --licenses
RUN sdkmanager 'platforms;android-28' platform-tools 'build-tools;28.0.3'
RUN sdkmanager --update
