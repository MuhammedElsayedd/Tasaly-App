//
//  DetailsViewController.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/22/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
   var movie: Movie!
    
    @IBOutlet weak var descDetails: UITextView!
    @IBOutlet weak var voteDetails: UILabel!
    @IBOutlet weak var movieDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     //   descDetails.delegate = self
        descDetails.isScrollEnabled = false
        movieDetails.text = movie.title
        
        descDetails.text = movie.overview
   
        voteDetails.text = "\(movie.voteAverage)"
        
        
        if let posterPath = movie.posterPath{
            let url = URL(string: "https://image.tmdb.org/t/p/w500/" + posterPath)
            
            if let url = url{
                imageDetails.kf.indicatorType = .activity
                imageDetails.kf.setImage(with: url)
               
            }
            
        }
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
