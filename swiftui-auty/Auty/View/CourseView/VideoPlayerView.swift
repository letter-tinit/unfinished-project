//
// Created by Treasure Letter ♥
// 
// https://github.com/tinit4ever
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // MARK: - PROPERTY
  var size: CGSize
  var safeArea: EdgeInsets
  
  @State private var player: AVPlayer? = {
    if let bundle = Bundle.main.path(forResource: "video", ofType: "mp4") {
      return .init(url: URL(filePath: bundle))
    }
    
    //    if let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
    //
    //      return AVPlayer(url: url)
    //    }
    
    
    return nil
  }()
  
  @State private var showPlayerControls: Bool = false
  @State private var isPlaying: Bool = false
  @State private var timeoutTask: DispatchWorkItem?
  @State private var isFinishPlaying: Bool = false
  
  // MARK: - VIDEO SEEKER VIEW PROPERTY
  @GestureState private var isDragging: Bool = false
  @State private var isSeeking: Bool = false
  @State private var progress: CGFloat = 0
  @State private var lastDraggedProgress: CGFloat = 0
  @State private var isObserverAdded: Bool = false
  
  // MARK: - ROTATION PROPERTIY
  @State private var thumbnailsFrames: [UIImage] = []
  @State private var draggingImage: UIImage?
  @State private var playerStatusObserver: NSKeyValueObservation?
  
  // MARK: - ROTATION PROPERTIY
  @Binding var isRotate: Bool
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - SWAPPING SIZE WHEN ROTATE
      let videoPlayerSize: CGSize = .init(width: isRotate ? size.height : size.width, height: isRotate ? size.width : (size.height / 3.5))
      
      // MARK: - CUSTOM VIDEO PLAYER
      ZStack {
        if let player {
          CustomVideoPlayer(player: player)
            .overlay {
              Rectangle()
                .fill(.black.opacity(0.4))
                .opacity(showPlayerControls || isDragging ? 1 : 0)
                .animation(.easeInOut(duration: 0.35), value: isDragging)
                .overlay {
                  playBackControls()
                }
            }
            .overlay {
              HStack(spacing: 60) {
                DoubleTapSeek {
                  let seconds = player.currentTime().seconds - 15
                  player.seek(to: .init(seconds: seconds, preferredTimescale: 600))
                }
                
                DoubleTapSeek(isForward: true) {
                  let seconds = player.currentTime().seconds + 15
                  player.seek(to: .init(seconds: seconds, preferredTimescale: 600))
                }
              }
            }
            .onTapGesture {
              withAnimation(.easeInOut(duration: 0.35)) {
                showPlayerControls.toggle()
              }
              
              if isPlaying {
                timeoutControls()
              }
            }
            .overlay(alignment: .leading) {
              SeekerThumbnailView(videoPlayerSize)
                .offset(y: isRotate ? 50 : 10)
            }
            .overlay(alignment: .bottom) {
              VideoSeekerView(videoPlayerSize)
                .offset(y: isRotate ? -15 : 0)
            }
        }
      }
      .background(
        Rectangle()
          .fill(.black)
          .padding(.trailing, isRotate ? -safeArea.bottom : 0)
      )
      .gesture(
        DragGesture()
          .onEnded({ value in
            if -value.translation.height > 100 {
              withAnimation(.easeInOut(duration: 0.2)) {
                isRotate = true
              }
            } else {
              withAnimation(.easeInOut(duration: 0.2)) {
                isRotate = false
              }
            }
          })
      )
      .frame(width: videoPlayerSize.width, height: videoPlayerSize.height)
      .frame(width: size.width, height: size.height / /*(unitWidth * 7.956)*/ 3.5, alignment: .bottomLeading)
      .offset(y: isRotate ? -((size.width / 2) + safeArea.bottom) : 0)
      .rotationEffect(.init(degrees: isRotate ? 90 : 0), anchor: .topLeading)
      .zIndex(10000)
      
//      ScrollView(.vertical, showsIndicators: false) {
//        VStack(spacing: 10) {
//          ForEach(1...5, id: \.self) { index in
//            GeometryReader {
//              let size = $0.size
//              
//              Image("Thumnail \(index)")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: size.width, height: size.height)
//                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//            }
//            .frame(height: 220)
//          }
//        }
//        .padding(.horizontal, 15)
//        .padding(.top, 30)
//        .padding(.bottom, 15 + safeArea.bottom)
//      }
    }
    .padding(.top, safeArea.top)
    .onAppear {
      guard !isObserverAdded else { return }
      
      player?.addPeriodicTimeObserver(forInterval: .init(value: 1, timescale: 1), queue: .main, using: { time in
        if let currentPlayerItem = player?.currentItem {
          let totalDuration = currentPlayerItem.duration.seconds
          guard let currentDuration = player?.currentTime().seconds else { return }
          
          let calculatedProgress = currentDuration / totalDuration
          
          if !isSeeking {
            progress = calculatedProgress
            lastDraggedProgress = progress
          }
          
          if calculatedProgress == 1 {
            // Finish Playing
            isFinishPlaying = true
            isPlaying = false
          }
        }
      })
      
      isObserverAdded = true
      
      // Before Generating Thumbnails, Check if the Video is Loaded
      playerStatusObserver = player?.observe(\.status, options: .new, changeHandler: { player, _ in
        if player.status == .readyToPlay {
          generateThumbnailFrames()
        }
      })
    }
    .onDisappear {
      playerStatusObserver?.invalidate()
    }
  }
  
  // MARK: - VIDEO SEEKER VIEW()
  @ViewBuilder
  func VideoSeekerView(_ videoSize: CGSize) -> some View {
    ZStack(alignment: .leading) {
      Rectangle()
        .fill(.gray)
      
      Rectangle()
        .fill(.red)
        .frame(width: max(videoSize.width * progress, 0))
    }
    .frame(height: 3)
    .overlay(alignment: .leading) {
      Circle()
        .fill(.red)
        .frame(width: 15, height: 15)
        .scaleEffect(showPlayerControls || isDragging ? 1 : 0.001, anchor: progress * videoSize.width > 15 ? .trailing : .leading)
        .frame(width: 50, height: 50)
        .contentShape(Rectangle())
        .offset(x: videoSize.width * progress)
        .gesture(
          DragGesture()
            .updating($isDragging, body: { _, out, _ in
              out = true
            })
            .onChanged({ value in
              
              if  let  timeoutTask {
                timeoutTask.cancel()
              }
              
              let transitionX: CGFloat = value.translation.width
              let calculateProgress = (transitionX / videoSize.width) + lastDraggedProgress
              
              progress = max(min(calculateProgress, 1), 0)
              isSeeking = true
              
              let dragIndex = Int(progress / 0.01)
              if thumbnailsFrames.indices.contains(dragIndex) {
                draggingImage = thumbnailsFrames[dragIndex]
              }
            })
            .onEnded({ value in
              lastDraggedProgress = progress
              
              if let currentPlayerItem = player?.currentItem {
                let totalDuration = currentPlayerItem.duration.seconds
                
                player?.seek(to: .init(seconds: totalDuration * progress, preferredTimescale: 600))
                
                if isPlaying {
                  timeoutControls()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  isSeeking = false
                }
              }
            })
        )
        .offset(x: progress * videoSize.width > 15 ? -15 : 0)
        .frame(width: 15, height: 15)
    }
    .opacity(showPlayerControls && !isDragging ?  1 : 0)
  }
  
  // MARK: - PLAYBACK CONTROLS VIEW
  @ViewBuilder
  func playBackControls() -> some View {
    HStack(spacing: 25) {
      // MARK: - PREVIOUS BUTTON
      Button {
        
      } label: {
        Image(systemName: "backward.end.fill")
          .font(.title2)
          .fontWeight(.ultraLight)
          .foregroundStyle(.white)
          .padding(15)
          .background(
            Circle()
              .fill(.black.opacity(0.35))
          )
      }
      .disabled(true)
      .opacity(0.6)
      
      // MARK: - PLAY BUTTON
      Button {
        // CHANGE VIEW STATUS
        if isFinishPlaying {
          isFinishPlaying = false
          player?.seek(to: .zero)
          progress = .zero
          lastDraggedProgress = .zero
        }
        
        if isPlaying {
          // Pause Video
          player?.pause()
          
          if let timeoutTask {
            timeoutTask.cancel()
          }
        } else {
          // PLay Video
          player?.play()
          timeoutControls()
        }
        
        withAnimation(.easeInOut(duration: 0.2)) {
          isPlaying.toggle()
        }
      } label: {
        Image(systemName: isFinishPlaying ? "arrow.clockwise" : (isPlaying ? "pause.fill" : "play.fill"))
          .font(.title2)
          .foregroundStyle(.white)
          .padding(15)
          .background(
            Circle()
              .fill(.black.opacity(0.35))
          )
      }
      .scaleEffect(1.1)
      
      // MARK: - NEXT BUTTON
      
      Button {
        
      } label: {
        Image(systemName: "forward.end.fill")
          .font(.title2)
          .fontWeight(.ultraLight)
          .foregroundStyle(.white)
          .padding(15)
          .background(
            Circle()
              .fill(.black.opacity(0.35))
          )
      }
      .disabled(true)
      .opacity(0.6)
    }
    .opacity(showPlayerControls && !isDragging ?  1 : 0)
    .animation(.easeInOut(duration: 0.2), value: showPlayerControls)
  }
  
  
  // MARK: - SEEKER THUMBNAIL VIEW
  @ViewBuilder
  func SeekerThumbnailView(_ videoSize: CGSize) -> some View {
    let thumbSize: CGSize = .init(width: 175, height: 100)
    ZStack {
      if let draggingImage {
        Image(uiImage: draggingImage)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: thumbSize.width, height: thumbSize.height)
          .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
          .overlay {
            if let currentItem = player?.currentItem {
              Text(CMTime(seconds: progress * currentItem.duration.seconds, preferredTimescale: 600).toTimeString())
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .offset(y: 25)
            }
          }
          .overlay {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
              .stroke(.white, lineWidth: 2)
          }
      } else {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(.black)
          .overlay {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
              .stroke(.white, lineWidth: 2)
          }
      }
    }
    .frame(width: thumbSize.width, height: thumbSize.height)
    .opacity(isDragging ? 1 : 0)
    .offset(x: progress * (videoSize.width - thumbSize.width - 20))
    .offset(x: 10)
    .offset(y: 10)
  }
  
  // MARK: - TIME OUT CONTROL
  func timeoutControls() {
    // Cancelling Already Pending timeout Task
    if let timeoutTask {
      timeoutTask.cancel()
    }
    
    timeoutTask = .init(block: {
      withAnimation(.easeInOut(duration: 0.35)) {
        showPlayerControls = false
      }
    })
    
    // Scheduling Task
    if let timeoutTask {
      DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: timeoutTask)
    }
  }
  
  // MARK: - GENERATING THUMBNAIL FRAMES
  func generateThumbnailFrames() {
    Task.detached {
      guard let asset = player?.currentItem?.asset else { return }
      
      let generator = AVAssetImageGenerator(asset: asset)
      
      generator.appliesPreferredTrackTransform = true
      generator.maximumSize = .init(width: 250, height: 250)
      
      do {
        let totalDuration = try await asset.load(.duration).seconds
        var frameTimes: [CMTime] = []
        
        // Frame Timings
        // 1/0.1 = 100 (Frames)
        for progress in stride(from: 0, to: 1, by: 0.01) {
          let time = CMTime(seconds: progress * totalDuration, preferredTimescale: 600)
          frameTimes.append(time)
        }
        
        // Generating Frame Images
        for await result in generator.images(for: frameTimes) {
          let cgImage = try result.image
          
          await MainActor.run {
            thumbnailsFrames.append(UIImage(cgImage: cgImage))
          }
        }
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}

// MARK: PREVIEW
//#Preview {
//  VideoPlayerView(size: CGSize(width: 340, height: 600), safeArea: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//}

