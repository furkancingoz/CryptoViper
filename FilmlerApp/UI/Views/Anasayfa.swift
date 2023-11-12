//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Furkan Cingöz on 28.10.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    var viewModel = AnasayfaViewModel()// bunu oluşturduğumuzda anasayfa viewmodelde init metodunu çalıştırıyoruz

    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //delegate ve datasource tanımlıyoruz
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        
      _ = viewModel.filmlerListesi.subscribe(onNext: {liste  in
        self.filmlerListesi = liste // listeni güncelledim
        self.filmlerCollectionView.reloadData() // tekrar yükle verileri görüntüle
      })



        //sectionInset = collectin viewimızın etrafında dışa doğru boşlukları kenarlardan cellin arasındaki boşluk olarak düşünebiliriz
        //minimumInteritemSpacing = itemler celler arasındaki boşluk
        //minimumLineitemSpacing = celler arasındaki dikey boşluklar
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing =  10
        tasarim.minimumLineSpacing = 10
        
        //10 x 10 x 10 = 30
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        
        filmlerCollectionView.collectionViewLayout = tasarim

    }


}


//Anasayafya collection view delegate ve data source,hücre protokolü ekledik önemli!!!
extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol{
    //collection viewimizin içerisine filmler listesin elemanları kadar ekranda cell göstermesini söylüyoruz
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    //cellerin içerisindeki filmlerimizin bilgilerini göstermek için filmler hucresini tanımlayıp görsel ve fiyatı değiştirmesini söylüyoruz
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        hucre.imageViewFilm.image = UIImage(named: film.resim!)
        hucre.labelFiyat.text = "\(film.fiyat!)₺"
        
        //hucrenin kenarına bir çizgi görünümü oluşturuyoruz
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.5
        hucre.layer.cornerRadius = 10
        
        //protokole yetki verme
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetayVC", sender: film)
    }
    
    //filtreleme yapıyoruz hangi sayafaya göndericeğimizi burda belirtiyoruz
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let film = sender as? Filmler { //senderı downcastingle filmler nesnesine dönüştürüyoruz
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
            }
        }
    }
    
    //protokolü kullanıyoruz
    func sepeteEkleTikla(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad!) sepetlendi")
    }
}
