import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVAudioPlayer?
    private let audioSession = AVAudioSession.sharedInstance()
    
    private init() {
        setupAudioPlayer()
    }
    
    private func setupAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "car_horn", withExtension: "wav") else {
            print("File car_horn.wav not found")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.prepareToPlay()
            print("Player init success")
        } catch {
            print("Error : \(error.localizedDescription)")
        }
    }
    
    func playHornSound() {
    
        
        do {
            
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
            
            guard let player = player else {
                print("Player not init")
                return
            }
            
            // Запоминаем текущую громкость плеера
            let originalVolume = player.volume
            print("original vol: \(originalVolume)")
            
            player.volume = 1.0
            
            player.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.player?.volume = originalVolume
            }
            
        } catch {
            print("Error on play: \(error.localizedDescription)")
        }
    }
}
