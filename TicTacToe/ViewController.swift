//
//  ViewController.swift
//  TicTacToe
//
//  Created by Simo Haakana on 02/12/2017.
//  Copyright © 2017 Simo Haakana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let subview = self.view.subviews[0]
                
        for subview in self.view.subviews {
            let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.checkAction(sender:)))
            subview.addGestureRecognizer(gesture)
        }
    }
    
    @objc
    func checkAction(sender : UITapGestureRecognizer) {
        if let theLabel = sender.view?.subviews[0] as? UILabel {
            let tag = sender.view!.tag
            let value = self.game.play(cell: tag)
            if (value != "") {
                theLabel.text = value
            }
        }
    }

    @objc
    func someAction(sender: UITapGestureRecognizer){
        print("demo")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

