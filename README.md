android/
├── app/
│   └── google-services.json        //add manual dari WA    ‼️‼️
├── models/
│   ├── novel.dart                  //data novel    ✔️
│   └── user.dart                   //data user     ❌
│
├── screens/
│   ├── auth/
│   │   ├── login_page.dart         //form login                ❌
│   │   ├── register_page.dart      //form register             ❌
│   │   └── welcome_page.dart       //pilih login register      ❌
│   │
│   ├── home/
│   │   ├── add_novel_page.dart     //form tambah novel         ✔️
│   │   ├── detail_page.dart        //detail novel              ✔️
│   │   ├── edit_novel_page.dart    //edit novel                ✔️
│   │   ├── list_page.dart          //list novel dan search     ✔️
│   │   └── main_page.dart          //navigasi                  ✔️
│   │
│   └── profile/
│       └── about_page.dart         //info app dan dev          ❌
│       └── profile_page.dart       //tentang user dan logout   ❌
│
├── services/
│   ├── auth_service.dart           //Firebase Auth login dan Register      ❌
│   └── firestore_service.dart      //CRUD Novel                            ✔️
│
├── firebase_options.dart           //config firebase add manual dari WA    ‼️‼️
├── main.dart                       //entry point                           ✔️
└── splash_screen.dart              //splash screen                         ❌
