//
//  AnasayfaViewModel.swift
//  FilmlerApp
//
//  Created by Furkan Cingöz on 12.11.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
  var frepo = FilmlerDaoRepository()
  var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())

  init(){
    filmlerListesi = frepo.filmlerListesi //burda ve repodaki filmler listesini birbirine bağladık
    filmleriYukle()
  }

  func filmleriYukle() {
    frepo.filmleriYukle()
  }
}
