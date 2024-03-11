Tasavvur qiling, siz bir xil Lego uylarini qurishni rejalashtirmoqdasiz. Qurilishni boshlashdan oldin sizga uyni qanday yig'ish kerakligini, shu jumladan sizga kerak bo'lgan g'ishtlarning turlari va sonlarini ko'rsatadigan loyiha kerak. Docker va konteynerlar dunyosida **image** konteynerlarni yaratish uchun ushbu loyiha sifatida xizmat qiladi.

Image qanday ishlaydi, soddalashtirilgan:

1. **Blueprints for Containers:** Docker image-lari konteynerlar uchun blueprints yoki shablonlardir. Uy loyihasi poydevordan to tomgacha bo'lgan hamma narsani aniqlaganidek, Docker tasviri konteynerni yaratish va ishga tushirish uchun zarur bo'lgan hamma narsani o'z ichiga oladi: dastur kodi, runtime, kutubxonalar, environment variables va boshqa konfiguratsiya fayllari.

2. **Immutable:** Image-ni yaratganingizdan so‘ng, u o‘zgarmaydi. Bu toshga o‘rnatilgan chizmaga o‘xshaydi. Agar siz o'zgartirish kiritishingiz kerak bo'lsa, siz o'zgartirishlar bilan yangi rasm yaratasiz. Bu consistency va reliability-ni ta'minlaydi, chunki siz konteyner yaratish uchun har safar ushbu tasvirdan foydalanganingizda nimaga erishayotganingizni aniq bilasiz.

3. **Layered Structure:** Docker image-lari layer-lardan tashkil topgan noyob xususiyatga ega. Image-ning bir qismini o'zgartirganingizda, Docker faqat o'zgargan layer-larni yangilaydi. Bu shaffof varaqlar to'plamiga o'xshaydi, bu erda siz barcha varaqlarning umumiy effektini ko'rishingiz mumkin, lekin siz faqat o'zgartirmoqchi bo'lganlarini almashtirishingiz kerak. Bu image-larni saqlash va share qilishni uchun juda samarali qiladi, chunki siz faqat o'zgargan layer-larni transfer qilishingiz kerak.

4. **Sharing and Storing:** Docker image-lari kutubxonalar yoki image hub kabi registrlar orqali saqlanishi va baham ko'rilishi mumkin. Eng mashhuri Docker Hub bo'lib, u erda turli xil dasturiy ilovalar va xizmatlar uchun oldindan tayyorlangan turli xil image-larni topishingiz mumkin. Mahalliy foydalanish uchun registrdan rasmni yuklab olishingiz ("pull") mumkin, shuningdek, ularni boshqalar bilan baham ko'rish uchun o'zingizning shaxsiy image-laringizni Docker Hub-ga yuklashingiz ("push") qilishingiz mumkin.

5. **Starting Point for Containers:** Docker yordamida dasturni ishga tushirish uchun siz image-dan konteyner yaratishdan boshlaysiz. Konteyner bu image-ning namunasi bo'lib, izolyatsiya qilingan jarayon sifatida ishlaydi. Siz bir xil image-lardan bir nechta konteynerlarni ishga tushirishingiz mumkin va ularning har biri xuddi bir rejadan bir nechta Lego uylarini qurish kabi mustaqil ishlaydi.

Xulosa qilib aytadigan bo'lsak, Docker image-lari konteynerlarni yaratish uchun asosiy boshlang'ich nuqtadir. Ular dasturiy ta'minotni va uning barcha bog'liqliklarini standartlashtirilgan birlikda to'playdi va har qanday muhitda barqaror va ishonchli ishlashini ta'minlaydi.
