//
//  InfoCollectionViewController.swift
//  SwiftLerningCollectionview
//
//  Created by koudai on 2016/11/30.
//  Copyright © 2016年 fernando. All rights reserved.
//

import UIKit

private let reuseIdentifier = "InfoCollectionViewCell"

class InfoCollectionViewController: UICollectionViewController {

    var infos = [InfoBean]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        loadInfos()
        
        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func loadInfos() {
        let info1 = InfoBean.init(photo: UIImage.init(named: "hello")!, info: "Hello there, you are great")!
        let info2 = InfoBean.init(photo: UIImage.init(named: "bodyline")!, info: "Hello there, you are great")!
        let info3 = InfoBean.init(photo: UIImage.init(named: "dudu")!, info: "Hello there, you are great")!
        let info4 = InfoBean.init(photo: UIImage.init(named: "darkvarder")!, info: "Hello there, you are great")!
        let info5 = InfoBean.init(photo: UIImage.init(named: "hhhhh")!, info: "Hello there, you are great")!
        let info6 = InfoBean.init(photo: UIImage.init(named: "run")!, info: "Hello there, you are great")!
        let info7 = InfoBean.init(photo: UIImage.init(named: "wave")!, info: "Hello there, you are great")!
        infos += [info1, info2, info3, info4, info5, info6, info7]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return infos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InfoCollectionViewCell
        cell.infoBean = infos[indexPath.row]
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
