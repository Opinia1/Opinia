-- Opinia initial tables (safe to run once DB features are needed)
create type gender as enum ('male','female','other','undisclosed');
create type verificationlevel as enum ('none','basic','verified','trusted');
create type pollkind as enum ('evergreen','timeboxed','milestone');
create table if not exists "User" (
  id uuid primary key default gen_random_uuid(),
  handle text unique not null,
  email text unique not null,
  nationality text not null,
  country text not null,
  city text,
  birth_year int not null,
  gender gender not null default 'undisclosed',
  verification_level verificationlevel not null default 'none',
  created_at timestamptz not null default now()
);
create table if not exists "Poll" (
  id uuid primary key default gen_random_uuid(),
  question text not null,
  type text not null,
  options_json jsonb not null,
  language text not null default 'en',
  is_open boolean not null default true,
  created_at timestamptz not null default now(),
  started_at timestamptz not null default now(),
  closes_at timestamptz,
  owner_id uuid not null,
  tags text[],
  eligibility_json jsonb not null default '{}',
  visibility text not null default 'show_but_locked',
  poll_kind pollkind not null default 'evergreen',
  phase int not null default 1,
  decay_half_life_days int
);
create table if not exists "VoteEvent" (
  id uuid primary key default gen_random_uuid(),
  poll_id uuid not null,
  user_id uuid not null,
  option_id text not null,
  value_numeric double precision,
  mood_score int,
  comment_text text,
  created_at timestamptz not null default now(),
  client_locale text,
  client_tz text,
  trust_score double precision not null default 0.5,
  risk_tags text[] not null default '{}'::text[]
);
create table if not exists "SentimentEvent" (
  id uuid primary key default gen_random_uuid(),
  poll_id uuid not null,
  user_id uuid not null,
  option_id text not null,
  raw_model_score double precision,
  mood_score int,
  blended_score double precision,
  model_version text,
  created_at timestamptz not null default now(),
  included boolean not null default true
);
create table if not exists "PollPhase" (
  id uuid primary key default gen_random_uuid(),
  poll_id uuid not null,
  phase int not null,
  label text,
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  notes_json jsonb
);
create table if not exists "SentimentSnapshot" (
  id uuid primary key default gen_random_uuid(),
  poll_id uuid not null,
  phase int not null,
  ts timestamptz not null,
  window text not null,
  metrics jsonb not null
);
create index if not exists idx_voteevent_poll_time on "VoteEvent"(poll_id, created_at);
create index if not exists idx_voteevent_user_poll on "VoteEvent"(user_id, poll_id);
create index if not exists idx_sentimentevent_poll_time on "SentimentEvent"(poll_id, created_at);
