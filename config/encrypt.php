<?php
return[
    'key' => env('AES_SECRET_KEY'),
    'iv' => env('AES_IV'),
    'method' => 'aes-256-cbc'
];