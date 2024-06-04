//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI
import AVKit

struct LessionView: View {
  // MARK: - PROPERTY
//  let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")!
//  @State var player = AVPlayer(url: Bundle.main.url(forResource: "video", withExtension: "mp4")!)
  
  @State private var player: AVPlayer? = {
    if let bundle = Bundle.main.path(forResource: "video", ofType: "mp4") {
      return .init(url: URL(filePath: bundle))
    }
    
    return nil
  }()
  
  @State var isPlaying: Bool = false
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      VStack {
        if let player {
          VideoPlayer(player: player)
            .frame(width: 320, height: 180, alignment: .center)
        }
        
//        Button {
//          isPlaying ? player!.pause() : player!.play()
//          isPlaying.toggle()
//          player!.seek(to: .zero)
//        } label: {
//          Image(systemName: isPlaying ? "stop" : "play")
//            .padding()
//        }
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  LessionView()
}
