//
//  GameExplanationView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 30/05/25.
//

import SwiftUI
import AVKit

struct PlayerView: UIViewRepresentable {
    var videoName: String
    
    init(videoName: String){
        self.videoName = videoName
    }
  
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
  
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(videoName: videoName)
    }
}

class LoopingPlayerUIView: UIView {
  
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    private var player = AVQueuePlayer()
  
    init(videoName: String){
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType: "mp4")!)
        let asset = AVURLAsset(url: url)
        let item = AVPlayerItem(asset: asset)

        super.init(frame: .zero)
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)

        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}



struct GameExplanationView: View {
    
    @Binding var closeExplanation: Bool
    
    var body: some View {
        
        ZStack {
            Color.white
            
            HStack {
                Spacer()
                PlayerView(videoName: "game")
                    .frame(width: UIDevice.isPad ? 250 : 150, height: UIDevice.isPad ? 280 : 180)
                    .offset(y: 20)
                
                Spacer()
                
                ZStack {
                    Image("game_explanation")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIDevice.isPad ? 530 :  430)
                    
                    Text("Now we're going to play a little game!\nPress the correct button to fill in the bar")
                        .font(.custom("BalooTamma-Regular", size: UIDevice.isPad ? 25 : 18))
                        .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                        .offset(x: -60, y: UIDevice.isPad ? -110 : -85)
                }
                Spacer()
            }
            .padding()
            
            Button(action: {
                closeExplanation = true
            }, label: {
                Image("close_button_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIDevice.isPad ? 80 : 60)
            })
            .offset(x: UIDevice.isPad ? 430 : 300, y: UIDevice.isPad ? -200 : -110)
        }
    }
}

#Preview {
    GameExplanationView(closeExplanation: .constant(false))
}
