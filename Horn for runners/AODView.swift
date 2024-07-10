import SwiftUI

@available(iOS 16.0, *)
struct AODView: View {
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                audioManager.playHornSound()
            }) {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text(NSLocalizedString("HORN_BUTTON", comment: "Text on the horn button"))
                            .foregroundColor(.white)
                            .font(.caption)
                    )
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}
