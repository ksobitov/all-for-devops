Docker kompyuter kodi uchun yuk tashish konteyner tizimiga(``shipping container system``) o'xshaydi. Keling, tushunishni osonlashtirish uchun haqiqiy dunyo o'xshashligidan boshlaylik.

Tasavvur qiling, sizda o'yinchoq fabrikasi bor. Sizning o'yinchoqlaringiz dunyoning turli burchaklarida turli materiallar va jarayonlardan foydalangan holda ishlab chiqariladi. Tayyor bo'lgach, ularni hamma joyda do'konlarga jo'natish kerak. Buni samarali bajarish uchun siz ularni dunyoning istalgan nuqtasida osongina yuklash, tashish va tushirish mumkin bo'lgan standartlashtirilgan yuk tashish konteynerlariga joylashtirasiz. Bu tizim samarali, chunki bu narsa nima bo'lishi muhim emas; konteynerga sig'sa, uni jo'natish mumkin.

Docker dasturiy ta'minot(``software``) uchun shunga o'xshash narsani qiladi. O'yinchoqlar o'rniga sizda turli xil kompyuterlarda (do'konlarda) ishlashi kerak bo'lgan dasturiy ta'minot(``software``) (ilovalar) mavjud. Bu kompyuterlar bir-biridan juda farq qilishi mumkin; ular turli xil operatsion tizimlarga, turli xil konfiguratsiyalarga yoki turli xil dasturlarga ega bo'lishi mumkin.

Buni hal qilish uchun Docker ilovangizni va uning ishlashi uchun kerak bo‘lgan hamma narsani (masalan, kutubxonalar va ``boshqa tools``) “konteyner”ga to‘playdi. Ushbu konteyner sizning dasturiy ta'minotingiz qayerda joylashtirilishidan qat'i nazar, xuddi shu tarzda ishlashini ta'minlaydi, xuddi yuk konteyneri ichidagi tovarlar qayerga jo'natilishidan qat'i nazar, xavfsiz va bir xil holatda kelishini ta'minlaydi.

Mana Dockerning soddalashtirilgan asosiy fikrlari:

1. **Containers:** Bular dasturingizning “yuk tashish konteynerlari”dir. Har bir konteynerda dasturiy ta'minot ishlashi uchun kerak bo'lgan hamma narsa, jumladan kod, runtime, libraries va ``environment variables`` mavjud.

2. **Docker Engine:** Bu portdagi konteynerlarni yuklaydigan va tushiradigan kranga o'xshaydi. Bu konteynerlarni boshqaradigan asosiy dasturiy ta'minot - ularni yaratish, ishga tushirish, to'xtatish va hk.

3. **Images:** Agar konteynerlar yuklangan yuk konteynerlari bo‘lsa, Docker images blueprints. Image lightweight, standalone, executable paket boʻlib, u dasturiy taʼminotni ishga tushirish uchun zarur boʻlgan barcha narsalarni, jumladan kod, runtime, libraries, environment variables va konfiguratsiya fayllarini oʻz ichiga oladi.

4. **Docker Hub:** Buni yuk tashish konteynerlari jo‘natilishidan oldin saqlanadigan ombor sifatida tasavvur qiling. Docker Hub ``cloud`` ga asoslangan ro'yxatga olish xizmati bo'lib, u erda konteyner ``image`` larini topishingiz va share qilishingiz mumkin. Konteynerlaringiz uchun asos sifatida foydalanish uchun Docker Hub-dan image larni olishingiz yoki boshqalar foydalanishi uchun maxsus image laringizni Docker Hub-ga qo'yishingiz mumkin.

Xulosa qilib aytganda, Docker dasturiy ilovalarni ishga tushirish jarayonini soddalashtiradi, konteynerlar yordamida ilovalarni yaratish, joylashtirish va ishga tushirishni osonlashtiradi. Bu ilova qayerda joylashtirilishidan qat'iy nazar bir xil ishlashini ta'minlaydi va "u mening kompyuterimda ishlaydi" degan umumiy muammoni hal qiladi.
