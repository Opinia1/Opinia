import Link from "next/link";
export default async function ExplorePage() {
  const sample = [
    { id: "demo1", q: "Quality of streets in Riyadh?", since: "2025-08-01", openEnded: true },
    { id: "demo2", q: "Ukraine–Russia: Who do you support more?", since: "2025-07-01", openEnded: true },
  ];
  return (<div className="space-y-6">
    <div className="flex items-center justify-between gap-3">
      <h1 className="text-2xl font-semibold">Explore</h1>
      <input placeholder="Search polls…" className="px-3 py-2 rounded-xl bg-white/10 border border-white/10 w-72" />
    </div>
    <div className="grid md:grid-cols-2 gap-4">
      {sample.map(p => (<Link key={p.id} href={`/poll/${p.id}`} className="card hover:bg-white/10">
        <div className="flex flex-col gap-2">
          <div className="text-lg">{p.q}</div>
          <div className="flex items-center gap-2 text-sm">
            <span className="badge">Open-ended · Since {p.since}</span>
            <span className="badge">Eligible</span>
          </div>
        </div>
      </Link>))}
    </div>
  </div>);
}
