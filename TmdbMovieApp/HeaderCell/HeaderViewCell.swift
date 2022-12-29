//
//  HeaderViewCell.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 28.12.2022.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    static var identifier = "HeaderViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "HeaderViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
