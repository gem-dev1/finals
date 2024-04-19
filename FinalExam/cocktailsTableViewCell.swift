//
//  cocktailsTableViewCell.swift
//  FinalExam
//
//  Created by user239796 on 4/19/24.
//

import UIKit

class cocktailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ctImg: UIImageView!
    @IBOutlet weak var ctName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
