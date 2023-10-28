//
//  DetaySayfa.swift
//  FilmlerApp
//
//  Created by Furkan Cingöz on 28.10.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var aciklamaLabel: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var labelFilm: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = film {
            labelFilm.text = f.ad
            imageFilm.image = UIImage(named: f.resim!)
            labelFiyat.text = "\(f.fiyat!)₺"
            aciklamaLabel.text = f.aciklama
        }
    }
    

    
}
