import "./globals.css";
import Link from "next/link";
export const metadata = { title: "Opinia", description: "Measuring the World’s Sentiment" };
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (<html lang="en"><body>
    <header className="border-b border-white/10">
      <div className="container flex items-center justify-between h-16">
        <Link href="/" className="font-semibold text-lg">Opinia</Link>
        <nav className="flex items-center gap-3">
          <Link className="btn" href="/create">Create Poll</Link>
          <Link className="btn" href="/dashboard">Dashboard</Link>
        </nav>
      </div>
    </header>
    <main className="container py-8">{children}</main>
    <footer className="container py-12 opacity-70">
      <div className="text-sm">Opinia — Measuring the World’s Sentiment</div>
    </footer>
  </body></html>);
}
