### Master Node nima?

Katta restoranda gavjum oshxonani tasavvur qiling. Oshxonada butun oshxona ishlarini boshqarish uchun mas'ul bo'lgan bosh oshpaz (master node) mavjud. Bu bosh oshpaz barcha ovqat pishirish bilan shug'ullanmaydi, lekin ovqatlarni (ilovalarni) samarali, to'g'ri tayyorlash va o'z vaqtida yetkazib berishni ta'minlaydigan sous-oshpazlarni (worker nodes) nazorat qiladi.

Kubernetes klasterida **master node** bizning oshxona o'xshashligimizdagi bosh oshpazga o'xshash rol o'ynaydi. Bu butun klasterni boshqaradigan va boshqaradigan mashina (yoki mashinalar guruhi). Master Node Worker Node-larga (sous-chefs) qaysi vazifalarni belgilash to'g'risida qaror qabul qiladi, ularning sog'lig'ini nazorat qiladi va klasterning muammosiz va samarali ishlashini ta'minlash uchun yuzaga keladigan muammolarni bartaraf etish choralarini ko'radi.

### Master Node komponentlari

Master Node klasterni boshqarish uchun birgalikda ishlaydigan bir nechta asosiy komponentlardan iborat:

1. **API Server (kube-apiserver):** Bu Kubernetes control plane-ining front door-i bo'lib, u orqali barcha internal va external aloqalar o'tadi. U so'rovlarni qayta ishlaydi va tasdiqlaydi, so'ngra etcd dagi ob'ektlar holatini yangilaydi va barcha komponentlar sinxronlanganligiga ishonch hosil qiladi.

2. **Cluster Store (va etcd):** Buni klasterning miyasi deb hisoblang. Bu barcha klaster ma'lumotlari uchun ishlatiladigan yuqori darajadagi key-value store. Bu erda master node klaster holati, konfiguratsiyalar va metama'lumotlar haqidagi barcha ma'lumotlarni saqlaydi.

3. **Controller Manager (kube-controller-meneger):** Ushbu komponent klaster holatini tartibga soluvchi, ish yukining hayot davrlarini boshqaradigan va muntazam vazifalarni bajaradigan nazoratchilar uchun nazoratchi vazifasini bajaradi. Misol uchun, agar node ishlamay qolsa, controller manager ushbu node-dagi ish workloads-ning boshqa node-larga o'tkazilishini ta'minlashga yordam beradi.

4. **Scheduler (kube-scheduler):** Buni master node-ni rejalashtirish vositasi(planning tool) sifatida tasavvur qiling. Resurs mavjudligi, workloads-ga bo'lgan talablar va boshqa siyosatlar kabi turli omillarga asoslanib, scheluder qaysi workload-larini qaysi node-lardaishga tushirishni hal qiladi. Bu har bir workload-ning samarali ishlashi uchun zarur bo'lgan resurslarga ega bo'lishini ta'minlaydi.

5. **Cloud Controller Manager (cloud-controller-manager) (optional):** Cloud Provayerlarda ishlaydigan klasterlar uchun ushbu komponent klasteringizni cloud provayderingiz API’siga ulash imkonini beradi. Shunday qilib, klaster o‘zi ishlayotgan cloud-ga xos qarorlar qabul qilishi mumkin, masalan yukni zonalar bo‘ylab taqsimlash.

### Master Node qanday ishlaydi?

Master Node-ning asosiy vazifasi klaster holatini boshqarishdir. U worker node-larda ishlaydigan ilovalar (konteynerlar) foydalanuvchi belgilagan holatda bo'lishini ta'minlaydi. Misol uchun, agar siz dasturni joylashtirsangiz va uning uchta nusxasi (replikasi) ishlashini xohlayotganingizni belgilasangiz, asosiy tugun komponentlari uchta nusxa ishlayotganiga ishonch hosil qilish uchun birgalikda ishlaydi. Agar bitta misol bajarilmasa, asosiy tugun buni sezadi va uni almashtirish uchun yangi namunani ishga tushiradi.

Xulosa qilib aytganda, master node orkestrning dirijyoriga o'xshaydi va Kubernetes klasterining har bir qismi klasterda ishlaydigan ilovalarni boshqarish uchun uyg'unlikda ishlashini ta'minlaydi. U ishlaydigan ilovalarning haqiqiy ishini bajarmaydi, aksincha, worker nodes bo'ylab ishni boshqaradi va tartibga soladi.
