//
//  FilmlerDaoRepository.swift
//  FilmlerApp
//
//  Created by Furkan Cingöz on 12.11.2023.
//

import Foundation
import RxSwift

class FilmlerDaoRepository {
  var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())

  func filmleriYukle() {
    var liste = [Filmler]()

    //Filmler listesine filmlerimizi tanımlıyoruz
    let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24, aciklama: "Zincirsiz, Köle Django’nun Alman asıllı ödül avcısı Dr. King Schultz ile yolunun kesişmesiyle başlıyor. Django, eski efendisini ölü ya da diri ele geçirmek isteyen Schultz ile anlaşmaya varır ve özgürlüğü karşısında Brittle kardeşleri kendisine getirme sözü verir. Görev başarıyla tamamlanır ama ikilinin yolları ayrılmaz Schultz ve Django beraber Güney’in en çok aranan suçlularının peşine düşerler… ‘Avlanma’ hünerini her geçen gün geliştiren Django’nun artık tek bir hedefi vardır: köle ticareti yüzünden kaybettiği eşi Broomhilda’yı bulmak ve onu kurtarmak... Bu hedef onları kötü şöhretli “Candyland” çiftliğine ve çiftliğin sahibi olan Calvin Candie’ye götürecektir. Sinemanın dahi çocuğu, Oscarlı Quentin Tarantino'nun uzun süre üzerinde çalıştığı Spagetti Western türündeki projenin başrollerinde Jamie Foxx, Christoph Waltz yer alırken, Kerry Washington, Leonardo DiCaprio ve Samuel Jackson gibi yıldızlardan oluşan oyuncu kadrosu göz dolduruyor.")
    let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32, aciklama: "Yıldızlararası'nda, teknik bilgisi ve becerisi yüksek olan Cooper, geniş mısır tarlalarında çiftçilik yaparak geçinmektedir; amacı iki çocuğuna güvenli bir hayat sunmaktır. Onlarla yaşayan Büyükbaba Donald çocuklara göz kulak olurken, henüz 10 yaşındaki kızı Murph şaşırtıcı bir zekaya sahiptir. Geçmişte bıraktığı biliminsanı kariyerini özleyen Cooper'un karşısına bir gün beklenmedik bir teklif çıkar ve ailesinin, dahası insanlığın güvenliği için zorlu bir karar alması gerekir...")
    let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16, aciklama: "Leonardo DiCaprio bu yapımda, çok yetenekli bir hırsız olan Dom Cobb ile karşımızda. Uzmanlık alanı, zihnin en karanlık ve savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır. Cobb'un bu nadir insanlarda görülebilecek yeteneği, bu ender rastgelinebilecek mahareti, onu kurumsal casusluğun tehlikeli yeni dünyasında aranan bir oyuncu yapmıştır. Aynı zamanda bu durum onu uluslararası bir kaçak yapmış ve sevdiği herşeye malolmuştur. Cobb'a içinde bulunduğu durumdan kurtulmasını sağlayacak bir fırsat sunulur. Ona hayatını geri verebilecek son bir iş; tabi eğer imkansız 'başlangıç'ı tamamlayabilirse. Mükemmel soygun yerine, Cobb ve takımındaki profesyoneller bu sefer tam tersini yapmak zorundadır; görevleri bir fikri çalmak değil onu yerleştirmektir. Eğer başarırlarsa, mükemmel suç bu olacaktır.")
    let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28, aciklama: "Western türündeki film, İç Savaş'ın bitmesinden altı, sekiz ya da 12 yıl sonra, bir grup yabancının, tipiden kurtulmak için dağdaki bir konaklama yerine sığınmasını ve gizli bağlılıkların hayatta kalmalarını tehdit ettiğini anlamalarını konu ediyor. The Hateful Eight’te bir posta arabası, kış soğuğu yaşayan Wyoming’den geçer. Yolcular, cellat John Ruth ve yakaladığı kaçak Daisy Domergue, Domergue'nun adalete teslim edilmesi için Ruth'un Cellat olarak bilindiği Red Rock kasabasına hızla yol alır. Yolda iki yabancıyla tanışırlar: Biri, kötü şöhretli bir ödül avcısı olan, zenci bir eski federasyon askeri Binbaşı Marquis Warren ve diğeri de kasabanın şerifi olduğunu iddia eden güneyli haydut Chris Mannix. Tipide yollarını kaybeden Ruth, Domergue, Warren ve Mannix, bir dağ geçidindeki konaklama yeri olan Minnie's Haberdashery'ye sığınır. Minnie's'e vardıklarında onları mekânın sahibi değil, dört yabancı karşılar: Minnie annesini ziyaret ederken Minnie's'e göz kulak olan Bob, Red Rock celladı Oswaldo Mobray, Kovboy Joe Gage ve Müttefik Sanford Smithers. Fırtına, dağdaki konaklama yerini etkisi altına alırken, sekiz gezginimiz, Red Rock'a hiç varamayabileceklerini öğrenir.")
    let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18, aciklama: "Piyanist, İkinci Dünya Savaşı sırasında yaşanan gerçek bir dramı konu alır. Polonya’lı ünlü piyanist Wladyslaw Szpilman’ın anılarını anlattığı aynı isimli kitaptan sinemaya uyarlanan film, Nazi işgali altındaki Polonya’da yaşamanın imkansızlaştırıldığı bir dönemde, bir şekilde esir kampına gitmekten kurtulan ünlü piyanistin Varşova’nın kenar mahallelerindeki hayatta kalma mücadelesine odaklanır. Varoşlarda tam anlamıyla sefil bir hayat süren müzisyen, diğer halkla birlikte, kıtlığa ve aşağılanmalara maruz kalsa da kahramanca mücadele edecektir. Günü gelip oradan kaçma şansı bulduğundaysa başkentin harabelerine sığınacak, beklemediği bir anda gelen bir yardımla umudunu yeniden kazanacaktır.Film, En İyi Erkek Oyuncu dalında Oscar alan Adrien Brody'nin de filmografisinin en güçlü işlerinden biri.")
    let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10, aciklama: "Nuri Bilge Ceylan, bu filmiyle kentsel kaygılarını bir kenara bırakıp, tekrar taşranın sıkıntılı dünyasına ama bu sefer bir cinayet hikayesinin gerilimi ile dönüyor... Bir doktor ile bir savcının 12 saatlik gerilimli öyküsünün peliküle aktarıldığı filmin başrollerinde Muhammet Uzuner, Yılmaz Erdoğan ve Taner Birsel yer alıyor. Senaryoda Ebru ve Nuri Bilge Ceylan'ın yanı sıra Ercan Kesal'ın da imzası var. Yolların tek düzeliği ve kasabanın insana yeni bir şey sunmamasının sıradanlığını fona alan Bir Zamanlar Anadolu'da adıyla da klasiklere gönderme taşıyor. Bu sene Cannes'da Altın Palmiye için yarışan film, Nuri Bilge Ceylan'a Uzak ve Üç Maymun zaferlerinden sonra Cannes'da Büyük Jüri Ödülü'nü de kazandırdı.")
    liste.append(f1)
    liste.append(f2)
    liste.append(f3)
    liste.append(f4)
    liste.append(f5)
    liste.append(f6)
    filmlerListesi.onNext(liste)
  }
}
