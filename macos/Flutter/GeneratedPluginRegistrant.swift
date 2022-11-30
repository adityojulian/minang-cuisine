//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import ai_barcode
import cloud_firestore
import device_info_plus_macos
import firebase_auth
import firebase_core
import mobile_scanner

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AiBarcodePlugin.register(with: registry.registrar(forPlugin: "AiBarcodePlugin"))
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  DeviceInfoPlusMacosPlugin.register(with: registry.registrar(forPlugin: "DeviceInfoPlusMacosPlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  MobileScannerPlugin.register(with: registry.registrar(forPlugin: "MobileScannerPlugin"))
}
