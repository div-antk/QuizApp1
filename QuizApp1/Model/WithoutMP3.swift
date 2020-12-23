//
//  WithoutMP3.swift
//  QuizApp1
//
//  Created by Takuya Ando on 2020/12/23.
//

import Foundation

class WithoutMP3: SoundFile {
  
  override func playSound(fileName: String, extentionName: String) {

    if extentionName == "mp3" {
      print("再生できない")
    } else {
      player?.stop()
    }
  }
}
