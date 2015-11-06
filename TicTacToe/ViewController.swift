//
//  ViewController.swift
//  TicTacToe
//
//  Created by Philip Bouman on 02-11-15.
//  Copyright © 2015 Philip Bouman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!

    @IBOutlet weak var userMessage: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var plays = Dictionary<Int,Int>()
    var done = false
    var aiPlay = false
    var twoPlayer = true
    
    @IBAction func resetPressed(sender: AnyObject) {
        reset()
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        if plays[sender.tag] == nil && !aiPlay && !done  {
            changeButton(sender.tag, player: 1)
            if twoPlayer == true {
                aiPlay = true
            }
        }
        winCheck()
        if twoPlayer == true {
            if plays[sender.tag] == nil && aiPlay && !done  {
                changeButton(sender.tag, player: 0)
                aiPlay = false
            }
            winCheck()
        } else {
            aiTurn()
        }
    }
    
    func changeButton(tile: Int, player: Int) {
        plays[tile] = player
        switch tile {
        case 1:
            changeColor(button1, player: player)
        case 2:
            changeColor(button2, player: player)
        case 3:
            changeColor(button3, player: player)
        case 4:
            changeColor(button4, player: player)
        case 5:
            changeColor(button5, player: player)
        case 6:
            changeColor(button6, player: player)
        case 7:
            changeColor(button7, player: player)
        case 8:
            changeColor(button8, player: player)
        case 9:
            changeColor(button9, player: player)
        default:
            changeColor(button1, player: player)
        }
    }
    
    func winCheck() {
        let winner = ["Computer" : 0 , "Player" : 1]
        for(key, value) in winner {
            if ((plays[1] == value && plays[2] == value && plays[3] == value) ||    // TopHori
                (plays[4] == value && plays[5] == value && plays[6] == value) ||    // MidHori
                (plays[7] == value && plays[8] == value && plays[9] == value) ||    // BotHori
                (plays[1] == value && plays[4] == value && plays[7] == value) ||    // LeftVert
                (plays[2] == value && plays[5] == value && plays[8] == value) ||    // MidVert
                (plays[3] == value && plays[6] == value && plays[9] == value) ||    // RightVert
                (plays[1] == value && plays[5] == value && plays[9] == value) ||    // LeftRight
                (plays[3] == value && plays[5] == value && plays[7] == value))      // RightLeft
                {
                    userMessage.text = "Winner:  \(key)"
                    done = true
            }
        }
    }
    
    func aiTurn() {
        if done {
            return
        }
        aiPlay = false
    }
    
    func reset() {
        plays = [:]
        done = false
        userMessage.text = ""
        button1.setTitle("", forState: .Normal)
        button2.setTitle("", forState: .Normal)
        button3.setTitle("", forState: .Normal)
        button4.setTitle("", forState: .Normal)
        button5.setTitle("", forState: .Normal)
        button6.setTitle("", forState: .Normal)
        button7.setTitle("", forState: .Normal)
        button8.setTitle("", forState: .Normal)
        button9.setTitle("", forState: .Normal)
    }
    
    func changeColor(buttonName: UIButton, player: Int) {
        let buttonText = player == 1 ? "X" : "O"
//        buttonName.enabled = false
        buttonName.setTitle(buttonText, forState: .Normal)
        buttonName.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        buttonName.backgroundColor = UIColor.redColor()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

