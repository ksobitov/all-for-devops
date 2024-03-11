### API server nima?

Kubernetes dunyosida API Serverni markaziy aloqa markazi yoki shahar maydoni deb tasavvur qiling. Bu erda barcha harakatlar Kubernetes klasterida ma'lumot almashish va buyruqlarni bajarish nuqtai nazaridan sodir bo'ladi. Odamlar ma'lumot to'plash, xabarlarni e'lon qilish yoki yo'nalish olish uchun kelgan shahar maydonida bo'lgani kabi, "kube-apiserver" klasterning umumiy holati uchun asosiy interfeys bo'lib xizmat qiladi va foydalanuvchilarga, boshqaruv vositalari va Kubernetes tizimining boshqa tarkibiy qismlariga ruxsat beradi. bir-biri bilan gaplashish va klaster holatini boshqarish.

### API serveri qanday ishlaydi?

1. **Central Hub:** API Server REST so'rovlarini qayta ishlovchi, ularni tasdiqlovchi, etcd ma'lumotlar bazasidagi mos ob'ektlarni yangilaydigan (klaster holatini saqlaydigan taqsimlangan kalit-qiymatlar ombori) markaziy boshqaruv ob'ekti sifatida ishlaydi va keyin manfaatdor tomonlarni klasterning istalgan holatga o'tishini ta'minlash uchun o'zgarishlar to'g'risida xabardor qiladi.

2. **Communication Handler:** U etcd storage bilan to‘g‘ridan-to‘g‘ri o‘zaro ta’sir qiluvchi yagona komponent bo‘lib ishlab chiqilgan. Ushbu dizayn barcha o'zgarishlarning izchil bo'lishini ta'minlashga yordam beradi va asosiy saqlash mexanizmi ustidan mavhumlik qatlamini ta'minlaydi.

3. **Scalability and Availability:** `kube-apiserver` horizontall scaling-ga mo'ljallangan. Bu yukni muvozanatlash yoki yuqori mavjudligini ta'minlash uchun API Serverning bir nechta nusxalarini ishga tushirishingiz mumkin degan ma'noni anglatadi. API serverining fuqaroligi bo'lmagan tabiati buni amalga oshirishga imkon beradi, bu esa har bir misolni boshqasini almashtirishga imkon beradi.

4. **Autentifikatsiya va avtorizatsiya:** Har qanday so‘rov Kubernetes tizimining asosiy qismiga yetib borgunga qadar API serveri so‘rovchining shaxsini tasdiqlash uchun autentifikatsiya qiladi, so‘ngra ular so‘ralgan amallarni bajarish uchun ruxsati bor-yo‘qligini tekshiradi va nihoyat tegishli har qanday so‘rovni qo‘llaydi. kirish nazorati. Bu jarayon klasterda faqat haqiqiy va ruxsat etilgan operatsiyalar bajarilishini ta'minlaydi.

5. **Extension and Integration Point:** RESTful interfeysi orqali API serveri tashqi tizimlar bilan oson kengaytirish va integratsiya qilish imkonini beradi. Maxsus resurslarni qo'shyapsizmi, tashqi xotira tizimi bilan integratsiya qilyapsizmi yoki avtomatlashtirish vositalariga ulanasizmi, API serveri Kubernetes ekotizimiga kirish nuqtangizdir.

### Nima uchun API serveri muhim?

- **Uniformity:** Asosiy mexanizmlardan qat'i nazar, klasterdagi resurslar bilan o'zaro ishlash uchun izchil va standartlashtirilgan interfeysni ta'minlaydi.
- **Security:** Klaster uchun darvozabon bo'lib xizmat qiladi, bu klaster holatiga ta'sir qilishdan oldin har bir o'zaro ta'sirning autentifikatsiya qilinishini, avtorizatsiya qilinishini va tasdiqlanishini ta'minlaydi.
- **Flexibility:** Kubernetesni ko‘plab muhitlar va ish jarayonlariga moslashtirib, keng ko‘lamli vositalar va tizimlar bilan integratsiyani ta’minlaydi.

Oddiy qilib aytganda, "kube-apiserver" Kubernetes operatsiyasining miyasi bo'lib, barcha buyruqlarni qayta ishlaydi va klasterning maqsadga muvofiq ishlashini ta'minlaydi. Bu barcha qarorlar qabul qilinadigan buyruqlar markaziga o'xshaydi, bu sizning ilovalaringiz Kubernetes klasterida muammosiz va xavfsiz ishlashini ta'minlaydi.
