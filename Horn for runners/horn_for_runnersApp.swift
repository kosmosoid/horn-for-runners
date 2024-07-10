import SwiftUI
import AVFoundation

@main
struct HornApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "hornapp" && url.host == "playhorn" {
            AudioManager.shared.playHornSound()
            return true
        }
        return false
    }
}
