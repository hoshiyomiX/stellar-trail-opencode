# TRAIL-ROUTE — deep references (on-demand only; never loaded at boot)

## A. SESSION-STATE.md template (atomic rewrite)
```
Line 1 — ⚡ protocol: TRAIL-ROUTE v1.0 — template survives every rewrite
Checkpoint at: <date · time>
## Active
| #ID | task | status | next anchor | updated |
## Pending decisions
## Recent artifacts (paths only)
## Next steps
```

## B. M0 recall manifest (answer from FILES, 7 questions)
1 task identity/top · 2 locked decisions · 3 artifacts & paths · 4 user profile/preferences · 5 trajectory (what's next) · 6 pending/blockers · 7 environment truths. Below full recall → read handoff archive or worklog tail, re-verify. Never fabricate to pass.

## C. M3 handoff — 7 sections (write "none" explicitly, never omit)
task identity & status · decisions & why · artifacts (paths) · open threads/pending · environment/commands that worked · trajectory (next step) · pointer to previous handoff.

## D. Search & verify recipes (arm64-android / Termux)
- Find text: `grep -rn "pattern" <dir> --include="*.ext"` ; find files: `find <dir> -type f -name "*name*"` ; list: `ls -la`.
- Bulk-read many files in one round: Code Mode `Promise.all` of `read` calls.
- Syntax gates: bash `bash -n f.sh`; Python `python -m py_compile f.py`; JS `node --check f.js`.
- JSON validity: `python -m json.tool f.json` (exit 0 = pass).

## E. Question-tool batch shape (Phase 2 gate)
Each option = label + consequence. Max 3 for normal tasks; "let me decide" free-form allowed; one batch per task only; WAITING rows never re-ask closed batches.

## F. Known weak spots (append when a class repeats)
- (none yet)
