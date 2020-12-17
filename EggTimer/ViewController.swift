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
    let eggTimes = ["Soft": 60 ,"Medium": 4 , "Hard": 7]
    var secondsRemaining = 60
    var timer = Timer()
    var hardness = ""
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        timer.invalidate()
        txtLabel.text = "How do you like your eggs ?"
        hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
    }
    @objc func updateTimer(){
        progressBar.progress = Float((eggTimes[hardness]! - secondsRemaining)/eggTimes[hardness]!)
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }else {
            txtLabel.text = "Done !"
        }
        
    }
   
    
}

