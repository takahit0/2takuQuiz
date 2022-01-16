//
//  QuizViewController.swift
//  2択クイズアプリ
//
//

import UIKit

class QuizViewController: UIViewController {
    
    let quizCollection = QuizCollection()
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var kyuLabel: UILabel!
    @IBOutlet weak var quizCountLabel: UILabel!
    @IBOutlet weak var leftImage: UIButton!
    @IBOutlet weak var rightImage: UIButton!
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var NGImage: UIImageView!
    
    var number = 0
    var points = 0
    var quizArray = [Quiz]()
    var kyu = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        kyuLabel.text = kyu
        quizLabel.text = quizArray[0].q
        leftImage.setImage(UIImage(named: quizArray[0].l), for: .normal)
        rightImage.setImage(UIImage(named: quizArray[0].r), for: .normal)
        quizCountLabel.text = "1問目"
        answerImage.isHidden = true
        NGImage.isHidden = true
    }
    
    @IBAction func leftButton(_ sender: Any) {
        if quizArray[number].a == "左" && number < 10{
            answerImage.isHidden = false
            self.view.bringSubviewToFront(answerImage)
            points = points + 1
        }else{
            NGImage.isHidden = false
            self.view.bringSubviewToFront(NGImage)
        }
        leftImage.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.answerImage.isHidden = true
            self.view.sendSubviewToBack(self.answerImage)
            self.NGImage.isHidden = true
            self.view.sendSubviewToBack(self.NGImage)
            self.leftImage.isEnabled = true
            self.number = self.number + 1
            if self.number < 10{
                self.quizCountLabel.text = "\(self.number + 1)問目"
                self.quizLabel.text = self.quizArray[self.number].q
                self.leftImage.setImage(UIImage(named: self.quizArray[self.number].l), for: .normal)
                self.rightImage.setImage(UIImage(named: self.quizArray[self.number].r), for: .normal)
            }else{
                let resultVC = (self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as? ResultViewController)
                resultVC?.score = self.points
                resultVC?.kyu = self.kyu
                TimerManager.shared.stopCount()
                self.navigationController?.pushViewController(resultVC!, animated: true)
            }
        }
    }
    
    @IBAction func rightButton(_ sender: Any) {
        if quizArray[number].a == "右" && number < 10{
            answerImage.isHidden = false
            self.view.bringSubviewToFront(answerImage)
            points = points + 1
        }else{
            NGImage.isHidden = false
            self.view.bringSubviewToFront(NGImage)
        }
        rightImage.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.answerImage.isHidden = true
            self.view.sendSubviewToBack(self.answerImage)
            self.NGImage.isHidden = true
            self.view.sendSubviewToBack(self.NGImage)
            self.rightImage.isEnabled = true
            self.number = self.number + 1
            if self.number < 10{
                self.quizCountLabel.text = "\(self.number + 1)問目"
                self.quizLabel.text = self.quizArray[self.number].q
                self.leftImage.setImage(UIImage(named: self.quizArray[self.number].l), for: .normal)
                self.rightImage.setImage(UIImage(named: self.quizArray[self.number].r), for: .normal)
            }else{
                let resultVC = (self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as? ResultViewController)
                resultVC?.score = self.points
                resultVC?.kyu = self.kyu
                TimerManager.shared.stopCount()
                self.navigationController?.pushViewController(resultVC!, animated: true)
            }
        }
    }
}
