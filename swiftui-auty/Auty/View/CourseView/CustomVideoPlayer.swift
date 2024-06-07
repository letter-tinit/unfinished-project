//
// Created by Treasure Letter ♥
// 
// https://github.com/tinit4ever
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
  // MARK: - PROPERTY
  
  var player: AVPlayer
  
  // MARK: - FUNC
  
  func makeUIViewController(context: Context) -> AVPlayerViewController  {
    let controller = AVPlayerViewController()
    controller.player = player
    controller.showsPlaybackControls = false
    
    return controller
  }
  
  func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    print("A")
  }
}
