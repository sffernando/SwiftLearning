//
//  ViewController.swift
//  FirstSwiftTest
//
//  Created by koudai on 2016/11/26.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var timeLabel: UILabel!
    var stopBtn: UIButton!
    var startBtn: UIButton!
    var resetBtn: UIButton!
    
    var timer : Timer!
    var playing = false
    var time = 0.0
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel = UILabel()
        timeLabel.font = .systemFont(ofSize: 100)
        timeLabel.textColor = .white
        timeLabel.backgroundColor = .blue
        timeLabel.text = ""
        timeLabel.textAlignment = .center
        timeLabel.isUserInteractionEnabled = true
        timeLabel.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight * 3/7)
        self.view.addSubview(timeLabel)
        
        createThreeButtons()
    }
    
    func createThreeButtons() {
//        startBtn = UIButton.init(type: .system)
        startBtn = UIButton(type: .custom)
        
        startBtn.addTarget(self, action: #selector(buttonTouchAction(sender:)), for: .touchUpInside)
        startBtn.setTitle("开始", for: .normal)
        startBtn.backgroundColor = UIColor.green
        startBtn.frame = CGRect.init(x: 0, y: screenHeight*3/7, width: screenWidth/2, height: screenHeight*4/7)
        self.view.addSubview(startBtn)
        
        stopBtn = UIButton.init(type: .system)
        stopBtn.addTarget(self, action: #selector(buttonTouchAction(sender:)), for: .touchUpInside)
        stopBtn.setTitle("结束", for: .normal)
        stopBtn.backgroundColor = UIColor.brown
        stopBtn.frame = CGRect.init(x: screenWidth/2, y: screenHeight*3/7, width: screenWidth/2, height: screenHeight*4/7)
        self.view.addSubview(stopBtn)
        
        resetBtn = UIButton.init(type: .system)
        resetBtn.addTarget(self, action: #selector(buttonTouchAction(sender:)), for: .touchUpInside)
        resetBtn.setTitle("重置", for: .normal)
        resetBtn.backgroundColor = UIColor.green
        resetBtn.layer.cornerRadius = 4.0
        resetBtn.layer.borderColor = UIColor.red.cgColor
        resetBtn.frame = CGRect.init(x: screenWidth - 100, y: 24, width: 80, height: 30)
        timeLabel.addSubview(resetBtn)
    }
    
    func buttonTouchAction(sender: UIButton) {
        if sender == self.startBtn {
            if playing {
                return
            }
            playing = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            stopBtn.isEnabled = true
            startBtn.isEnabled = false
        } else if sender == self.stopBtn {
            startBtn.isEnabled = true
            stopBtn.isEnabled = false
            resetBtn.isEnabled = true
            timer.invalidate()
            playing = false
        } else if sender == self.resetBtn{
            if timer != nil {
                timer.invalidate()
            }
            playing = false
            time = 0.0
            timeLabel.text = "0.0"
            startBtn.isEnabled = true
            stopBtn.isEnabled = true
        }
    }
    
    
    
    func updateTime() {
        time += 0.1
        self.timeLabel.text = "\(time)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

