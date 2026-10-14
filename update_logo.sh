#!/bin/bash

# Pastikan script dijalankan sebagai administrator (root)
if [ "$EUID" -ne 0 ]; then
  echo "Harap jalankan script ini menggunakan sudo"
  exit
fi

echo "Mengunduh logo OwlOS OSE terbaru dari GitHub..."

# Nanti, ganti 'username' dengan username GitHub Anda 
# dan pastikan URL ini adalah URL 'Raw' dari file logo.png Anda
URL_LOGO="[https://raw.githubusercontent.com/Dwyyulianto/owlos-ose-assets/main/logo.tga](https://raw.githubusercontent.com/Dwyyulianto/owlos-ose-assets/main/logo.png)"

# Ganti direktori ini dengan lokasi boot logo sebenarnya di Raspberry Pi Anda
LOKASI_TUJUAN="/usr/share/plymouth/themes/custom-theme/logo.png" 

# Perintah untuk mengunduh dan menimpa file lama
wget -O $LOKASI_TUJUAN $URL_LOGO

if [ $? -eq 0 ]; then
    echo "Logo OwlOS OSE berhasil diunduh dan dipasang!"

    echo "Memperbarui initramfs (mohon tunggu sebentar)..."
    update-initramfs -u

    echo "Selesai. Silakan jalankan 'sudo reboot' untuk melihat logo baru."
else
    echo "Gagal mengunduh logo. Periksa koneksi internet atau URL GitHub Anda."
fi
