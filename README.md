# back-it-apt: Bütün Paketlərin Əmcəyini Dağıdan Skriptlər

### Giriş
Bu layihə, sistemdəki APT paketlərini ehtiyat nüsxəsini çıxarmaq və lazım gəldikdə yenidən bərpa etmək üçün hazırlanıb. Bəli, hər şey bir düymədədir, nə ola bilər ki?

### Qovluq və Fayl Quruluşu

- `backup.sh`: Paketlərin siyahısını çıxarır. O qədər asandır ki, "Niyə əvvəllər bunu etməmişdim?" deyə biləcəksiniz.
- `restore.sh`: Siyahıdakı paketləri bərpa edir və sonda "Bütün paketlərin əmcəyi dağıldı" deyir. Əlbəttə, bu zarafatdır, amma ciddiyəm.

### İstifadə
Bu skriptləri işə salmazdan əvvəl, Linux-un sizin üçün yaxşı şeylər etdiyinə əmin olun. Yoxsa bir gün qəflətən `restore.sh`-u işlədirsiniz və hər şeyin "əmcəyini dağıdırsınız". 

### Nəticə
Bu kiçik layihə ilə hər şeyin ehtiyat nüsxəsini çıxarıb rahatlıqla bərpa edə bilərsiniz. Unutmayın: "Kompüterləri sev, amma işlərini ehtiyatla gör."
