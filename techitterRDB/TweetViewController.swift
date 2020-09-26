//
//  TweetViewController.swift
//  techitterRDB
//
//  Created by 関川隼人 on 2020/09/22.
//  Copyright © 2020 関川隼人. All rights reserved.
//

import UIKit
import RealmSwift

class TweetViewController: UIViewController, UITableViewDataSource,UITextFieldDelegate{

    
    @IBOutlet var name: String!
    @IBOutlet var table: UITableView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        // Do any additional setup after loading the view.
        nameLabel.text = "name : "+name
        textField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Tweet.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let number = realm.objects(Tweet.self).count - 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        cell.nameLabel?.text = realm.objects(Tweet.self)[number - indexPath.row].name
        cell.textsLabel?.text = realm.objects(Tweet.self)[number - indexPath.row].text
        
        return cell
    }
    
    @IBAction func tweetButton(){
        if textField.text != ""{
            let tweet = Tweet()
            tweet.name = self.name
            tweet.text = textField.text!
            try! realm.write(){
                realm.add(tweet)
            }
            textField.text = ""
            table.reloadData()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
