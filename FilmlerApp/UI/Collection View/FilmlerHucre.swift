//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by Furkan Cingöz on 28.10.2023.
//

import UIKit


//Anasayafada seçilen filmi anlamak için indexpathe ihtiyacımız var önemli
protocol HucreProtocol {
    func sepeteEkleTikla(indexPath:IndexPath)
    
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!

    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    //tetikliyoruz protokolü
    @IBAction func sepeteEkleButton(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikla(indexPath: indexPath!)
    }
}
