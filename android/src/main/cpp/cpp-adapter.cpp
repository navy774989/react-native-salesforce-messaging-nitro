#include <jni.h>
#include "salesforcemessagingnitroOnLoad.hpp"

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void*) {
  return margelo::nitro::salesforcemessagingnitro::initialize(vm);
}
