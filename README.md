# ระบบลงทะเบียนนักศึกษา (Supabase + GitHub Pages)

ไฟล์:
- `index.html` – ฟอร์มลงทะเบียน
- `admin.html` – หน้าแอดมิน (ล็อกอิน, ค้นหา, ลบ, ดาวน์โหลด CSV)
- `config.js` – ใส่ URL และ anon key ของ Supabase
- `supabase.sql` – สร้างตารางและกำหนดสิทธิ์ (RLS)

## ขั้นตอนติดตั้ง
1. สร้างโปรเจกต์ที่ https://supabase.com
2. SQL Editor → วางโค้ดจาก `supabase.sql` → Run
3. Authentication → Users → Add user (สร้างอีเมล/รหัสผ่านแอดมิน แล้วติ๊ก Auto Confirm)
4. Authentication → Sign In / Providers → ปิด "Allow new users to sign up"
   (สำคัญ: ไม่เช่นนั้นใครก็สมัครแล้วดูข้อมูลได้)
5. Project Settings → API → คัดลอก Project URL และ anon/publishable key ใส่ใน `config.js`
6. อัปโหลดโฟลเดอร์นี้ขึ้น GitHub → Settings → Pages → Deploy from branch (main / root)
7. เปิด `https://<ชื่อผู้ใช้>.github.io/<ชื่อ repo>/` และ `/admin.html`

## หมายเหตุด้านความปลอดภัย
- anon key เปิดเผยในหน้าเว็บได้ เพราะข้อมูลถูกป้องกันด้วย RLS
- ห้ามนำ `service_role` key มาใส่ในไฟล์เหล่านี้เด็ดขาด
- คนทั่วไปทำได้แค่ "เพิ่มข้อมูล" ส่วนดู/ลบ ต้องล็อกอินแอดมินเท่านั้น
