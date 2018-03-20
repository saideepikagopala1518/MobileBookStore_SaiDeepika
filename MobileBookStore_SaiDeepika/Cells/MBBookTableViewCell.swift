//
//  MBBookTableViewCell.swift
//  MobileBookStore_SaiDeepika
//
//  Created by Minnie . on 3/20/18.
//  Copyright © 2018 sample. All rights reserved.
//

import UIKit

class MBBookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
