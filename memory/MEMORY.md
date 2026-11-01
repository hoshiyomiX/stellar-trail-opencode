# Memory — trail-route (long-term; merge/promote only)

## Profile
- Owner: hoshiyomiX; repo pairing: stellar-trail (z.ai skill) ↔ stellar-trail-opencode (OpenCode port, TRAIL-ROUTE v1.0)
- Git identity: pass `-c user.name=hoshiyomiX -c user.email=hoshiyomiX@users.noreply.github.com` (no stored config in Termux)

## Locked decisions
- 2026-11-01: public repo slug = `hoshiyomiX/stellar-trail-opencode` (owner order)
- Installer doctrine v1.0: create-if-absent, never overwrite user AGENTS.md → `AGENTS.trail-route.md` + merge hint
- Sandbox arming layer (bootstrap/watcher/snapshot/explorer) intentionally DROPPED — Termux persists natively

## Inventory
- runtime: `~/.config/opencode/AGENTS.md` + `protocol-references.md` (hot-reload)
- dist repo: `~/trail-route` → origin main, sealed @484c939; CHANGELOG is the release ledger; integrity.sha256 covers config+docs payload only (runtime ledger excluded)

## Conventions & environment
- Validation battery pre-push: manifest / bash -n / JSONC struct-fallback (braces+trailing-comma, LABEL as fallback — no python/node in Termux) / name-consistency / secret scan (ghp_ 0 hits) / fence parity / post-push ls-remote + remote-manifest chain
- Token policy: inject via env + transient askpass in `/data/data/com.termux/files/usr/tmp/opencode/`, never in files/commits/chat-echoed output; ADMIN-SCOPE tokens pasted in chat MUST be revoked post-use (2026-11-01 event) — ask owner before destructive credential actions
- `python`/`node`/`jq` NOT installed on this Termux — stated-fallback gates only
