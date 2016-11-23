//
//  ViewController.swift
//  AnimationWithSnapKit_test
//
//  Created by Hayashi Tsubasa on 11/24/16.
//  Copyright © 2016 Hayashi Tsubasa. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var animatedView: UIView? // Animated View
    var button: UIButton? // Button
    var isOn: Bool = false // Button Flag
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView = UIView()
        animatedView?.backgroundColor = UIColor.red
        self.view.addSubview(animatedView!)
        animatedView?.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        button = UIButton()
        button?.backgroundColor = UIColor.blue
        button?.setTitle("button", for: .normal)
        button?.addTarget(self, action: #selector(ViewController.onButton(_:)), for: .touchUpInside)
        self.view.addSubview(button!)
        button?.snp.makeConstraints({ (make) in
            make.top.equalTo(50)
            make.centerX.equalToSuperview()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onButton(_ sender: UIButton) {
        if !self.isOn {
            self.isOn = true
            // reset constraint
            animatedView?.snp.remakeConstraints({ (make) in
                make.bottom.equalToSuperview().offset(-10)
                make.centerX.equalToSuperview()
                make.width.equalTo(50)
                make.height.equalTo(50)
            })
            UIView.animate(withDuration: 1.0, animations: {
                // call layoutIfNeeded SuperView of animatedView
                self.view.layoutIfNeeded()
            })
        } else {
            self.isOn = false
            animatedView?.snp.remakeConstraints({ (make) in
                make.center.equalToSuperview()
                make.width.equalTo(200)
                make.height.equalTo(200)
            })
            UIView.animate(withDuration: 1.0, animations: {
                // call layoutIfNeeded SuperView of animatedView
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    
}

