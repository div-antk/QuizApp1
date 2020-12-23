//
//  SoundFile.swift
//  QuizApp1
//
//  Created by Takuya Ando on 2020/12/22.
//

import Foundation
import AVFoundation

class SoundFile {
  
  var player:AVAudioPlayer?
  
  func playSound(fileName:String, extentionName:String) {
    // 再生する
    let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionName)
        
    do {
      player = try AVAudioPlayer(contentsOf: soundURL!)
      player?.play()
    } catch {
      print("エラー(´・ω・｀)")
    }
  }
}
