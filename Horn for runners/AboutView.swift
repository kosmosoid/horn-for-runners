import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Image("horn-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding(.top, 20)
            
            Text(NSLocalizedString("ABOUT_TITLE", comment: ""))
                .font(.largeTitle)
            
            Text(NSLocalizedString("VERSION_TEXT", comment: ""))
                .font(.subheadline)
            
            Text(NSLocalizedString("ABOUT_TEXT", comment: ""))
                .multilineTextAlignment(.center)
                .padding()

            Link(NSLocalizedString("BUY_COFEE", comment: ""), destination: URL(string: "https://www.donationalerts.com/r/kosmosoid")!)
                .padding()
            Link(NSLocalizedString("BOOSTY_TEXT", comment: ""), destination: URL(string: "https://boosty.to/kosmosoid/donate")!)
                .padding()
            
        }
    }
}
