//
//  ViewController.swift
//  POPProgrammingTry
//
//  Created by fernando on 2017/1/3.
//  Copyright © 2017年 fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        URLSessionClient().send(UserRequest(name: "onevcat")) { user in
            if let user = user {
                print("\(user.message), \(user.name)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

