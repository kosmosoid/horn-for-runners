import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var showingAbout = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Button(action: {
                    isPlaying = true
                    AudioManager.shared.playHornSound()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isPlaying = false
                    }
                }) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 200, height: 200)
                        .overlay(
                            Text(NSLocalizedString("HORN_BUTTON", comment: "Text on the horn button"))
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
                .disabled(isPlaying)
                
                Spacer()
                
                Button(NSLocalizedString("ABOUT_BUTTON", comment: "Text on the horn button")) {
                    showingAbout = true
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("", displayMode: .inline)
            .sheet(isPresented: $showingAbout) {
                AboutView()
            }
        }
    }
}
