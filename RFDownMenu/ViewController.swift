//
//  ViewController.swift
//  RFDownMenu
//
//  Created by 冯剑 on 2019/4/26.
//  Copyright © 2019 aomiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 300))
        view1.backgroundColor = UIColor.magenta
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        view2.backgroundColor = UIColor.cyan
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 200))
        view3.backgroundColor = UIColor.brown
        
        
        let menu = RFDownMenu(frame:CGRect(x: 0, y: 80, width: 375, height: 50))
        menu.titles = ["1111","2222","333"]
        menu.itemViews = [view1, view2, view3]
        view.addSubview(menu)
        
    }


}

