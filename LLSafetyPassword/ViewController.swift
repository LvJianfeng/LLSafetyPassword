//
//  ViewController.swift
//  LLSafetyPassword
//
//  Created by LvJianfeng on 2017/1/4.
//  Copyright © 2017年 LvJianfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let test = LLSafetyPasswordView.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 400))
        
        view.addSubview(test)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

