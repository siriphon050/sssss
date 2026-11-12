-- รันไฟล์นี้ใน Supabase > SQL Editor (กด Run ครั้งเดียว)

create table if not exists public.registrations (
  id          uuid primary key default gen_random_uuid(),
  first_name  text not null check (char_length(first_name) between 1 and 100),
  last_name   text not null check (char_length(last_name) between 1 and 100),
  age         int  not null check (age between 5 and 120),
  department  text not null check (char_length(department) between 1 and 100),
  branch      text not null check (char_length(branch) between 1 and 100),
  student_id  text not null unique check (char_length(student_id) between 1 and 30),
  level       text not null check (char_length(level) between 1 and 50),
  motto       text check (char_length(motto) <= 300),
  created_at  timestamptz not null default now()
);

alter table public.registrations enable row level security;

-- ทุกคน (ยังไม่ล็อกอิน) ลงทะเบียนได้ แต่ "อ่านข้อมูลคนอื่นไม่ได้"
create policy "public can register"
  on public.registrations for insert
  to anon, authenticated
  with check (true);

-- เฉพาะแอดมิน (ล็อกอินแล้ว) ดู/แก้ไข/ลบได้
create policy "admin can read"
  on public.registrations for select
  to authenticated using (true);

create policy "admin can update"
  on public.registrations for update
  to authenticated using (true) with check (true);

create policy "admin can delete"
  on public.registrations for delete
  to authenticated using (true);

grant insert on public.registrations to anon;
grant select, insert, update, delete on public.registrations to authenticated;
