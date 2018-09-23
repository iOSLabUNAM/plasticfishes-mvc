//
//  FishesTableViewCell.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/21/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class FishesTableViewCell: UITableViewCell {
    @IBOutlet weak var imageFish: UIImageView!
    @IBOutlet weak var titleFish: UILabel!
    @IBOutlet weak var descriptioFish: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
