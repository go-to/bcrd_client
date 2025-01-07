import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Google Maps API Key
    GMSServices.provideAPIKey(Env.googleMapApiKey)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
