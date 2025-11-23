// Complete JLPT N5 Kanji Database (103 characters)
const kanjiData = [
    {
        id: 1,
        character: "一",
        meaning: "satu",
        kunyomi: "ひと・つ",
        // onyomi dihapus
        // strokes dihapus
        examples: ["一つ (ひとつ) - satu", "一人 (ひとり) - satu orang"]
    },
    {
        id: 2,
        character: "二",
        meaning: "dua",
        kunyomi: "ふた・つ",
        // onyomi dihapus
        // strokes dihapus
        examples: ["二つ (ふたつ) - dua", "二人 (ふたり) - dua orang"]
    },
    {
        id: 3,
        character: "三",
        meaning: "tiga",
        kunyomi: "み・つ",
        // onyomi dihapus
        // strokes dihapus
        examples: ["三つ (みっつ) - tiga", "三日 (みっか) - hari ketiga"]
    },
    {
        id: 4,
        character: "四",
        meaning: "empat",
        kunyomi: "よ・つ、よん",
        // onyomi dihapus
        // strokes dihapus
        examples: ["四つ (よっつ) - empat", "四月 (しがつ) - bulan April"]
    },
    {
        id: 5,
        character: "五",
        meaning: "lima",
        kunyomi: "いつ・つ",
        // onyomi dihapus
        // strokes dihapus
        examples: ["五つ (いつつ) - lima", "五月 (ごがつ) - bulan Mei"]
    },
    {
        id: 6,
        character: "六",
        meaning: "enam",
        kunyomi: "む・つ",
        // onyomi dihapus
        // strokes dihapus
        examples: ["六つ (むっつ) - enam", "六月 (ろくがつ) - bulan Juni"]
    },
    {
        id: 7,
        character: "七",
        meaning: "tujuh",
        kunyomi: "なな・つ",
        // onyomi dihapus
        // strokes dihapus
        examples: ["七つ (ななつ) - tujuh", "七月 (しちがつ) - bulan Juli"]
    },
    {
        id: 8,
        character: "八",
        meaning: "delapan",
        kunyomi: "や・つ",
            // onyomi dihapus
        examples: ["八つ (やっつ) - delapan", "八月 (はちがつ) - bulan Agustus"]
    },
    {
        id: 9,
        character: "九",
        meaning: "sembilan",
        kunyomi: "ここの・つ",
            // onyomi dihapus
        examples: ["九つ (ここのつ) - sembilan", "九月 (くがつ) - bulan September"]
    },
    {
        id: 10,
        character: "十",
        meaning: "sepuluh",
        kunyomi: "とお",
            // onyomi dihapus
        examples: ["十 (じゅう) - sepuluh", "十月 (じゅうがつ) - bulan Oktober"]
    },
    {
        id: 11,
        character: "百",
        meaning: "seratus",
        kunyomi: "",
        // onyomi dihapus
        // strokes dihapus
        examples: ["百 (ひゃく) - seratus", "三百 (さんびゃく) - tiga ratus"]
    },
    {
        id: 12,
        character: "千",
        meaning: "seribu",
        kunyomi: "ち",
        // onyomi dihapus
        // strokes dihapus
        examples: ["千 (せん) - seribu", "三千 (さんぜん) - tiga ribu"]
    },
    {
        id: 13,
        character: "万",
        meaning: "sepuluh ribu",
        kunyomi: "",
            // onyomi dihapus
        examples: ["一万 (いちまん) - sepuluh ribu", "万年筆 (まんねんひつ) - pulpen"]
    },
    {
        id: 14,
        character: "円",
        meaning: "yen, lingkaran",
        kunyomi: "まる・い",
            // onyomi dihapus
        examples: ["円 (えん) - yen", "百円 (ひゃくえん) - seratus yen"]
    },
    {
        id: 15,
        character: "日",
        meaning: "hari, matahari",
        kunyomi: "ひ、か",
            // onyomi dihapus
        examples: ["日 (ひ) - hari/matahari", "今日 (きょう) - hari ini"]
    },
    {
        id: 16,
        character: "月",
        meaning: "bulan, bulan (langit)",
        kunyomi: "つき",
            // onyomi dihapus
        examples: ["月 (つき) - bulan", "一月 (いちがつ) - bulan Januari"]
    },
    {
        id: 17,
        character: "火",
        meaning: "api, Selasa",
        kunyomi: "ひ",
            // onyomi dihapus
        examples: ["火 (ひ) - api", "火曜日 (かようび) - hari Selasa"]
    },
    {
        id: 18,
        character: "水",
        meaning: "air, Rabu",
        kunyomi: "みず",
            // onyomi dihapus
        examples: ["水 (みず) - air", "水曜日 (すいようび) - hari Rabu"]
    },
    {
        id: 19,
        character: "木",
        meaning: "pohon, Kamis",
        kunyomi: "き",
            // onyomi dihapus
        examples: ["木 (き) - pohon", "木曜日 (もくようび) - hari Kamis"]
    },
    {
        id: 20,
        character: "金",
        meaning: "emas, uang, Jumat",
        kunyomi: "かね",
        // onyomi dihapus
        // strokes dihapus
        examples: ["金 (かね) - uang", "金曜日 (きんようび) - hari Jumat"]
    },
    {
        id: 21,
        character: "土",
        meaning: "tanah, Sabtu",
        kunyomi: "つち",
            // onyomi dihapus
        examples: ["土 (つち) - tanah", "土曜日 (どようび) - hari Sabtu"]
    },
    {
        id: 22,
        character: "年",
        meaning: "tahun",
        kunyomi: "とし",
        onyomi: "ネン",
        strokes: 6,
        examples: ["年 (とし) - tahun", "今年 (ことし) - tahun ini"]
    },
    {
        id: 23,
        character: "時",
        meaning: "waktu, jam",
        kunyomi: "とき",
        onyomi: "ジ",
        // strokes dihapus
        examples: ["時 (とき) - waktu", "一時 (いちじ) - jam 1"]
    },
    {
        id: 24,
        character: "分",
        meaning: "menit, bagian",
        kunyomi: "わ・ける",
        onyomi: "ブン、フン",
            examples: ["分 (ふん) - menit", "十分 (じゅっぷん) - 10 menit"]
                ,
        examples: ["分 (ふん) - menit", "十分 (じゅっぷん) - 10 menit"]
    },
    {
        id: 25,
        character: "半",
        meaning: "setengah",
        kunyomi: "なか・ば",
        onyomi: "ハン",
        // strokes dihapus
        examples: ["半分 (はんぶん) - setengah", "半年 (はんとし) - setengah tahun"]
    },
    {
        id: 26,
        character: "人",
        meaning: "orang",
        kunyomi: "ひと",
        onyomi: "ジン、ニン",
            examples: ["人 (ひと) - orang", "日本人 (にほんじん) - orang Jepang"]
                ,
        examples: ["人 (ひと) - orang", "日本人 (にほんじん) - orang Jepang"]
    },
    {
        id: 27,
        character: "男",
        meaning: "laki-laki",
        kunyomi: "おとこ",
        onyomi: "ダン、ナン",
            examples: ["男 (おtoko) - laki-laki", "男の子 (おとこのこ) - anak laki-laki"]
                ,
        examples: ["男 (おtoko) - laki-laki", "男の子 (おとこのこ) - anak laki-laki"]
    },
    {
        id: 28,
        character: "女",
        meaning: "perempuan",
        kunyomi: "おんな",
        onyomi: "ジョ、ニョ",
            examples: ["女 (おんな) - perempuan", "女の子 (おんなのこ) - anak perempuan"]
                ,
        examples: ["女 (おんな) - perempuan", "女の子 (おんなのこ) - anak perempuan"]
    },
    {
        id: 29,
        character: "子",
        meaning: "anak",
        kunyomi: "こ",
        onyomi: "シ、ス",
            examples: ["子 (こ) - anak", "子供 (こども) - anak-anak"]
                ,
        examples: ["子 (こ) - anak", "子供 (こども) - anak-anak"]
    },
    {
        id: 30,
        character: "学",
        meaning: "belajar",
        kunyomi: "まな・ぶ",
            // onyomi dihapus
        examples: ["学生 (がくせい) - murid", "学校 (がっこう) - sekolah"]
    },
    {
        id: 31,
        character: "生",
        meaning: "hidup, lahir",
        kunyomi: "い・きる、う・まれる",
            // onyomi dihapus
        examples: ["学生 (がくせい) - murid", "先生 (せんせい) - guru"]
    },
    {
        id: 32,
        character: "先",
        meaning: "sebelum, depan",
        kunyomi: "さき",
        // onyomi dihapus
        // strokes dihapus
        examples: ["先生 (せんせい) - guru", "先週 (せんしゅう) - minggu lalu"]
    },
    {
        id: 33,
        character: "校",
        meaning: "sekolah",
        kunyomi: "",
            // onyomi dihapus
        examples: ["学校 (がっこう) - sekolah", "高校 (こうこう) - sekolah menengah atas"]
    },
    {
        id: 34,
        character: "本",
        meaning: "buku, asal",
        kunyomi: "もと",
            // onyomi dihapus
        examples: ["本 (ほん) - buku", "日本 (にほん) - Jepang"]
    },
    {
        id: 35,
        character: "語",
        meaning: "bahasa, kata",
        kunyomi: "かた・る",
            // onyomi dihapus
        examples: ["日本語 (にほんご) - bahasa Jepang", "英語 (えいご) - bahasa Inggris"]
    },
    {
        id: 36,
        character: "文",
        meaning: "kalimat, tulisan",
        kunyomi: "ふみ",
            // onyomi dihapus
        examples: ["文 (ぶん) - kalimat", "作文 (さくぶん) - karangan"]
    },
    {
        id: 37,
        character: "字",
        meaning: "huruf, karakter",
        kunyomi: "あざ",
            // onyomi dihapus
        examples: ["漢字 (かんじ) - huruf kanji", "文字 (もじ) - huruf"]
    },
    {
        id: 38,
        character: "名",
        meaning: "nama",
        kunyomi: "な",
            // onyomi dihapus
        examples: ["名前 (なまえ) - nama", "有名 (ゆうめい) - terkenal"]
    },
    {
        id: 39,
        character: "前",
        meaning: "sebelum, depan",
        kunyomi: "まえ",
            // onyomi dihapus
        examples: ["前 (まえ) - depan", "名前 (なまえ) - nama"]
    },
    {
        id: 40,
        character: "後",
        meaning: "sesudah, belakang",
        kunyomi: "あと、うし・ろ",
            // onyomi dihapus
        examples: ["後 (あと) - sesudah", "午後 (ごご) - sore"]
    },
    {
        id: 41,
        character: "上",
        meaning: "atas, di atas",
        kunyomi: "うえ、あ・がる",
            // onyomi dihapus
        examples: ["上 (うえ) - di atas", "上手 (じょうず) - mahir"]
    },
    {
        id: 42,
        character: "下",
        meaning: "bawah, di bawah",
        kunyomi: "した、さ・がる",
            // onyomi dihapus
        examples: ["下 (した) - di bawah", "下手 (へた) - kurang mahir"]
    },
    {
        id: 43,
        character: "中",
        meaning: "tengah, di dalam",
        kunyomi: "なか",
            // onyomi dihapus
        examples: ["中 (なか) - di dalam", "中国 (ちゅうごく) - Tiongkok"]
    },
    {
        id: 44,
        character: "外",
        meaning: "luar",
        kunyomi: "そと",
            // onyomi dihapus
        examples: ["外 (そと) - di luar", "外国 (がいこく) - negara asing"]
    },
    {
        id: 45,
        character: "左",
        meaning: "kiri",
        kunyomi: "ひだり",
            // onyomi dihapus
        examples: ["左 (ひだり) - kiri", "左右 (さゆう) - kiri dan kanan"]
    },
    {
        id: 46,
        character: "右",
        meaning: "kanan",
        kunyomi: "みぎ",
            // onyomi dihapus
        examples: ["右 (みぎ) - kanan", "左右 (さゆう) - kiri dan kanan"]
    },
    {
        id: 47,
        character: "東",
        meaning: "timur",
        kunyomi: "ひがし",
        // onyomi dihapus
        // strokes dihapus
        examples: ["東 (ひがし) - timur", "東京 (とうきょう) - Tokyo"]
    },
    {
        id: 48,
        character: "西",
        meaning: "barat",
        kunyomi: "にし",
            // onyomi dihapus
        examples: ["西 (にし) - barat", "関西 (かんさい) - wilayah Kansai"]
    },
    {
        id: 49,
        character: "南",
        meaning: "selatan",
        kunyomi: "みなみ",
            // onyomi dihapus
        examples: ["南 (みなみ) - selatan", "南口 (みなみぐち) - pintu selatan"]
    },
    {
        id: 50,
        character: "北",
        meaning: "utara",
        kunyomi: "きた",
            // onyomi dihapus
        examples: ["北 (きた) - utara", "北海道 (ほっかいどう) - Hokkaido"]
    },
    {
        id: 51,
        character: "口",
        meaning: "mulut, pintu masuk",
        kunyomi: "くち",
            // onyomi dihapus
        examples: ["口 (くち) - mulut", "入口 (いりぐち) - pintu masuk"]
    },
    {
        id: 52,
        character: "目",
        meaning: "mata",
        kunyomi: "め",
            // onyomi dihapus
        examples: ["目 (め) - mata", "一番目 (いちばんめ) - yang pertama"]
    },
    {
        id: 53,
        character: "耳",
        meaning: "telinga",
        kunyomi: "みみ",
            // onyomi dihapus
        examples: ["耳 (みみ) - telinga"]
    },
    {
        id: 54,
        character: "手",
        meaning: "tangan",
        kunyomi: "て",
            // onyomi dihapus
        examples: ["手 (て) - tangan", "上手 (じょうず) - mahir"]
    },
    {
        id: 55,
        character: "足",
        meaning: "kaki",
        kunyomi: "あし",
            // onyomi dihapus
        examples: ["足 (あし) - kaki", "足りる (たりる) - cukup"]
    },
    {
        id: 56,
        character: "見",
        meaning: "melihat",
        kunyomi: "み・る",
            // onyomi dihapus
        examples: ["見る (みる) - melihat", "見物 (けんぶつ) - wisata"]
    },
    {
        id: 57,
        character: "聞",
        meaning: "mendengar, bertanya",
        kunyomi: "き・く",
            // onyomi dihapus
        examples: ["聞く (きく) - mendengar/bertanya", "新聞 (しんぶん) - koran"]
    },
    {
        id: 58,
        character: "食",
        meaning: "makan, makanan",
        kunyomi: "た・べる",
            // onyomi dihapus
        examples: ["食べる (たべる) - makan", "食事 (しょくじ) - makan/minum"]
    },
    {
        id: 59,
        character: "飲",
        meaning: "minum",
        kunyomi: "の・む",
        // onyomi dihapus
        // strokes dihapus
        examples: ["飲む (のむ) - minum", "飲み物 (のみもの) - minuman"]
    },
    {
        id: 60,
        character: "行",
        meaning: "pergi, baris",
        kunyomi: "い・く、ゆ・く",
            // onyomi dihapus
        examples: ["行く (いく) - pergi", "銀行 (ぎんこう) - bank"]
    },
    {
        id: 61,
        character: "来",
        meaning: "datang",
        kunyomi: "く・る",
            // onyomi dihapus
        examples: ["来る (くる) - datang", "来年 (らいねん) - tahun depan"]
    },
    {
        id: 62,
        character: "帰",
        meaning: "pulang, kembali",
        kunyomi: "かえ・る",
        // onyomi dihapus
        // strokes dihapus
        examples: ["帰る (かえる) - pulang", "帰国 (きこく) - kembali ke negara asal"]
    },
    {
        id: 63,
        character: "入",
        meaning: "masuk",
        kunyomi: "はい・る、い・れる",
            // onyomi dihapus
        examples: ["入る (はいる) - masuk", "入口 (いりぐち) - pintu masuk"]
    },
    {
        id: 64,
        character: "出",
        meaning: "keluar",
        kunyomi: "で・る、だ・す",
            // onyomi dihapus
        examples: ["出る (でる) - keluar", "出口 (でぐち) - pintu keluar"]
    },
    {
        id: 65,
        character: "立",
        meaning: "berdiri",
        kunyomi: "た・つ",
            // onyomi dihapus
        examples: ["立つ (たつ) - berdiri", "国立 (こくりつ) - nasional"]
    },
    {
        id: 66,
        character: "休",
        meaning: "istirahat, libur",
        kunyomi: "やす・む",
            // onyomi dihapus
        examples: ["休む (やすむ) - istirahat", "休日 (きゅうじつ) - hari libur"]
    },
    {
        id: 67,
        character: "買",
        meaning: "membeli",
        kunyomi: "か・う",
        // onyomi dihapus
        // strokes dihapus
        examples: ["買う (かう) - membeli", "買い物 (かいもの) - belanja"]
    },
    {
        id: 68,
        character: "読",
        meaning: "membaca",
        kunyomi: "よ・む",
        // onyomi dihapus
        // strokes dihapus
        examples: ["読む (よむ) - membaca", "読書 (どくしょ) - membaca buku"]
    },
    {
        id: 69,
        character: "書",
        meaning: "menulis",
        kunyomi: "か・く",
            // onyomi dihapus
        examples: ["書く (かく) - menulis", "読書 (どくしょ) - membaca buku"]
    },
    {
        id: 70,
        character: "話",
        meaning: "berbicara, cerita",
        kunyomi: "はな・す",
            // onyomi dihapus
        examples: ["話す (はなす) - berbicara", "電話 (でんわ) - telepon"]
    },
    {
        id: 71,
        character: "言",
        meaning: "mengatakan, kata",
        kunyomi: "い・う、こと",
            // onyomi dihapus
        examples: ["言う (いう) - mengatakan", "言葉 (ことば) - kata"]
    },
    {
        id: 72,
        character: "高",
        meaning: "tinggi, mahal",
        kunyomi: "たか・い",
            // onyomi dihapus
        examples: ["高い (たかい) - tinggi/mahal", "高校 (こうこう) - sekolah menengah atas"]
    },
    {
        id: 73,
        character: "安",
        meaning: "murah, damai",
        kunyomi: "やす・い",
            // onyomi dihapus
        examples: ["安い (やすai) - murah", "安心 (あんしん) - tenang"]
    },
    {
        id: 74,
        character: "新",
        meaning: "baru",
        kunyomi: "あたら・しい",
            // onyomi dihapus
        examples: ["新しい (あたらしい) - baru", "新聞 (しんぶん) - koran"]
    },
    {
        id: 75,
        character: "古",
        meaning: "lama",
        kunyomi: "ふる・い",
            // onyomi dihapus
        examples: ["古い (ふるい) - lama", "古本 (ふるほん) - buku bekas"]
    },
    {
        id: 76,
        character: "長",
        meaning: "panjang, kepala",
        kunyomi: "なが・い",
            // onyomi dihapus
        examples: ["長い (ながい) - panjang", "社長 (しゃちょう) - direktur perusahaan"]
    },
    {
        id: 77,
        character: "小",
        meaning: "kecil",
        kunyomi: "ちい・さい",
            // onyomi dihapus
        examples: ["小さい (ちいさい) - kecil", "小学校 (しょうがっこう) - sekolah dasar"]
    },
    {
        id: 78,
        character: "大",
        meaning: "besar",
        kunyomi: "おお・きい",
            // onyomi dihapus
        examples: ["大きい (おおきい) - besar", "大学 (だいがく) - universitas"]
    },
    {
        id: 79,
        character: "多",
        meaning: "banyak",
        kunyomi: "おお・い",
            // onyomi dihapus
        examples: ["多い (おおい) - banyak", "多分 (たぶん) - mungkin"]
    },
    {
        id: 80,
        character: "少",
        meaning: "sedikit",
        kunyomi: "すく・ない、すこ・し",
            // onyomi dihapus
        examples: ["少ない (すくない) - sedikit", "少し (すこし) - sedikit"]
    },
    {
        id: 81,
        character: "白",
        meaning: "putih",
        kunyomi: "しろ・い",
            // onyomi dihapus
        examples: ["白い (しろい) - putih", "白黒 (しろくろ) - hitam putih"]
    },
    {
        id: 82,
        character: "赤",
        meaning: "merah",
        kunyomi: "あか・い",
            // onyomi dihapus
        examples: ["赤い (あかい) - merah", "赤ちゃん (あかちゃん) - bayi"]
    },
    {
        id: 83,
        character: "青",
        meaning: "biru",
        kunyomi: "あお・い",
            // onyomi dihapus
        examples: ["青い (あおい) - biru", "青年 (せいねん) - pemuda"]
    },
    {
        id: 84,
        character: "天",
        meaning: "langit, surga",
        kunyomi: "あめ、あま",
            // onyomi dihapus
        examples: ["天気 (てんき) - cuaca", "天国 (てんごく) - surga"]
    },
    {
        id: 85,
        character: "気",
        meaning: "udara, semangat",
        kunyomi: "",
            // onyomi dihapus
        examples: ["天気 (てんき) - cuaca", "元気 (げんき) - bersemangat"]
    },
    {
        id: 86,
        character: "雨",
        meaning: "hujan",
        kunyomi: "あめ",
            // onyomi dihapus
        examples: ["雨 (あめ) - hujan", "大雨 (おおあめ) - hujan deras"]
    },
    {
        id: 87,
        character: "電",
        meaning: "listrik",
        kunyomi: "",
            // onyomi dihapus
        examples: ["電気 (でんき) - listrik", "電車 (でんしゃ) - kereta"]
    },
    {
        id: 88,
        character: "車",
        meaning: "mobil, kendaraan",
        kunyomi: "くるま",
            // onyomi dihapus
        examples: ["車 (くるま) - mobil", "電車 (でんしゃ) - kereta"]
    },
    {
        id: 89,
        character: "駅",
        meaning: "stasiun",
        kunyomi: "",
        // onyomi dihapus
        // strokes dihapus
        examples: ["駅 (えき) - stasiun", "駅前 (えきまえ) - depan stasiun"]
    },
    {
        id: 90,
        character: "道",
        meaning: "jalan, cara",
        kunyomi: "みち",
            // onyomi dihapus
        examples: ["道 (みち) - jalan", "北海道 (ほっかいどう) - Hokkaido"]
    },
    {
        id: 91,
        character: "国",
        meaning: "negara",
        kunyomi: "くに",
            // onyomi dihapus
        examples: ["国 (くに) - negara", "外国 (がいこく) - negara asing"]
    },
    {
        id: 92,
        character: "山",
        meaning: "gunung",
        kunyomi: "やま",
            // onyomi dihapus
        examples: ["山 (やま) - gunung", "富士山 (ふじさん) - Gunung Fuji"]
    },
    {
        id: 93,
        character: "川",
        meaning: "sungai",
        kunyomi: "かわ",
            // onyomi dihapus
        examples: ["川 (かわ) - sungai"]
    },
    {
        id: 94,
        character: "店",
        meaning: "toko",
        kunyomi: "みせ",
            // onyomi dihapus
        examples: ["店 (みせ) - toko", "本店 (ほんてん) - toko utama"]
    },
    {
        id: 95,
        character: "何",
        meaning: "apa",
        kunyomi: "なに、なん",
            // onyomi dihapus
        examples: ["何 (なに) - apa", "何時 (なんじ) - jam berapa"]
    },
    {
        id: 96,
        character: "今",
        meaning: "sekarang",
        kunyomi: "いま",
            // onyomi dihapus
        examples: ["今 (いま) - sekarang", "今日 (きょう) - hari ini"]
    },
    {
        id: 97,
        character: "毎",
        meaning: "setiap",
        kunyomi: "",
            // onyomi dihapus
        examples: ["毎日 (まいにち) - setiap hari", "毎朝 (まいあさ) - setiap pagi"]
    },
    {
        id: 98,
        character: "週",
        meaning: "minggu",
        kunyomi: "",
            // onyomi dihapus
        examples: ["今週 (こんしゅう) - minggu ini", "先週 (せんしゅう) - minggu lalu"]
    },
    {
        id: 99,
        character: "友",
        meaning: "teman",
        kunyomi: "とも",
            // onyomi dihapus
        examples: ["友達 (ともだち) - teman", "友人 (ゆうじん) - teman"]
    },
    {
        id: 100,
        character: "間",
        meaning: "antara, waktu",
        kunyomi: "あいだ、ま",
            // onyomi dihapus
        examples: ["時間 (じかん) - waktu", "人間 (にんげん) - manusia"]
    },
    {
        id: 101,
        character: "方",
        meaning: "arah, orang",
        kunyomi: "かた",
            // onyomi dihapus
        examples: ["方 (かata) - orang (sopan)", "方向 (ほうこう) - arah"]
    },
    {
        id: 102,
        character: "午",
        meaning: "siang",
        kunyomi: "",
            // onyomi dihapus
        examples: ["午前 (ごぜん) - pagi", "午後 (ごご) - siang/sore"]
    },
    {
        id: 103,
        character: "母",
        meaning: "ibu",
        kunyomi: "はは",
            // onyomi dihapus
        examples: ["母 (はは) - ibu", "お母さん (おかあさん) - ibu (sopan)"]
    }
];

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = kanjiData;
}
