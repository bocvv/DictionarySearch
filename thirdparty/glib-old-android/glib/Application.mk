APP_OPTIM := debug
#ANDROID_TOOLCHAIN=clang 
ANDROID_TOOLCHAIN=g++
APP_ABI ?= armeabi-v7a arm64-v8a
APP_CPPFLAGS := -frtti -fexceptions -std=c++11

#APP_PLATFORM := android-24
#APP_STL := gnustl_static

APP_PLATFORM := android-24
APP_STL := c++_static
