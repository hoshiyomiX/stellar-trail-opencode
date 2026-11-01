# TRAIL-ROUTE v1.0 — runtime protocol for OpenCode on Termux/Android (GLM)

Lineage: adapted from [hoshiyomiX/stellar-trail](https://github.com/hoshiyomiX/stellar-trail) v5.5.0 — the 6-phase execution core + M0–M3 memory lifecycle — re-bound to OpenCode V2 mechanics for a token-optimized GLM workflow on a free, rate-sensitive model.

## What this installs

Two runtime files for `~/.config/opencode/`:

| File | Role | Collision policy (install.sh) |
|---|---|---|
| `config/AGENTS.md` | The protocol body: 6 phases, M0–M3 memory, token budgets, arm64 hard rules | create-if-absent; if yours exists → written as `AGENTS.trail-route.md` + merge hint |
| `config/protocol-references.md` | On-demand deep reference (templates, recipes, recall manifest) | create-if-absent; identical → skip |
| `config/opencode.jsonc.sample` | Hardened permissions block | NEVER auto-applied; printed for manual merge |

## Install (Termux)

```bash
git clone https://github.com/hoshiyomiX/stellar-trail-opencode ~/trail-route
cd ~/trail-route && sha256sum -c integrity.sha256   # expect all OK
bash install.sh
```

Idempotent and offline-safe: re-run after `git pull` to repair/update. No scripts are armed at runtime (Termux filesystem persists — the stellar-trail sandbox arming layer does not apply).

Update later:

```bash
cd ~/trail-route && git pull && bash install.sh
```

Uninstall: delete `~/.config/opencode/AGENTS.md` (or the `AGENTS.trail-route.md` you merged) and `~/trail-route`.

## Requirements

- OpenCode V2 (2.x) — config hot-reloads, no restart needed.
- Optional in `opencode.jsonc`: `"instructions": ["~/.config/opencode/AGENTS.md"]` when seeding a non-default AGENTS path.

## Why token-optimized

The free GLM variant pays in round-trips, not dollars. This adaptation keeps every auditable discipline of the source protocol and cuts the artifacts that cost rounds/banners: on-boot reference reads, 🌠 banners per response, sandbox arming scripts, forced 4–8 question batches. See [docs/HARNESS-MAPPING.md](docs/HARNESS-MAPPING.md).

## License

MIT No Attribution — same as stellar-trail.
