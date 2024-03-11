Kubernetes ``open source`` platforma bo‘lib, dastur konteynerlarini ``deploying``, ``scaling`` va ``operating`` avtomatlashtirishga mo‘ljallangan. U dastlab ``Google`` tomonidan ishlab chiqilgan va hozirda ``Cloud Native Computing Foundation`` tomonidan yuritiladi. Kubernetes ilovani tashkil etuvchi konteynerlarni mantiqiy birliklarga guruhlash orqali yuzlab yoki minglab konteynerlardan tashkil topgan ilovalarni boshqarishni osonlashtiradi. Bu bir qator afzalliklarni beradi:

### Kubernetes nima qiladi:

- **Container Management:** Konteynerlarni ilovangiz va unga bog‘liqliklar uchun ``lightweight``, ``portable packages`` deb tasavvur qiling. Konteynerlar ilovalarni turli muhitlarda(``environment``) doimiy ravishda ishga tushirishni osonlashtiradi. Kubernetes ushbu konteynerlarni boshqarishda yordam beradi.

- **Automation of Deployment**: Kubernetes sizga ilovalarni avtomatik ravishda ``deploying`` qilish, ularni ehtiyojingizga qarab ``scaling`` va kerakli holatini(``desired state``) saqlab qolish imkonini beradi.
- **Scalability**: Bu talab asosida ilovangizni avtomatik ravishda ``scale`` va kamaytirish(``down``) mexanizmlarini taqdim etadi.
- **Load Balancing**: Kubernetes network trafigini tarqatishi mumkin, shunda ``deploying`` ``stable`` bo'ladi.
- **Self-healing**: U ishlamay qolgan konteynerlarni qayta ishga tushiradi, ``node`` lar o'lib(``die``) qolganda konteynerlarni almashtiradi va qayta rejalashtiradi, foydalanuvchi tomonidan aniqlangan sog'liqni tekshirishga(``health-check``) javob bermaydigan konteynerlarni o'ldiradi va tayyor bo'lmaguncha ularni mijozlarga reklama qilmaydi. hizmat qilmoq.
- **Rollouts and Rollbacks**: Kubernetes ilovangiz yoki uning konfiguratsiyasi uchun ``rolling updates`` ni qo‘llab-quvvatlaydi, shu bilan birga application available bo‘lib qoladi va oldingi versiyaga osongina ``rollback`` qilish imkonini beradi.

### Core Components:

- **Pods:** Kubernetes tomonidan yaratilgan va boshqariladigan, bir yoki bir nechta konteynerni o'z ichiga olishi mumkin bo'lgan ``smallest deployable units``.
- ** Nodes: ** Ilovalar va ``cloud workflows`` ni boshqaradigan Physical yoki virtual mashinalar.
- **Services:** Podlarni ishlaydigan ilovani network service sifatida ko'rsatishning ``abstract`` usuli.
- **Deployments:** Podlarni deploy qilish va scaling qilishni boshqarish va ilovaga yangilanishlarni taqdim etish.
- **Labels and Selectors:** Ular kalit-qiymat juftliklari toʻplami asosida obʼyektlar guruhini tashkil qilish va tanlash uchun ishlatiladi.

### Nima uchun Kubernetesdan foydalanish kerak:

- **Portability:** Kubernetes public cloud servicelarida (masalan, AWS, Google Cloud, Azure) va hatto local kompyuterda (Minikube kabi) ishlashi mumkin.
- **Flexibility:** U keng doiradagi ``container runtimes`` qo'llab quvvatlaydi, jumladan Dockerni, shuningdek, turli network(``calico, flannel``) va storage(``etcd``) turlarini qo‘llab-quvvatlaydi.
- **Scalability:** Oddiy buyruq, UI yoki protsessordan foydalanish asosida avtomatik ravishda ilovalarni osonlikcha ``scaling up`` yoki ``scaling down`` qila oladi.
- **Community and Ecosystem:** Open Source va keng tarqalgan bo'lib, Kubernetes katta, jonli hamjamiyatga va boy vositalar va kengaytmalarga ega ekotizimga ega.

Xulosa qilib aytganda, Kubernetes - bu mashinalar klasterida konteynerlashtirilgan ilovalarni boshqarish uchun kuchli tizim. U murakkab ilovalarni osonlik bilan boshqarishga yordam berish uchun moʻljallangan boʻlib, talab qanchalik yuqori boʻlishidan qatʼi nazar, ularning har doim mavjud boʻlishini va samarali ishlashini taʼminlaydi.
