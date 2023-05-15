//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nyulas Jozsef on 11.05.2023.
//

import UIKit

class ViewController: UIViewController
{
    enum Turn
    {
        case Zero
        case X
    }
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    let Zero: String = "O"
    let X: String = "X"
    var board = [UIButton]()
    
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initBoard()
       
    }
    
    func initBoard()
    {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    

    func fullBoard() -> Bool
    {
        for iterator in board
        {
            if iterator.title(for: .normal) == nil
            {
                return false
            }
            
        }
        
        return true
    }
    
    func checkForWiner(argument: String) -> Bool
    {
        if getsymbol(button: a1, currentButtonTitle: argument) && getsymbol(button: a2, currentButtonTitle: argument) && getsymbol(button: a3, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: b1, currentButtonTitle: argument) && getsymbol(button: b2, currentButtonTitle: argument) && getsymbol(button: b3, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: c1, currentButtonTitle: argument) && getsymbol(button: c2, currentButtonTitle: argument) && getsymbol(button: c3, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: a1, currentButtonTitle: argument) && getsymbol(button: b1, currentButtonTitle: argument) && getsymbol(button: c1, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: a2, currentButtonTitle: argument) && getsymbol(button: b2, currentButtonTitle: argument) && getsymbol(button: c2, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: a3, currentButtonTitle: argument) && getsymbol(button: b3, currentButtonTitle: argument) && getsymbol(button: c3, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: a1, currentButtonTitle: argument) && getsymbol(button: b2, currentButtonTitle: argument) && getsymbol(button: c3, currentButtonTitle: argument)
        {
            return true
        }
        if getsymbol(button: c1, currentButtonTitle: argument) && getsymbol(button: b2, currentButtonTitle: argument) && getsymbol(button: c3, currentButtonTitle: argument)
        {
            return true
        }
        
        
        return false
    }
    
    func getsymbol(button: UIButton, currentButtonTitle: String) -> Bool
    {
        return button.title(for: .normal) == currentButtonTitle
    }
    
    @IBAction func boardTappedAction(_ sender: UIButton)
    {
        addToBoard(sender)
        
        if checkForWiner(argument: X)
        {
            resultAlert(title: "X won")
        }
        else if checkForWiner(argument: Zero)
        {
            resultAlert(title: "0 won")
        }
        
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String)
    {
        let alertControl = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        alertControl.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) -> () in
            
            self.resetBoard()
        }))
        
        self.present(alertControl, animated: true)
    }
    
    func resetBoard()
    {
         for iterator in board
        {
             iterator.setTitle(nil, for: .normal)
             iterator.isEnabled = true
        }
        
        if firstTurn == Turn.Zero
        {
            firstTurn = Turn.X
            turnLabel.text = X
        }
        else if firstTurn == Turn.X
        {
            firstTurn = Turn.Zero
            turnLabel.text = Zero
        }
        
        currentTurn = firstTurn
        
       
    }
    
    func addToBoard(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(currentTurn == Turn.Zero)
            {
                sender.setTitle(Zero, for: .normal)
                currentTurn = Turn.X
                turnLabel.text = X
            }
            
            else if(currentTurn == Turn.X)
            {
                sender.setTitle(X, for: .normal)
                currentTurn = Turn.Zero
                turnLabel.text = Zero
            }
            
            //to remove the animation of the button after clicked
            sender.isEnabled = false
        }
            
    }
    
}

