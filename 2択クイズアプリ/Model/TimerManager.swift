//
//  TimerManager.swift
//  2択クイズアプリ
//
//

import Foundation

class TimerManager {
    static let shared = TimerManager()
    
    var timer = Timer()
    var record = Timer()
    var countTime = 0.00
    
    func startCount() {
        countTime = 0.00
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ timer in
            self.countTime += 0.01
        }
    }
    
    func stopCount() {
        timer.invalidate()
    }
}
