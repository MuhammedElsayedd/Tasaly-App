//
//  MyCell.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/18/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
