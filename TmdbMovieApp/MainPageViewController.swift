//
//  ViewController.swift
//  TmdbMovieApp
//
//  Created by Metehan Ilter on 20.12.2022.
//

import UIKit

class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieTableView: UITableView!
    
    var movies = [Movie]()
    var genres = [Genre]()
    
    var selectedMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlMovie = Endpoints.getMovieURl()
        let genreUrl = Endpoints.getGenresURL()
        
        let task = URLSession.shared.movieResponseModelTask(with: urlMovie) { movieResponseModel, response, error in
            if let movieResponseModel = movieResponseModel {
                self.movies = movieResponseModel.results
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            }
        }
        
        let genreTask = URLSession.shared.genreResponseModelTask(with:  genreUrl) { genreResponseModel, response, error in
             if let genreResponseModel = genreResponseModel {
                 Database.genres = genreResponseModel.genres
                 task.resume()
             }
          }
           genreTask.resume()
        
        
        movieTableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        movieTableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        movieTableView.register(HeaderViewCell.nib(), forCellReuseIdentifier: HeaderViewCell.identifier)
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.identifier, for: indexPath) as! HeaderViewCell
            
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
            
            cell.configure(with: movies)
            
            cell.onMovieClicked = {
                movie in
                self.selectedMovie = movie
                self.performSegue(withIdentifier: "toMovieDetail", sender: nil)
            }
            
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            
            
            cell.configure(with: movies[indexPath.row - 2])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row >= 2){
        self.selectedMovie = self.movies[indexPath.row - 2]
        self.performSegue(withIdentifier: "toMovieDetail", sender: nil)
    }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0 : return 100
        case 1 : return 400
        default : return 92
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toMovieDetail"){
            var dest = (segue.destination as! MovieDetailController)
            dest.movie = self.selectedMovie
        }
    }
}


