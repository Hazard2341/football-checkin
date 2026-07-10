# ⚽ 龙港新势力 · 足球训练打卡

带登录和云端同步的足球训练打卡工具。

## 部署步骤（约10分钟）

### 1. 注册 Supabase（免费）

1. 打开 https://supabase.com 点击 "Start your project"
2. 用 GitHub 账号登录
3. 点击 "New project"
4. 填写项目名（如 ootball-checkin）
5. 设置数据库密码（记住它）
6. 选择离你最近的区域（选 Singapore 或 Tokyo）
7. 点击 "Create new project"（等待2-3分钟创建完成）

### 2. 创建数据表

1. 项目创建完成后，点击左侧菜单 "SQL Editor"
2. 点击 "+ New query"
3. 复制粘贴 setup.sql 文件中的内容
4. 点击 "Run" 执行

### 3. 配置权限

1. 点击左侧菜单 "SQL Editor"
2. 新建一个查询，运行以下 SQL：

`sql
-- 允许用户访问自己的数据
ALTER TABLE checkins ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can manage their own checkins"
  ON checkins FOR ALL
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);
`

3. 点击 "Run" 执行

### 4. 获取 API 配置

1. 点击左侧菜单 "Project Settings"（齿轮图标）
2. 点击 "API"
3. 复制 "Project URL"（类似 https://xxx.supabase.co）
4. 复制 "anon public" 密钥

### 5. 部署到 Vercel（免费）

1. 打开 https://vercel.com 用 GitHub 登录
2. 点击 "Add New" → "Project"
3. 选择 ootball_checkin 仓库（或手动上传）
4. 在 "Environment Variables" 中添加：
   - VITE_SUPABASE_URL = 你复制的 Project URL
   - VITE_SUPABASE_ANON_KEY = 你复制的 anon key
5. 点击 "Deploy"

### 6. 使用

部署成功后你会得到一个链接（如 https://football-checkin.vercel.app），
把这个链接发给朋友，大家用邮箱注册后各自打卡，数据互不影响！

## 本地使用

如果不想部署，也可以直接打开 index.html 使用（数据存本地浏览器）。
首次使用会提示输入 Supabase 配置，或者点"先看看"跳过。