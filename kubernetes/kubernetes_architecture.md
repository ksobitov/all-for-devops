## Kubernetes nima?

Birinchidan, Kubernetes (ko'pincha K8s deb qisqartiriladi) open-source platforma bo'lib, dastur konteynerlarini deploying, scaling va operatsiylarni avtomatlashtirishga mo'ljallangan. U easy management va discovery qilish uchun dasturni tashkil etuvchi konteynerlarni logical unit-larga guruhlaydi.

### The Basics of a Kubernetes Cluster 

**Kubernetes klasteri** konteynerlashtirilgan ilovalarni ishga tushirish uchun node mashinalar to'plamidir. Agar siz uni zavod deb hisoblasangiz, klaster bu ilovalarni (mahsulotlarni) ishga tushirish uchun birgalikda ishlaydigan mexanizmlar va ishchilarni o'z ichiga olgan butun ob'ektdir.

### Kubernetes klasterining komponentlari

Kubernetes klasterida ikkita turdagi node-lar mavjud: **Master nodes** va **Worker Nodes**.

1. **Master Nodes:**
    - **Control Plane Components:** Bular fabrikamiz analogiyasidagi boshqaruv jamoasiga o'xshaydi. Ular klaster haqida global qarorlar qabul qiladilar (masalan, scheduling applications), klaster hodisalarini aniqlash va ularga javob berish (masalan, agar muvaffaqiyatsiz bo'lsa, yangi konteynerni ishga tushirish).
      - **API Server:** Kubernetes control plane-ning front qismi; Bu barcha so'rovlar yo'naltiriladigan qabulxonaga o'xshaydi.
      - **etcd:** Barcha klaster ma'lumotlari uchun Kubernetesning qo'llab-quvvatlovchi do'koni sifatida foydalaniladigan yuqori darajadagi key-value do'koni. Buni klasterning nima boshqarishi kerakligi haqidagi xotirasi sifatida tasavvur qiling.
      - **Scheduler:** Qaysi node yangi yaratilgan pod-ni ishga tushirishi mumkinligini manba mavjudligi asosida aniqlaydi.
      - **Controller Manager:** pod-larni replace va node operatsiyalarini boshqarish kabi amallarni bajaradigan bir qancha kichikroq kontrollerlarni nazorat qiladi.

2. **Worker Nodes:**
    - Bular aslida ilovalarni boshqaradigan mashinalar. Ularni zavod ishchilari deb tasavvur qiling.
      - **Kubelet:** Konteynerlar Podda ishlayotganiga ishonch hosil qilib, har bir worker node-da ishlaydigan agent.
      - **Kube-Prory:** Podlar va tashqi foydalanuvchilar o'rtasidagi tarmoq aloqasini boshqaradi, tarmoq proksi-serveri va Load Balancer sifatida ishlaydi.
      - **Container Runtime:** Konteynerlarni ishga tushirish uchun javob beradigan dastur (masalan, Docker).

### Qanday qilib hammasi birgalikda ishlaydi

- **Deployment:** Ilovani Kubernetes-ga o'rnatganingizda, siz master node-ga dastur konteynerlarini ishga tushirishni buyurasiz. Master konteynerlarni klasterning worker node-larida ishlashni rejalashtiradi.
- **Operation:** Master klasterdagi barcha worker node-larni kuzatib boradi va ishdan chiqqan konteynerlarni almashtiradi, resurslar yetishmasa, konteynerlarni bir node-dan boshqasiga o‘tkazadi va narsalarni kuzatib boradi.
- **Scaling:** Siz Kubernetesga dasturingizning ishlayotgan nusxalari sonini oʻzgartirishni master-ga aytish orqali ilovangizni scale up yoki scale down qil deb aytishingiz mumkin. Kubernetes siz xohlagan holatni qondirish uchun konteynerlarni avtomatik ravishda rejalashtiradi va ishga tushiradi (yoki to'xtatadi).
- **Networking:** Kubernetes klasteridagi barcha node-lar private network-ga ulangan. Kubernetesdagi har bir Pod klasterdagi node-lar bo'ylab har bir boshqa Pod bilan bog'lanishi mumkin.

Xulosa qilib aytganda, Kubernetes klasteri konteynerlashtirilgan ilovalarni boshqarish uchun kuchli tizim bo'lib, jarayonni boshqaruvchi va avtomatlashtiradigan master va worker node-lari haqiqiy ishni bajaradi. Kubernetesni zavodning aqlli menejeri sifatida o'ylab ko'ring, u o'zi boshqaradigan ilovalarni (mahsulotlarni) samarali ishlatish, ta'mirlash va masshtablash uchun o'z resurslarini (konteynerlarni) qaerga ajratishni aniq biladi.
