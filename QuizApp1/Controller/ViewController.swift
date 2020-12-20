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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  @IBAction func answer(_ sender: Any) {
      
    if (sender as AnyObject).tag == 1 {
      // 丸ボタンだった場合
      
      
    } else if (sender as AnyObject).tag == 2 {
      // バツボタンだった場合
      
    }
  }
  
}

