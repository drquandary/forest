import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
                
                guard let entity = try? await Entity(named: "AudioController", in: realityKitContentBundle) else { fatalError("Unable to load immersive model") }
                let ambientAudioEntityController = entity.findEntity(named: "AmbientAudio")
                
                let audioFileName = "/Root/birds_in_forest_on_sunny_day_14444_mp3"
                
                
                guard let resource = try? await AudioFileResource(named: audioFileName, from: "AudioController.usda", in: realityKitContentBundle) else {
                    fatalError("Unable to load audio resource")
                }
                
                let audioController = ambientAudioEntityController?.prepareAudio(resource)
                audioController?.play()
                
                content.add(entity)
                
            }
            
        }
        .upperLimbVisibility(.hidden)
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
