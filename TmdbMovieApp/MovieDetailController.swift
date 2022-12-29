//
//  MovieDetailController.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 29.12.2022.
//

import UIKit

class MovieDetailController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitle.text = movie!.title
        movieImage.downloaded(from: URL(string: "https://image.tmdb.org/t/p/w500/\(movie!.posterPath)")!)
        movieCategory.text = Genre.createGenreString(with: movie!.genreIDS)
        movieDate.text = movie?.releaseDate
        movieDescription.text = movie!.overview
        
    }

}
