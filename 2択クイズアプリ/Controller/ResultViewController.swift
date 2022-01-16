//
//  ResultViewController.swift
//  2択クイズアプリ
//
//

import UIKit

class ResultViewController: UIViewController {
    
    var score = Int()
    var timeResult = TimerManager.shared.countTime
    
    var SRecord = UserDefaults.standard.object(forKey: "SBestScore")
    var TRecord = UserDefaults.standard.object(forKey: "TBestScore")
    var JRecord = UserDefaults.standard.object(forKey: "JBestScore")
    
    var STime = UserDefaults.standard.object(forKey: "STime")
    var TTime = UserDefaults.standard.object(forKey: "TTime")
    var JTime = UserDefaults.standard.object(forKey: "JTime")
    
    var kyu = String()
    
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bestScore: UILabel!
    @IBOutlet weak var bestTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = "10問中 \(score)問正解"
        timeLabel.text = String(format: "%.2f", timeResult)
        reloadBestScore()
    }
    
    func reloadBestScore(){
        switch kyu {
        case "初級":
            if SRecord != nil{
                if score > SRecord as! Int{
                    bestScore.text = "最高記録：\(score)問正解"
                    UserDefaults.standard.set(score, forKey: "SBestScore")
                }else{
                    bestScore.text = "最高記録：\(SRecord as! Int)問正解"
                }
            }else{
                UserDefaults.standard.set(score, forKey: "SBestScore")
                bestScore.text = "最高記録：\(score)問正解"
            }
            
            if STime != nil{
                if timeResult < Double(STime as! String)!{
                    bestTime.text = String(format: "%.2f", timeResult)
                    UserDefaults.standard.set(String(format: "%.2f", timeResult), forKey: "STime")
                }else{
                    bestTime.text = STime as? String
                }
            }else{
                UserDefaults.standard.set(String(format: "%.2f", timeResult), forKey: "STime")
                bestTime.text = String(format: "%.2f", timeResult)
            }

        case "中級":
            if TRecord != nil{
                if score > TRecord as! Int{
                    bestScore.text = "最高記録：\(score)問正解"
                    UserDefaults.standard.set(score, forKey: "TBestScore")
                }else{
                    bestScore.text = "最高記録：\(TRecord as! Int)問正解"
                }
            }else{
                UserDefaults.standard.set(score, forKey: "TBestScore")
                bestScore.text = "最高記録：\(score)問正解"
            }
            
            if TTime != nil{
                if timeResult < Double(TTime as! String)!{
                    bestTime.text = String(format: "%.2f", timeResult)
                    UserDefaults.standard.set(String(format: "%.2f", timeResult), forKey: "TTime")
                }else{
                    bestTime.text = TTime as? String
                }
            }else{
                UserDefaults.standard.set(String(format: "%.2f", timeResult), forKey: "TTime")
                bestTime.text = String(format: "%.2f", timeResult)
            }
        case "上級":
            if JRecord != nil{
                if score > JRecord as! Int{
                    bestScore.text = "最高記録：\(score)問正解"
                    UserDefaults.standard.set(score, forKey: "JBestScore")
                }else{
                    bestScore.text = "最高記録：\(JRecord as! Int)問正解"
                }
            }else{
                UserDefaults.standard.set(score, forKey: "JBestScore")
                bestScore.text = "最高記録：\(score)問正解"
            }
            
            if JTime != nil{
                if timeResult < Double(JTime as! String)!{
                    bestTime.text = String(format: "%.2f", timeResult)
                    UserDefaults.standard.set(String(format: "%.2f", timeResult), forKey: "JTime")
                }else{
                    bestTime.text = JTime as? String
                }
            }else{
                UserDefaults.standard.set(String(format: "%.2f", timeResult), forKey: "JTime")
                bestTime.text = String(format: "%.2f", timeResult)
            }
        default:
            print("error")
        }
    }
            
        @IBAction func modoru(_ sender: Any) {
            let selectVC = self.storyboard?.instantiateViewController(withIdentifier: "selectVC") as? SelectViewController
            self.navigationController?.pushViewController(selectVC!, animated: true)
        }
}
