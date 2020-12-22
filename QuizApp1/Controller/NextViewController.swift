//
//  NextViewController.swift
//  QuizApp1
//
//  Created by Takuya Ando on 2020/12/20.
//

import UIKit

protocol NowScoreDelegate {
  func nowScore(score:Int)
}

class NextViewController: UIViewController {

  @IBOutlet weak var correctLabel: UILabel!
  @IBOutlet weak var wrongLabel: UILabel!
  
  var delegate:NowScoreDelegate?
  
  var correctedCount = Int()
  var wrongCount = Int()
  
  // 以前までのスコア
  var beforeCount = Int()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      correctLabel.text = String(correctedCount)
      wrongLabel.text = String(wrongCount)
    }


  @IBAction func back(_ sender: Any) {
    
    // もしハイスコアであれば更新
    if beforeCount < correctedCount {
      
      UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
      delegate?.nowScore(score: correctedCount)
    } else {
      
    }
    
    dismiss(animated: true, completion: nil)
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
