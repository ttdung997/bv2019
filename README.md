# Hướng dẫn cài đặt hệ thống web bệnh viện đề tài nghị thư



## Cài đặt laravel
Bước 1: clone poroject về thừ mục /var/www/html/bv
Bước 2: cấu hình các thông số của file env kết nối tới CSDL
Bước 3: import file dabv2.sql vào CSDL trong mysql
Bước 4: cấu hình và cài đặt pakage cho laravel
```
php artisan key:generate 
composer install
composer update
```

## Cấu hình apache virual host 
Bước 1: tạo file virual host
```
sudo cp bv /etc/apache2/site-enable/bv
```
Bước 2: thêm vào /etc/host:
```
127.0.0.1 bv.test
```
Bước 3: cấu hình apache:
```
sudo a2enmod rewrite
sudo service apache2 restart
```
truy cập vào bv.test để chay hệ thống