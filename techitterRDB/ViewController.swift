//
//  ViewController.swift
//  techitterRDB
//
//  Created by 関川隼人 on 2020/09/21.
//  Copyright © 2020 関川隼人. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController ,UITextFieldDelegate{
    
    let realm = try! Realm()
    
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
    
    @IBAction func toTweet(){
        if nameTextField.text != "" {
            checkName(nameText: nameTextField.text)
            performSegue(withIdentifier: "toTweet", sender: nameTextField.text)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toTweet" {
               let twiiteViewController = segue.destination as! TweetViewController
               twiiteViewController.name = sender as? String
           }
       }
    
    func checkName(nameText:String?){
        if realm.objects(User.self).filter("name == " + nameText!).count == 0  {
            let user = User()
            user.name = nameText!
            
            try! realm.write(){
                realm.add(user)
            }
        }
    }
}

