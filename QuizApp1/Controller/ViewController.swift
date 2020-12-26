//
//  ViewController.swift
//  QuizApp1
//
//  Created by Takuya Ando on 2020/12/20.
//

import UIKit

class ViewController: UIViewController, NowScoreDelegate {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var maxScoreLabel: UILabel!
  
  var correctCount = 0
  var wrongCount = 0
  var maxScore = 0
  var questionNumber = 0
  
  let imagesList = ImagesList()
  
  // IBActionで検知した正答がどちらなのかを取得する変数
  var pickedAnswer = false
  
  // mp3
  var soundFile = SoundFile()
  
  // グラデーション
  var changeColor = ChangeColor()
  var gradientLayer = CAGradientLayer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 角丸
    imageView.layer.cornerRadius = 20.0
    
    // グラデーション
    gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
    // boundsは全体を表す
    gradientLayer.frame = view.bounds
    
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  // モーダルから戻ってきたときに0にしたい
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    correctCount = 0
    wrongCount = 0
    questionNumber = 0
    
    // ImagesListから持ってくる
    imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
    
    if UserDefaults.standard.object(forKey: "beforeCount") != nil {
      maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
    }
    
    // 最高得点の表示
    maxScoreLabel.text = String(maxScore)
  }
  
  @IBAction func answer(_ sender: Any) {
    
    if (sender as AnyObject).tag == 1 {
      // 丸ボタンだった場合
      soundFile.playSound(fileName: "maruSound", extentionName: "mp3")
      
      pickedAnswer = true
      
      
    } else if (sender as AnyObject).tag == 2 {
      // バツボタンだった場合
      soundFile.playSound(fileName: "batsuSound", extentionName: "mp3")

      pickedAnswer = false
    }
    
    
    // 回答チェック
    // pickedAnswerとImageListのCorrectOrNotの値が一致しているかどうか
    check()
    // 次の問題へ
    nextQuestions()
  }
  
  func check() {
    
    let correctAnswer = imagesList.list[questionNumber].answer
    
    if correctAnswer == pickedAnswer {
      correctCount += 1
    } else {
      wrongCount += 1
    }
  }
  
  // 第何問目
  func nextQuestions() {
    
    if questionNumber <= 9 {
      
      questionNumber += 1
      imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
    } else {
      print("問題は以上")
      
      // 画面遷移
      performSegue(withIdentifier: "next", sender: nil)
    }
  }
  
  func nowScore(score: Int) {
    soundFile.playSound(fileName: "sound", extentionName: "mp3")
    maxScoreLabel.text = String(score)
  }
  
  // NextViewControllerに値を渡す
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "next" {
      
      let nextVC = segue.destination as! NextViewController
      
      nextVC.correctedCount = correctCount
      nextVC.wrongCount = wrongCount
      nextVC.delegate = self
    }
  }
}

