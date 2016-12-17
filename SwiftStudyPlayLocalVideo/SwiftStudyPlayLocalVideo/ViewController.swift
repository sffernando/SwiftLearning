//
//  ViewController.swift
//  SwiftStudyPlayLocalVideo
//
//  Created by koudai on 2016/11/27.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    var videoTableView: UITableView!
    let dataSource = [["image":"videoScreenshot01", "title":"Introduce 3DS Mario","time":"Youtube - 06:32"],
                      ["image":"videoScreenshot02", "title":"Emoji Among Us", "time":"Vimeo - 3:34"],
                      ["image":"videoScreenshot03", "title":"Seals Documentary", "time":"Vine - 00:06"],
                      ["image":"videoScreenshot04", "title":"Adventure Time", "time":"Youtube - 02:39"],
                      ["image":"videoScreenshot05", "title":"Facebook HQ", "time":"Facebook - 10:20"],
                      ["image":"videoScreenshot06", "title":"Lijiang Lugu Lake", "time":"Allen - 20:30"]];
    let array = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        videoTableView = UITableView(frame: CGRect.init(x: 0, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 20), style: .plain)
        videoTableView.register(UINib.init(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        self.view.addSubview(videoTableView)
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.onButtonTapped = {
            [weak self] in
            if let strongSelf = self {
                let path = Bundle.main.path(forResource: "emoji_zone", ofType: "mp4")
                strongSelf.playerView = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
                strongSelf.playViewController.player = strongSelf.playerView
                strongSelf.present(strongSelf.playViewController, animated: true, completion: {
                    strongSelf.playViewController.player?.play()
                })
            }
        }
        let data = self.dataSource[indexPath.row]
        cell.movieImageView.image = UIImage.init(named: data["image"]!)
        cell.videoNameLabel.text = data["title"]!
        cell.videoTimeLabel.text = data["time"]!
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

