//
//  RFDownMenu.swift
//  RFDownMenu
//
//  Created by 冯剑 on 2019/4/26.
//  Copyright © 2019 aomiao. All rights reserved.
//

import UIKit

class RFDownMenu: UIView {
    private var needShow=true
    private var btnArray = [UIButton]()
    var currentBtn:UIButton?
    var itemViews = [UIView]()
    var titles:[String]!{
        didSet{
            setTitleBtns()
        }
    }
    
    lazy var blackBg:UIView={
        let v = UIButton(frame: UIScreen.main.bounds)
        v.backgroundColor = .black
        v.alpha = 0.3
        v.addTarget(self, action: #selector(closeItemView), for: .touchUpInside)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        
    }
    
    func setTitleBtns(){
        let btnW = NSInteger(UIScreen.main.bounds.width) / titles.count
        for  i in 0..<titles.count{
            let btn = UIButton(frame: CGRect(x: i*btnW , y:0, width: btnW, height: Int(self.frame.size.height)))
            btn.setTitleColor(.black, for: .normal)
            btn.setTitle(titles[i], for: .normal)
            addSubview(btn)
            btn.addTarget(self, action: #selector(clickItemTitle), for: .touchUpInside)
            btnArray.append(btn)
        }
    }
    
    @objc func closeItemView(){
        clickItemTitle(btn: currentBtn!)
    }
    
    @objc func clickItemTitle(btn:UIButton){
        let clickIndex = btnArray.index(of:btn)!
        
        if currentBtn == btn {
            showItemViewTag(view: itemViews[clickIndex])
            return
        }
        
        for v:UIView in itemViews{
            v.removeFromSuperview()
        }
        
        needShow = true
        let currentView = itemViews[clickIndex]
        showItemViewTag(view: currentView)
        currentBtn = btn
    }

    func showItemViewTag(view:UIView){
        if  self.needShow {
            self.superview?.addSubview(blackBg)
            self.superview?.addSubview(view)
            self.superview?.bringSubviewToFront(self)
            UIView.animate(withDuration: 0.2, animations: {
                self.blackBg.alpha = 0.3
                var f = view.frame
                f.origin.y = self.frame.origin.y+self.frame.size.height
                view.frame = f
                
            }) { (_) in
                self.needShow = false
            }
        }else{
            UIView.animate(withDuration: 0.2, animations: {
                self.blackBg.alpha = 0
                var f = view.frame
                f.origin.y = -f.size.height
                view.frame = f
            }) { (_) in
                self.needShow = true
                self.blackBg.removeFromSuperview()
                view.removeFromSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
