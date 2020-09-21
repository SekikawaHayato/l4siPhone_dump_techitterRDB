//
//  ViewController.swift
//  techitterRDB
//
//  Created by 関川隼人 on 2020/09/21.
//  Copyright © 2020 関川隼人. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func toTwiite(){
        performSegue(withIdentifier: "toTweet", sender: nameTextField.text)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toTweet" {
               let twiiteViewController = segue.destination as! TweetViewController
               twiiteViewController.name = sender as? String
           }
       }
}

