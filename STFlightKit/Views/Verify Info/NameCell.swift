//
//  NameCell.swift
//  ShareTrip
//
//  Created by Sharetrip-iOS on 11/26/19.
//  Copyright © 2019 TBBD IOS. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {

    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var nameTitlelabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(imageName: String, titleText: String, subTitleText: String){
        accountImageView.image = UIImage(named: imageName)
        accountImageView.tintColor = .black
        nameTitlelabel.text = titleText
        nameLabel.text = subTitleText
    }
    
}
