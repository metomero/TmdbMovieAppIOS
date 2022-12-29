//
//  TableViewCell.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 28.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieCategory: UILabel!
    
    @IBOutlet weak var movieDate: UILabel!
    
    @IBOutlet weak var movieAverage: UILabel!
    
    static let identifier = "TableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(with movie : Movie){
        movieName.text = movie.title
        movieImage.downloaded(from: Endpoints.getPosterUrl(with: movie.posterPath))
        movieCategory.text = Genre.createGenreString(with: movie.genreIDS)
        movieDate.text = movie.releaseDate
        movieAverage.text = String(movie.voteAverage)
    }
    
}
