//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<cloud_firestore/FLTFirebaseFirestorePlugin.h>)
#import <cloud_firestore/FLTFirebaseFirestorePlugin.h>
#else
@import cloud_firestore;
#endif

#if __has_include(<firebase_auth/FLTFirebaseAuthPlugin.h>)
#import <firebase_auth/FLTFirebaseAuthPlugin.h>
#else
@import firebase_auth;
#endif

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<firebase_dynamic_links/FLTFirebaseDynamicLinksPlugin.h>)
#import <firebase_dynamic_links/FLTFirebaseDynamicLinksPlugin.h>
#else
@import firebase_dynamic_links;
#endif

#if __has_include(<flutter_blue/FlutterBluePlugin.h>)
#import <flutter_blue/FlutterBluePlugin.h>
#else
@import flutter_blue;
#endif

#if __has_include(<flutter_bluetooth_serial/FlutterBluetoothSerialPlugin.h>)
#import <flutter_bluetooth_serial/FlutterBluetoothSerialPlugin.h>
#else
@import flutter_bluetooth_serial;
#endif

#if __has_include(<flutter_reactive_ble/ReactiveBlePlugin.h>)
#import <flutter_reactive_ble/ReactiveBlePlugin.h>
#else
@import flutter_reactive_ble;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTFirebaseFirestorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseFirestorePlugin"]];
  [FLTFirebaseAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAuthPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FLTFirebaseDynamicLinksPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseDynamicLinksPlugin"]];
  [FlutterBluePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBluePlugin"]];
  [FlutterBluetoothSerialPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBluetoothSerialPlugin"]];
  [ReactiveBlePlugin registerWithRegistrar:[registry registrarForPlugin:@"ReactiveBlePlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
