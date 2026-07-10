-- 在 Supabase SQL Editor 中运行这段 SQL
-- 创建打卡数据表

CREATE TABLE IF NOT EXISTS checkins (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  data jsonb NOT NULL DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- 允许用户通过 user id 来 upsert
-- 注意：id 字段会使用用户的 auth.users.id
-- 先在 Supabase Dashboard > SQL Editor 运行