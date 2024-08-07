# Translate Uygulaması

Bu Swift kodları, Translate-1.0 uygulamasının çeşitli bölümlerini oluşturan bileşenlerdir. Uygulama, kullanıcıların metinlerini tercüme etmelerini sağlar. Her bir kod bloğu, belirli bir işlevi yerine getirir ve birlikte çalışarak tam bir çeviri uygulaması oluşturur.

## 1. Ana Ekran (ViewController.swift)

Bu kod, kullanıcıların metinlerini girmelerini, çeviri yapmalarını ve sonuçları görüntülemelerini sağlar.

### Özellikler

- **Arayüz Elemanları:**
  - `textField`: Kullanıcının çeviri yapmak istediği metni girdiği metin alanı.
  - `resultLabel`: Çeviri sonucunun görüntülendiği etiket.
  - `translateButton`: Çeviri işlemini başlatan buton.

### Arayüz Elemanları Ayarları

- `setupUI`: Arayüz elemanlarının görünümünü ve yerleşimini ayarlar. `textField` için kenarlık stili, placeholder metni ve konumu belirlenir. `translateButton` için başlık, arka plan rengi, köşe yuvarlama ve konum ayarları yapılır. `resultLabel` için hizalama, satır sayısı ve konum ayarları yapılır.

### Çeviri Butonu Tıklandığında

- `translateButtonTapped`: Kullanıcı çeviri butonuna tıkladığında, `textField` içindeki metni alır ve `translate` fonksiyonunu çağırır. Boş metin girilmişse işlem yapılmaz.

### Çeviri İşlevi

- `translate`: Girilen metni alır ve çeviri API'sine istek gönderir. API'den gelen çeviri sonucunu `resultLabel` üzerinde gösterir. Hatalı istek veya JSON ayrıştırma hataları durumunda ilgili hataları konsola yazdırır.

### Ağ İsteği ve JSON İşleme

- `translate`: Çeviri işlemi için gerekli HTTP başlıklarını ve parametrelerini ayarlar. API isteği gönderir ve gelen yanıtı JSON formatında ayrıştırır. Başarılı bir çeviri durumunda çeviri sonucunu `resultLabel` üzerinde görüntüler.

---
![Uploading Simulator Screen Recording - iPhone 15 Pro - 2024-08-07 at 19.03.43.gif…]()
