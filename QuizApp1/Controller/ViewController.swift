//
//  ViewController.swift
//  QuizApp1
//
//  Created by Takuya Ando on 2020/12/20.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var maxScoreLabel: UILabel!
  
  var correctCount = 0
  var wrongCount = 0
  var maxScore = 0
  var questionNumber = 0
  
  let imagesList = ImagesList()
  
  // IBActionで検知した正答がどちらなのかを取得する変数
  var pickedAnswer = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  // モーダルから戻ってきたときに0にしたい
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    correctCount = 0
    wrongCount = 0
    questionNumber = 0
    
    // ImagesListから持ってくる
    imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
  }

  @IBAction func answer(_ sender: Any) {
    
    if (sender as AnyObject).tag == 1 {
      // 丸ボタンだった場合
      pickedAnswer = true

      
    } else if (sender as AnyObject).tag == 2 {
      // バツボタンだった場合
      pickedAnswer = false

    }
    
    // 回答チェック
    // pickedAnswerとImageListのCorrectOrNotの値が一致しているかどうか
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
      
      if questionNumber <= 1 {
        
        questionNumber += 1
        imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
      } else {
        print("問題は以上")
        
        // 画面遷移
        performSegue(withIdentifier: "next", sender: nil)
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
  }
}

