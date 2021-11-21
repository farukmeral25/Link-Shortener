# grisoftware

A new Flutter project.

## Getting Started

Öncelikle projeyi core, feature olarak ayırdım. 
Feature'da sayfalarımızı, core'da ise component,function,init,usecase gibi yapılarımızı tuttuk. 
Böylece core katmanıyla feature katmanını ayırdık. 
Sonrasında sayfalarımız için klasörleme yaptık. Böylece aradığımız şeyi bulmak için o klasöre gidebilmeyi kolayca 
ulaşılabilir kıldık. 
Home klasör yapımızda data domain view ve viewmodel yapılarını tuttuk. Burada amacımız her işlemin kendi yerinde
yapılmasını sağlamak. 
Örneğin view'da logic işlemlerin yapılmaması gerektiği gibi
Logic işlemlerimizi viewmodel'a taşıdık.
Bunun dışında UrlModel ve UrlEntity kavramlarımız var domain ve data içerisinde. 
Bununla amaçlanan her bir classın tek bir iş yapmasını sağlamaktı ve öyle de oldu.
Repolarımız ile her işlemi ayırmayı hedefledik. 
Böylece her repo kendisine has işlemi yapıyor.
RemoteDataSource'da ise api bağlantılarımızın bulunduğu alan. 
Bu alan yanlızca internetle iletişimde kullanılıyor.
Normalde bir de LocalDataSource için yazılabilir. Uygulama verilerimizi telefon kapandığı durumda dahi tutmak istersek
böyle bir işlem yapabiliriz.
ScreenSize ile ekranın boyutunu alarak her yerden ulaşılabilir kıldık.
ScreenSize'da Singleton Pattern kullanılmıştır.
Constant'ta theme ve assetlerimizi tutuyoruz.
Function'da uygulama genelinde kullanılan functionlar tutulabilir.
Uygulamanın yer yerinde kullanılacak olan sabit bir buton için örneğin; core'da bir klasör açarak widgetları orada toplayıp sadece oradan çağırabiliriz.
init'te uygulamamızda bulunan serviceleri bir arada toplayarak. Servislerimize uygulamanın her yerinden ulaşılabilir kıldık.
Usecase'ler ile nasıl bir iletişim sunulduğunu daha belirgin güzel bir şekilde anlattık.
Eksik bir şey kalması veya aklınızda soru kalması dahilinde arayarak veya mail yoluyla iletişime geçebilirsiniz.
