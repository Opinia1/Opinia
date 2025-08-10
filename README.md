# Opinia (Sprint 0)
Measuring the World’s Sentiment — MVP scaffold.

## Path A — Deploy with your browser only (no installs)
1) Create accounts at **supabase.com**, **github.com**, **vercel.com** (same email is fine).
2) In Supabase → **New project** → copy **Connection string (URI)** from *Settings → Database*.
3) In GitHub → **New repository** `opinia` → **Upload files** (drag the contents of this ZIP) → Commit.
4) In Vercel → **Add New > Project** → import `opinia` repo → Add env var `DATABASE_URL` = the Supabase connection string → **Deploy**.
5) Open your site → go to `/api/health` to confirm it’s live.
6) (Later) In Supabase SQL Editor, paste `sql/opinia_init.sql` and **Run** to create tables.

## Path B — Run locally on Windows (recommended for testing)
Install:
- **Node.js LTS**: https://nodejs.org (choose LTS, e.g. 20.x)
- **Git for Windows**: https://git-scm.com/downloads
- **VS Code**: https://code.visualstudio.com

Steps:
```bash
# in VS Code terminal
npm i
npm run dev
# open http://localhost:3000 and /api/health
```

Optional DB:
- Copy `.env.example` to `.env`
- Set `DATABASE_URL` to your Supabase connection string
- In Supabase SQL Editor, run `sql/opinia_init.sql` (one time).

## What’s included
- Next.js 14 (App Router) + Tailwind
- API route: `/api/health`
- Prisma schema (for future DB features)
- One-shot SQL: `sql/opinia_init.sql`

## Next sprints
- Sprint 1: Poll creation + eligibility + voting
- Sprint 2: Sentiment pipeline + charts
- Sprint 3: Integrity (cooldowns, rate limits, trust weighting)
- Sprint 4: Open‑ended phases & snapshots
