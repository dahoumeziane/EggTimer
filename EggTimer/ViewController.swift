//
//  ViewController.swift
//  EggTimer
//
//  Created by Dahou Meziane on 12/14/20.
//  Copyright © 2020 Meziane Dahou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtLabel: UILabel!
    let eggTimes = ["Soft": 3 ,"Medium": 4 , "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var hardness = ""
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        timer.invalidate()
        txtLabel.text = "How do you like your eggs ?"
        hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
    }
    @objc func updateTimer(){
        if secondPassed < totalTime {
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            secondPassed += 1
            
        }else {
            progressBar.progress = 1.0
            secondPassed = 0
            timer.invalidate()
            txtLabel.text = "Done"
        }
        
    }
   
    
}

