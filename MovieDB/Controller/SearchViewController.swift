//
//  SearchViewController.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/18/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate , UISearchBarDelegate, UISearchControllerDelegate,UISearchResultsUpdating{
    
    
    
    @IBOutlet weak var romanceBtn: UIButton!
    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var comedyBtn: UIButton!
    
    @IBOutlet weak var searchBarr: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex = 0
    var searchController:UISearchController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        getMovies()
    }
    
  
    func getMovies(){
        
        getMovieList(query: (navigationItem.searchController?.searchBar.text)!) { (movie, error) in
            MovieModel.watch = movie
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        romanceBtn.layer.cornerRadius = 8
        actionBtn.layer.cornerRadius = 8
        comedyBtn.layer.cornerRadius = 8

        romanceBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        actionBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        comedyBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)

        romanceBtn.layer.borderWidth = 0.2
        actionBtn.layer.borderWidth = 0.2
        comedyBtn.layer.borderWidth = 0.2
    }
    
    
   
    

    
    
    func getMovieList( query: String , completion: @escaping ([Movie], Error?) -> Void) {
        
       
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=e491b25f0db6d1e35955a8c7bb5cb33d" + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data else {
                    completion([], error)
                    return
                }
                let decoder = JSONDecoder()
                do {
                   let responseObject = try decoder.decode(MovieResults.self, from: data)
                    completion(responseObject.results, nil)
                   // print("howa daaaaaa\(responseObject)")
                    
                } catch {
                    completion([], error)
                }
            }
           task.resume()
            }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hahahahhahahahahahhahahahah\(MovieModel.watch.count)")
        return MovieModel.watch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCell=tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        let movie = MovieModel.watch[indexPath.row]
        cell.movieName.text = movie.title
        cell.movieDescription.text = movie.overview
        
        if let posterPath = movie.posterPath{
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + posterPath)
            
            if let url = url{
                cell.movieImage.kf.indicatorType = .activity
                cell.movieImage.kf.setImage(with: url)
            }
            
        }
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "showDetails" {
               let detailVC = segue.destination as! DetailsViewController
               detailVC.movie = MovieModel.watch[selectedIndex]
           }
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectedIndex = indexPath.row
       performSegue(withIdentifier: "showDetails", sender: nil)
       tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
        }
    
    
    @IBAction func romancePressed(_ sender: UIButton) {
        self.romanceBtn.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.4980392157, blue: 0.5450980392, alpha: 1)
        self.actionBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          self.comedyBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
         self.romanceBtn.setTitleColor(#colorLiteral(red: 0.9842502475, green: 0.9800681472, blue: 1, alpha: 1), for: .normal)
         self.actionBtn.setTitleColor(#colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1), for: .normal)
         self.comedyBtn.setTitleColor(#colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1), for: .normal)
        
        romanceBtn.layer.cornerRadius = 8
        actionBtn.layer.cornerRadius = 8
        comedyBtn.layer.cornerRadius = 8
        
        romanceBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        actionBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        comedyBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        
        romanceBtn.layer.borderWidth = 0
        actionBtn.layer.borderWidth = 0.2
        comedyBtn.layer.borderWidth = 0.2
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        self.romanceBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          self.actionBtn.backgroundColor = #colorLiteral(red: 0.1237549856, green: 0.4980674982, blue: 0.5450001359, alpha: 1)
          self.comedyBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
         self.romanceBtn.setTitleColor(#colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1), for: .normal)
         self.actionBtn.setTitleColor(#colorLiteral(red: 0.9842502475, green: 0.9800681472, blue: 1, alpha: 1), for: .normal)
         self.comedyBtn.setTitleColor(#colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1), for: .normal)
        
        romanceBtn.layer.cornerRadius = 8
        actionBtn.layer.cornerRadius = 8
        comedyBtn.layer.cornerRadius = 8
        
        romanceBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        actionBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        comedyBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        
        romanceBtn.layer.borderWidth = 0.2
        actionBtn.layer.borderWidth = 0
        comedyBtn.layer.borderWidth = 0.2
    }
    
    @IBAction func comedyPressed(_ sender: UIButton) {
        self.romanceBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          self.actionBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          self.comedyBtn.backgroundColor = #colorLiteral(red: 0.1237549856, green: 0.4980674982, blue: 0.5450001359, alpha: 1)
         self.romanceBtn.setTitleColor(#colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1), for: .normal)
         self.actionBtn.setTitleColor(#colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1), for: .normal)
         self.comedyBtn.setTitleColor(#colorLiteral(red: 0.9842502475, green: 0.9800681472, blue: 1, alpha: 1), for: .normal)
        
        romanceBtn.layer.cornerRadius = 8
        actionBtn.layer.cornerRadius = 8
        comedyBtn.layer.cornerRadius = 8
        
        romanceBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        actionBtn.layer.borderColor = #colorLiteral(red: 0.4719370008, green: 0.4769336581, blue: 0.6074222922, alpha: 1)
        comedyBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        romanceBtn.layer.borderWidth = 0.2
        actionBtn.layer.borderWidth = 0.2
        comedyBtn.layer.borderWidth = 0
    }
    
}
struct MovieModel {
    static var watch = [Movie]()
}
