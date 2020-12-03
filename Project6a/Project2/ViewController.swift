//
//  ViewController.swift
//  Project2
//
//  Created by Christian James Welly on 1/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var target: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    let MAX_ROUNDS = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        // Probably should use something other than `.action`
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(checkScore))
        askQuestion()

    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        questionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let correctCountry = countries[correctAnswer].uppercased()
        title = "Round \(questionsAsked) of \(MAX_ROUNDS)"
        target.text = correctCountry
        
    }
    
    @objc func checkScore() {
        
        let message = "Your score is: \(score)"
        
        let ac = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Close", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func checkEndGame(action: UIAlertAction! = nil) {
        if (questionsAsked == MAX_ROUNDS) {
            let title = "You have finished \(questionsAsked) games!"
            let message = "Your final score is \(score)"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: askQuestion))
            questionsAsked = 0
            score = 0
            
            present(ac, animated: true)
        } else {
            askQuestion(action: action)
        }
    }
    
    // MARK: Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            let chosenFlag = countries[sender.tag].uppercased()
            title = "Wrong! That's a flag of \(chosenFlag)"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: checkEndGame))
        
        present(ac, animated: true)
    }
    
    


}

