//
//  ViewController.swift
//  2択クイズアプリ
//
//

import UIKit

class SelectViewController: UIViewController {
    
    let quizCollection = QuizCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func syokyu(_ sender: Any) {
        let quizVC = self.storyboard?.instantiateViewController(withIdentifier: "quizVC") as? QuizViewController
        quizVC?.quizArray = quizCollection.syokyuQuiz
        quizVC?.kyu = "初級"
        TimerManager.shared.startCount()
        self.navigationController?.pushViewController(quizVC!, animated: true)
    }
    
    @IBAction func tyukyu(_ sender: Any) {
        let quizVC = self.storyboard?.instantiateViewController(withIdentifier: "quizVC") as? QuizViewController
        quizVC?.quizArray = quizCollection.tyukyuQuiz
        quizVC?.kyu = "中級"
        TimerManager.shared.startCount()
        self.navigationController?.pushViewController(quizVC!, animated: true)
    }
    
    @IBAction func jyokyu(_ sender: Any) {
        let quizVC = self.storyboard?.instantiateViewController(withIdentifier: "quizVC") as? QuizViewController
        quizVC?.quizArray = quizCollection.jyokyuQuiz
        quizVC?.kyu = "上級"
        TimerManager.shared.startCount()
        self.navigationController?.pushViewController(quizVC!, animated: true)
    }
}
