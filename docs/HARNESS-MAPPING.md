# HARNESS-MAPPING — stellar-trail v5.5.0 → TRAIL-ROUTE v1.0 (OpenCode V2, Termux/Android arm64)

Adaptation principle inherited from the source protocol: where the platform ships a native form, INHERIT it — never duplicate or fight it. Conflicts resolve toward the stricter mandate.

## Execution core

| stellar-trail (z.ai sandbox) | TRAIL-ROUTE (OpenCode) | Why |
|---|---|---|
| Mandatory 6-phase workflow, markers per phase | Same 6 phases; phase text = audit trail, no banner tokens | GLM free-tier: output tokens are the budget |
| Clarify = 4–8 questions, one batch, always | `question` tool = the platform's clarification gate; scale 0–≤3 (T1/T2), ≤8 only for open briefs; resume turns never re-ask | Batched-question tool exists natively; forced batches burn a round on trivial edits |
| Visible plan via platform TodoWrite | Numbered list in-model (OpenCode ships no todo tool) | Platform inheritance |
| Phase 4 scripts persist to files | Same + prefer `edit` over `write`, batch independent calls, Code Mode for parallel reads | Round-trip economy on a rate-limited model |
| Validate L1–L5 via `enforce-gates.sh` | Same layers; terminal checks run directly: `bash -n`, `py_compile`, `node --check`, `python -m json.tool` | No gate script dependency outside its own repo; honesty rule kept verbatim |
| Report ≤100 words + banner | ≤100 words, marker one-liners (`M1 · task <id>`), user language | Banner-free auditability |

## Memory lifecycle

| Stage | stellar-trail | TRAIL-ROUTE |
|---|---|---|
| M0 restore | Read body + SESSION-STATE + MEMORY + worklog tail; run `bootstrap-sandbox.sh --ensure`, `update-skill.sh --ensure`, watcher | Read SESSION-STATE + MEMORY + worklog tail (hard budget). NO arming scripts — Termux filesystem persists; the sandbox persistence layer does not apply |
| M1 checkpoint | Atomic SESSION-STATE rewrite; snapshot FIRST, worklog append LAST; `snapshot-repo.sh --apply-auto` (repo.tar) | Same write order; Platform snapshots + atomic rewrite built in — no tar archive |
| M2 compress | STOP, write CRITICAL items first | Identical |
| M3 handoff | 7-section archive + MEMORY promotion on ANY exit signal | Identical (templates in protocol-references.md) |
| Summary quarantine (H8–H13) | Continuation summaries quarantined; Max-Shield on sealed tasks; conflict reporting | Kept verbatim — same failure class exists on any harness |

##_strlen budgets kept
MEMORY.md ≤ ~80 lines; worklog rotates last-3 sections to archive; M0 gap-fill reading only below full recall; reference fetches section-scoped (this repo's counterpart: `protocol-references.md`, on demand — never at boot).

## Termux/arm64 hard rules (adds — source has no counterpart)
- `glob`/`grep` TOOLS fail on arm64-android ("unsupported platform for ripgrep") → search via shell `grep -rn`/`find`/`ls`; never retry them.
- Dedicated tools for read/edit/write; shell for search/git/processes/pipes; no decorative `echo`/banners.
- Temp dir: `/data/data/com.termux/files/usr/tmp/opencode`.
- A tool that errors twice → switch route, don't rephrase.

## What was dropped and why
Sandbox arming (`bootstrap`/`watcher`/`update-skill`/`snapshot-repo`/explorer) — reset-prone-container machinery; a private Termux install persists files natively. Kept reachable: the source repo stays the canonical home for those layers.
