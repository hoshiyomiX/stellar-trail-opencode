#!/data/data/com.termux/files/usr/bin/bash
# trail-route install.sh — idempotent, offline, create-if-absent (never overwrites a user file).
set -u
SRC="$(cd "$(dirname "$0")" && pwd)/config"
DEST="${HOME}/.config/opencode"
mkdir -p "$DEST"
STATUS=0

echo "== trail-route v1.0 installer =="

# 0) Integrity gate — byte-verified tree before anything moves.
cd "$SRC/.." || exit 1
if command -v sha256sum >/dev/null 2>&1; then
  if ! sha256sum -c integrity.sha256 --quiet; then
    echo "INTEGRITY FAIL — run: git status && git checkout -- .  (or re-clone)"; exit 1
  fi
  echo "integrity: OK"
else
  echo "integrity: sha256sum unavailable — skipped (stated fallback, not a silent claim)"
fi

# 1) protocol-references.md — utility file, overwrite only if incoming differs.
if [ -f "$DEST/protocol-references.md" ]; then
  if cmp -s "$DEST/protocol-references.md" "$SRC/protocol-references.md"; then
    echo "protocol-references.md: already present (identical) — skip"
  else
    cp "$SRC/protocol-references.md" "$DEST/protocol-references.md"
    echo "protocol-references.md: UPDATED (existing copy was a previous release)"
  fi
else
  cp "$SRC/protocol-references.md" "$DEST/protocol-references.md"
  echo "protocol-references.md: installed"
fi

# 2) AGENTS.md — the collision-sensitive one: create-if-absent, never overwrite.
if [ -f "$DEST/AGENTS.md" ]; then
  if cmp -s "$DEST/AGENTS.md" "$SRC/AGENTS.md"; then
    echo "AGENTS.md: already installed (identical) — skip"
  elif [ -f "$DEST/AGENTS.trail-route.md" ] && cmp -s "$DEST/AGENTS.trail-route.md" "$SRC/AGENTS.md"; then
    echo "AGENTS.trail-route.md: already current — skip"
  else
    cp "$SRC/AGENTS.md" "$DEST/AGENTS.trail-route.md"
    echo "AGENTS.trail-route.md: written (you already have an AGENTS.md)."
    echo "  MERGE HINT: add path to opencode.jsonc ->"
    echo '  "instructions": ["~/.config/opencode/AGENTS.md", "~/.config/opencode/AGENTS.trail-route.md"]'
    echo "  or swap files manually. Your existing AGENTS.md was NOT touched."
    STATUS=2
  fi
fi
if [ ! -f "$DEST/AGENTS.md" ]; then
  cp "$SRC/AGENTS.md" "$DEST/AGENTS.md"
  echo "AGENTS.md: installed"
fi

# 3) Permissions sample — advice only, never applied.
echo "opencode.jsonc.sample: NOT applied by design. Merge manually if wanted:"
sed -n 's/^  //p' "$SRC/opencode.jsonc.sample" 2>/dev/null | head -3
echo "  ... (full sample at $SRC/opencode.jsonc.sample)"

# 4) Verify runtime wiring (OpenCode hot-reloads config; no restart needed).
if [ -f "$DEST/AGENTS.md" ] && [ -f "$DEST/protocol-references.md" ]; then
  echo "install: OK — start a new session or /reload to activate."
else
  echo "install: INCOMPLETE"; exit 1
fi
echo "== done (exit $STATUS) =="
exit $STATUS
