//
//  ImagesModel.swift
//  QuizApp1
//
//  Created by Takuya Ando on 2020/12/21.
//

import Foundation

class ImagesModel {
  // 画像名を取得して、その画像名が人間かそうでないかをフラグによって判定する
  let imageText:String?
  let answer:Bool
  
  init(imageName:String, correctOrNot:Bool) {

    imageText = imageName

    answer = correctOrNot
  }
}
