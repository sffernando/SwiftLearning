//
//  ViewController.swift
//  SwiftStudyChangeFont
//
//  Created by koudai on 2016/11/27.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: propeties and vars
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", " See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@","learning form 30 Days Swift by Allen","especially thanks to Allen"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    var changeFontBtn: UIButton!
    var testTableView: UITableView!
    var fontOfIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Custom fonts"
        
        self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.8)
        
        testTableView = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 20), size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 220)), style: .plain)
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        testTableView.delegate = self
        testTableView.dataSource = self
        self.view.addSubview(testTableView);
        testTableView.reloadData();
        
        changeFontBtn = UIButton.init(type: .custom)
        changeFontBtn.layer.cornerRadius = 50
        changeFontBtn.clipsToBounds = true
        changeFontBtn.frame = CGRect.init(x: (UIScreen.main.bounds.width - 100)/2, y: UIScreen.main.bounds.height - 150, width: 100, height: 100)
        changeFontBtn.backgroundColor = UIColor.yellow
        changeFontBtn.setTitle("变体", for: .normal)
        changeFontBtn.addTarget(self, action: #selector(changeFontAction(sender:)), for: .touchUpInside)
        changeFontBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(changeFontBtn)
    }

    
    func changeFontAction(sender: UIButton) {
        fontOfIndex += 1;
        if fontOfIndex >= fontNames.count {
            fontOfIndex = 0
        }
        testTableView.reloadData()
    }
    
    // MARK:UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.green
        cell.textLabel?.font = UIFont.init(name: fontNames[fontOfIndex], size: 25)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

