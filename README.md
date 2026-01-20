```
android/
├── app/
│   └── google-services.json        //add manual dari WA    ‼️‼️
│
assets/
├── logo/
│   └── logo.png                    //app logo      ❌
│
├── demo/
│   ├── welcome.png                 //showcase welcome screen       ❌
│   ├── login.png                   //showcase login screen         ❌
│   ├── register.png                //showcase register screen      ❌
│   ├── home1.png                   //showcase home screen          ❌
│   ├── home2.png                   //showcase novel scren          ❌
│   ├── home3.png                   //showcase add novel screen     ❌
│   ├── home4.png                   //showcase edit novel screen    ❌
│   ├── home5.png                   //showcase delete novel screen  ❌
│   ├── profile.png                 //showcase profile screen       ❌
│   └── about.png                   //showcase about app screen     ❌
│
lib/
├── models/
│   ├── novel.dart                  //data novel    ✔️
│   └── user.dart                   //data user     ❌
│
├── screens/
│   ├── auth/
│   │   ├── auth_page.dart          //form login dan register   ✔️
│   │   └── welcome_page.dart       //pilih login register      ✔️
│   │
│   ├── home/
│   │   ├── add_novel_page.dart     //form tambah novel         ✔️
│   │   ├── detail_page.dart        //detail novel              ✔️
│   │   ├── edit_novel_page.dart    //edit novel                ✔️
│   │   ├── list_page.dart          //list novel dan search     ✔️
│   │   └── main_page.dart          //navigasi                  ✔️
│   │
│   ├── profile/
│   │    └── about_page.dart         //info app dan dev          ✔️
│   │    └── profile_page.dart       //tentang user dan logout   ❌
│   └── splash_screen.dart           //splash screen             ✔️
│
├── services/
│   ├── auth_service.dart           //Firebase Auth login dan Register      ✔️
│   └── firestore_service.dart      //CRUD Novel                            ✔️
│
├── widgets/
│   └── auth_wrapper.dart           //Persistent Login System               ✔️
│
├── firebase_options.dart           //config firebase add manual dari WA    ‼️‼️
└── main.dart                       //entry point                           ✔️
```