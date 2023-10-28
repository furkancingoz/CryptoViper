//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Furkan Cingöz on 28.10.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //delegate ve datasource tanımlıyoruz
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        //Filmler listesine filmlerimizi tanımlıyoruz
        let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24, aciklama: "Zincirsiz, Köle Django’nun Alman asıllı ödül avcısı Dr. King Schultz ile yolunun kesişmesiyle başlıyor. Django, eski efendisini ölü ya da diri ele geçirmek isteyen Schultz ile anlaşmaya varır ve özgürlüğü karşısında Brittle kardeşleri kendisine getirme sözü verir. Görev başarıyla tamamlanır ama ikilinin yolları ayrılmaz Schultz ve Django beraber Güney’in en çok aranan suçlularının peşine düşerler… ‘Avlanma’ hünerini her geçen gün geliştiren Django’nun artık tek bir hedefi vardır: köle ticareti yüzünden kaybettiği eşi Broomhilda’yı bulmak ve onu kurtarmak... Bu hedef onları kötü şöhretli “Candyland” çiftliğine ve çiftliğin sahibi olan Calvin Candie’ye götürecektir. Sinemanın dahi çocuğu, Oscarlı Quentin Tarantino'nun uzun süre üzerinde çalıştığı Spagetti Western türündeki projenin başrollerinde Jamie Foxx, Christoph Waltz yer alırken, Kerry Washington, Leonardo DiCaprio ve Samuel Jackson gibi yıldızlardan oluşan oyuncu kadrosu göz dolduruyor.")
        let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32, aciklama: "Yıldızlararası'nda, teknik bilgisi ve becerisi yüksek olan Cooper, geniş mısır tarlalarında çiftçilik yaparak geçinmektedir; amacı iki çocuğuna güvenli bir hayat sunmaktır. Onlarla yaşayan Büyükbaba Donald çocuklara göz kulak olurken, henüz 10 yaşındaki kızı Murph şaşırtıcı bir zekaya sahiptir. Geçmişte bıraktığı biliminsanı kariyerini özleyen Cooper'un karşısına bir gün beklenmedik bir teklif çıkar ve ailesinin, dahası insanlığın güvenliği için zorlu bir karar alması gerekir...")
        let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16, aciklama: "Leonardo DiCaprio bu yapımda, çok yetenekli bir hırsız olan Dom Cobb ile karşımızda. Uzmanlık alanı, zihnin en karanlık ve savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır. Cobb'un bu nadir insanlarda görülebilecek yeteneği, bu ender rastgelinebilecek mahareti, onu kurumsal casusluğun tehlikeli yeni dünyasında aranan bir oyuncu yapmıştır. Aynı zamanda bu durum onu uluslararası bir kaçak yapmış ve sevdiği herşeye malolmuştur. Cobb'a içinde bulunduğu durumdan kurtulmasını sağlayacak bir fırsat sunulur. Ona hayatını geri verebilecek son bir iş; tabi eğer imkansız 'başlangıç'ı tamamlayabilirse. Mükemmel soygun yerine, Cobb ve takımındaki profesyoneller bu sefer tam tersini yapmak zorundadır; görevleri bir fikri çalmak değil onu yerleştirmektir. Eğer başarırlarsa, mükemmel suç bu olacaktır.")
        let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28, aciklama: "Western türündeki film, İç Savaş'ın bitmesinden altı, sekiz ya da 12 yıl sonra, bir grup yabancının, tipiden kurtulmak için dağdaki bir konaklama yerine sığınmasını ve gizli bağlılıkların hayatta kalmalarını tehdit ettiğini anlamalarını konu ediyor. The Hateful Eight’te bir posta arabası, kış soğuğu yaşayan Wyoming’den geçer. Yolcular, cellat John Ruth ve yakaladığı kaçak Daisy Domergue, Domergue'nun adalete teslim edilmesi için Ruth'un Cellat olarak bilindiği Red Rock kasabasına hızla yol alır. Yolda iki yabancıyla tanışırlar: Biri, kötü şöhretli bir ödül avcısı olan, zenci bir eski federasyon askeri Binbaşı Marquis Warren ve diğeri de kasabanın şerifi olduğunu iddia eden güneyli haydut Chris Mannix. Tipide yollarını kaybeden Ruth, Domergue, Warren ve Mannix, bir dağ geçidindeki konaklama yeri olan Minnie's Haberdashery'ye sığınır. Minnie's'e vardıklarında onları mekânın sahibi değil, dört yabancı karşılar: Minnie annesini ziyaret ederken Minnie's'e göz kulak olan Bob, Red Rock celladı Oswaldo Mobray, Kovboy Joe Gage ve Müttefik Sanford Smithers. Fırtına, dağdaki konaklama yerini etkisi altına alırken, sekiz gezginimiz, Red Rock'a hiç varamayabileceklerini öğrenir.")
        let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18, aciklama: "Piyanist, İkinci Dünya Savaşı sırasında yaşanan gerçek bir dramı konu alır. Polonya’lı ünlü piyanist Wladyslaw Szpilman’ın anılarını anlattığı aynı isimli kitaptan sinemaya uyarlanan film, Nazi işgali altındaki Polonya’da yaşamanın imkansızlaştırıldığı bir dönemde, bir şekilde esir kampına gitmekten kurtulan ünlü piyanistin Varşova’nın kenar mahallelerindeki hayatta kalma mücadelesine odaklanır. Varoşlarda tam anlamıyla sefil bir hayat süren müzisyen, diğer halkla birlikte, kıtlığa ve aşağılanmalara maruz kalsa da kahramanca mücadele edecektir. Günü gelip oradan kaçma şansı bulduğundaysa başkentin harabelerine sığınacak, beklemediği bir anda gelen bir yardımla umudunu yeniden kazanacaktır.Film, En İyi Erkek Oyuncu dalında Oscar alan Adrien Brody'nin de filmografisinin en güçlü işlerinden biri.")
        let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10, aciklama: "Nuri Bilge Ceylan, bu filmiyle kentsel kaygılarını bir kenara bırakıp, tekrar taşranın sıkıntılı dünyasına ama bu sefer bir cinayet hikayesinin gerilimi ile dönüyor... Bir doktor ile bir savcının 12 saatlik gerilimli öyküsünün peliküle aktarıldığı filmin başrollerinde Muhammet Uzuner, Yılmaz Erdoğan ve Taner Birsel yer alıyor. Senaryoda Ebru ve Nuri Bilge Ceylan'ın yanı sıra Ercan Kesal'ın da imzası var. Yolların tek düzeliği ve kasabanın insana yeni bir şey sunmamasının sıradanlığını fona alan Bir Zamanlar Anadolu'da adıyla da klasiklere gönderme taşıyor. Bu sene Cannes'da Altın Palmiye için yarışan film, Nuri Bilge Ceylan'a Uzak ve Üç Maymun zaferlerinden sonra Cannes'da Büyük Jüri Ödülü'nü de kazandırdı.")
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
        
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

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource{
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
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad!) seçildi")
        performSegue(withIdentifier: "toDetayVC", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let film = sender as? Filmler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
            }
        }
    }
}
