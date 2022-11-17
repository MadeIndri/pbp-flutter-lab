## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
* Stateless widget adalah widget yang statis atau tidak pernah berubah. Widget jenis ini di-build hanya dengan konfigurasi yang diinisiasi sejak awal dan tidak memiliki setState() sehingga interaksinya terbatas.
* Statefull widget adalah widget yang dinamis atau dapat berubah sehingga memiliki interaksi yang tidak terbatas (memiliki setState()), misalnya mengubah tampilan, menambah widget lain, mwngubah nilai suatu variabel, icon, ataupun warna.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Widget yang saya pakai, diantaranya:
* Scaffold : Widget utama untuk membuat sebuah halaman pada flutter untuk membentuk struktur dasar tata letak visual desain
* Appbar : Salah satu property Scaffold, berfungsi untuk membuat aplikasi bar yang ada di atas layar
* Column : Untuk mengatur layout secara vertikal
* Text : Untuk menampilkan sebuah teks biasa 
* FloatingActionButton : Untuk membuat dan menampilkan button
* Padding : Untuk memberikan jarak pada suatu elemen
* Row : Untuk mengatur layout secara horizontal
* Icon : Untuk menampilkan icon
* TextStyle : Untuk mengatur style dari text

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState() adalah memberikan informasi kepada widget bahwa ada perubahan terhadap value sebuah variabel sehingga akan melakukan build ulang pada widget tersebut. Variabel yang terdampak adalah variabel yang memiliki sifat mutable dan terdeklarasi secara global di sebuah class. Contoh pada program yang dibuat adalah variabel _counter yang nilainya akan berubah ketika diklik.

## Jelaskan perbedaan antara const dengan final.
Const dan final merupakan keyword immutable variabel pada Dart. Const digunakan untuk deklarasi variabel yang nilainya konstan dan harus diassign saat compile time berjalan yang berarti variabel tersebut harus sudah diberikan value secara langsung, sedangkan final digunakan untuk variabel yang akan diinisiasi saat pertama kali digunakan dan nilai variabel ini perlu diketahui saat run time. 

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
* Membuat project baru yang bernama counter_7
* Melakukan perubahan pada file main.dart
* Membuat function baru untuk mengurangi nilai counter, yaitu _decrementCounter
* Mengedit teks sehingga akan muncul 'GENAP' jika variabel _counter % 2 == 0 dan 'GANJIL' jika sebaliknya
* Menambahkan style pada text, yaitu warna merah dan biru
* Menambahkan FloatingActionButton untuk menampilakn button
* Mengatur padding untuk FloatingActionButton
