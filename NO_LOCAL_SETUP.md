# Deploy Opinia without installing anything (Browser-only)
Use **Supabase** (database), **GitHub** (code), **Vercel** (hosting).

A) Create accounts at supabase.com, github.com, vercel.com

B) In Supabase → **New project** → copy **Connection string (URI)** from Settings → Database.

C) In GitHub → New repository `opinia` → **Upload files** (drag the contents of this ZIP) → Commit.

D) In Vercel → **Add New > Project** → import `opinia` repo → Add env var `DATABASE_URL` with the Supabase connection string → **Deploy**.

Open your site and visit `/api/health`. For DB tables later, use `sql/opinia_init.sql` in Supabase SQL Editor.
