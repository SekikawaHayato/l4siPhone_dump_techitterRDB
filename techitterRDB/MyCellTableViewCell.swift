//
//  MyCellTableViewCell.swift
//  techitterRDB
//
//  Created by 関川隼人 on 2020/09/23.
//  Copyright © 2020 関川隼人. All rights reserved.
//

import UIKit
//import RealmSwift

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
