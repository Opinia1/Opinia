import Link from "next/link";
export default function PollDetail({ params }: { params: { id: string }}) {
  return (<div className="space-y-4">
    <Link href="/" className="text-sm opacity-70">← Back</Link>
    <div className="card space-y-4">
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-semibold">Poll #{params.id}</h1>
        <span className="badge">Open-ended · Since 2025-08-01</span>
      </div>
      <div className="text-sm opacity-80">Vote area (Sprint 1)</div>
    </div>
    <div className="grid md:grid-cols-2 gap-4">
      <div className="card h-56">Live Results (bar chart) — Sprint 1</div>
      <div className="card h-56">Sentiment Over Time — Sprint 2</div>
    </div>
  </div>);
}
