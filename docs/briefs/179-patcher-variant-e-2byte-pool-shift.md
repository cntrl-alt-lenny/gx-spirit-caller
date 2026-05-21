### cloud/patcher-variant-e-2byte-pool-shift

**Goal:** Extend `tools/patch_ov004_veneers.py` to handle
2-byte (or 1-3 byte) veneer pool shifts at low n. Brief
173 (PR #612) found that all 3 source-level recipes for
odd-aligned ov004 `.rodata` slots fail because mwldarm
enforces 4-byte alignment regardless of source-side
directives. **The path-2 mechanism itself works at the
veneer level** (all 3 source variants suppressed both
remaining veneers); the SHA1 failure is purely byte-layout
shift. Variant E closes the layout problem.

**Context — what brief 173 documented:**

Brief 173 ran 4 variants on `data_ov004_021ded69` (the
smaller odd-aligned candidate). All FAIL — but the failure
mode is layout, not mechanism:

| Variant | Source-side | Veneer count | Failure |
|---|---|---:|---|
| A | `aligned(1)` C | 0 | +1 byte shift |
| B | `.s` + `.align 0` | 0 | +3 byte shift |
| C | Pattern 3 chunk | 0 | -288 byte shrink (`.text` classify) |
| D | Bundle analog | n/a | dsd containment fail |

**Critical positive finding**: all 3 source variants
successfully suppressed BOTH remaining veneers — path-2
mechanism works at veneer level; SHA1 failure is purely
byte-layout shift.

> **Variant E proposal**: extend
> `tools/patch_ov004_veneers.py` to handle 2-byte (or 1-3
> byte) veneer pool shifts at low n. Analogous to brief
> 164's walk-forward detector generalisation that closed
> the n=5 residual.

**Brief 179 deliverables:**

### Part 1 — Diagnose the byte-shift mechanism

Reproduce brief 173's Variant A or B (whichever is
simplest) on `data_ov004_021ded69`. Capture pre- and
post-patch arm9_ov004.bin + bisect against orig:

1. The veneer pool's start shifts by 1-3 bytes (depending
   on variant). Identify where in the build it shifts.
2. The 4-byte alignment that mwldarm enforces on `.rodata`
   places the symbol at the NEXT 4-aligned vaddr instead
   of the odd-aligned one in orig. The veneer pool, which
   sat in the gap before, gets displaced by the
   alignment-padding bytes.

### Part 2 — Extend the patcher

The patcher's `_scan_veneer_pool` scans for the veneer
prefix bytes at a 4-byte-aligned offset. Variant E
extends it to:

1. **Detect** misaligned pool: scan for `VENEER_PREFIX` at
   any byte boundary (1-3 byte shift), not only 4-byte.
2. **Splice** at the actual found offset.
3. **Re-encode** any post-splice section to compensate
   for the chunk's natural alignment.

Brief 164's walk-forward detector is the pattern to
follow. Add a `MAX_SHIFT_BYTES = 3` safety bound to
prevent runaway scanning.

### Part 3 — Verify end-to-end with real source claim

After the patcher fix:

1. Claim `data_ov004_021ded69` via brief 173's Variant A
   (`aligned(1)` C) — the simplest variant.
2. Run `ninja sha1` for all 3 regions. Should PASS.
3. Also try `data_ov004_021e191c` (the other odd-aligned
   candidate). If both can be claimed simultaneously,
   path-2 reaches n=0.

The source claims should be REVERTED before commit (per
brief 173 precedent — this brief ships the patcher fix,
not source claims).

### Part 4 — Tests

- Pin the new shift-detection at 1-byte, 2-byte, 3-byte
  shifts.
- Regression: existing n=2, n=5, n=9, n=86 paths still
  bit-identical.
- New `MAX_SHIFT_BYTES` safety cap test.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (current main, n=2).
- Manual injection of `data_ov004_021ded69` claim via
  Variant A → 3-region SHA1 PASS at n=0.
- Manual revert → 3-region SHA1 PASS at n=2 (idempotent).
- All existing tests pass + new low-n shift tests.

**Non-scope:**

- ❌ Source-claim shipping (decomper brief 180+ owns
  path-2 final wave).
- ❌ Cluster D-3 cross-region (brief 178 decomper,
  parallel-track).
- ❌ Odd-aligned slot recipes for other contexts (brief
  173 already documented).
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- Patcher handles 1-3 byte pool shifts at low n.
- Real `data_ov004_021ded69` claim ships + reverts
  cleanly with 3-region SHA1 PASS at n=0 (n=2 baseline
  also preserved).
- New regression tests pin the new shift-detection at
  multiple offsets.
- W7 patcher chain extends: 134 → 142 → 146 → 150 → 162
  → 164 → 168 → **179**.

**Branch:** `cloud/patcher-variant-e-2byte-pool-shift`

**Priority:** MEDIUM. Closes path-2 to its structural
floor at n=0. Not on the SHA1-critical path (already PASS
at n=2).

**After this brief lands:**

1. Brief 180 (decomper) ships path-2 final wave —
   claims both `data_ov004_021ded69` +
   `data_ov004_021e191c`, drops n=2 → n=0.
2. ov004 `.rodata` cluster reaches its source-claimed
   floor. Any further ov004 work needs different
   approaches (e.g., reclassification path-1 with
   improved methodology beyond brief 154).
3. W7 patcher chain is now fully calibrated across the
   empirical n range AND handles arbitrary 1-3 byte
   pool shifts.
