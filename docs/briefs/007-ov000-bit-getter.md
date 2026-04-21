### claude-pc/brief-007-ov000-bit-getter

**Goal:** Match the single ov000 easy-tier bit getter at
`func_ov000_021ac550` as a low-risk Brief 007 opener.

**Context:**

- This target came from decomper's read-only scouting after brief 006.
  It was the safest next match: a 0x10 leaf, no callees, no data relocs,
  and only one known ov011 caller.
- The function extracts bit 0 from the first word of its input object.
  A one-bit unsigned bitfield matches the observed `ldr`, `lsl #0x1f`,
  `lsr #0x1f`, `bx lr` sequence.
- This was intentionally scoped as a one-target opener before deciding
  whether Brief 007 should continue into sinit outliers or tail-call
  wrappers.

**Scope:**

- `src/overlay000/ov000_021ac550.c`
- `config/eur/arm9/overlays/ov000/delinks.txt`

**Non-scope:**

- The ov011 tail-call wrapper pair:
  `func_ov011_021ce324` / `func_ov011_021ce334`.
- The deferred sinit outliers.
- Any `tools/`, `libs/`, `include/`, `AGENTS.md`, or workflow changes.

**Success:**

- `src/overlay000/ov000_021ac550` reports 100% in objdiff:
  16/16 code bytes, 1/1 function, 1/1 complete unit.
- `ninja rom` succeeds.
- `dsd check modules` remains at the expected 24/27 OK baseline.
- `check_match_invariants` reports 0 errors; placeholder-name warnings
  remain expected.

**Branch:** `claude-pc/brief-007-ov000-bit-getter`

**Shipped:** PR #85.
