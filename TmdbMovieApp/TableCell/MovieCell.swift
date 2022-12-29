//
//  MovieCell.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 26.12.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieCategory: UILabel!
    
    @IBOutlet weak var movieDate: UILabel!
    
    @IBOutlet weak var movieAverage: UILabel!
    
    static let identifier = "MovieCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MovieCell", bundle: nil)
    }
        

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Call Segue to movie detail page
    }
    
    public func configure(with movie : Movie){
        movieName.text = movie.name
        movieImage.image = UIImage(named: movie.imageName)
        movieCategory.text = movie.category
        movieDate.text = movie.date
        movieAverage.text = movie.average
    }

}
