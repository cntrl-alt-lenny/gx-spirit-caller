### cloud/c15-vs-p1-taxonomy-plus-ldr-ip-wall

**Goal:** Two-part fold + research brief —

1. **C-15 vs P-1 taxonomy clarification** (fast fold). Wave 14
   misapplied C-15 to 7 P-1 candidates because both walls look
   superficially similar (2-insn → 1-insn collapse). Fold the
   distinction into `codegen-walls.md` so future pilots don't
   repeat the misapplication.
2. **`ldr ip; bx ip` vs `ldr r1; bx r1` wall** (new investigation).
   Wave 14 dropped `func_0209085c` because target uses `ldr r1;
   bx r1` for the tail-call but mwcc emits `ldr ip; bx ip` even
   with `.legacy.c` routing. Sweep to classify (C-N / T-N / P-N).

**Context:**

Wave 14 PR #372 surfaced both findings. The C-15-vs-P-1 lesson
is a teaching/fold issue; the `ldr ip` wall is a fresh
investigation in the same shape as brief 048 (push-r0 → C-12) and
brief 050 (W-F → C-14).

**Part 1 — C-15 vs P-1 taxonomy fold (fast):**

Both walls are 2-instruction → 1-instruction collapses but differ
fundamentally:

| Wall | Pattern | Trigger | Fix |
|---|---|---|---|
| **C-15** | mvn-vs-sub peephole on `-1` immediate | **mwcc 2.0 only** | Route through `.legacy.c` or `.legacy_sp3.c` |
| **P-1** | `lsl K; lsr K` → `and #mask` on zero-extend | **All mwcc SPs** | Permanent — no coercion |

The shape similarity that misleads:
- C-15: `mvn r1, #0` (target, 1 insn) vs `sub r1, r0, #1` (mwcc, 1 insn) — same instruction count, different opcode.
- P-1: `lsl r0, r0, #16; lsr r0, r0, #16` (target, 2 insns) vs `and r0, r0, #0xffff` (mwcc, 1 insn) — different instruction count.

If you see a **2-insn target → 1-insn mwcc collapse on a
halfword/byte extract or zero-extend**, that's P-1, not C-15.
Routing doesn't fix P-1.

Action: append a "**Wall family note**" section near both entries
in `codegen-walls.md` with the distinction table + the
misapplication example from wave 14.

**Part 2 — `ldr ip; bx ip` wall (sweep):**

Target ROM for `func_0209085c` (and presumably others — sweep for
sibling shapes):

```text
ldr r1, =target
bx  r1
```

mwcc emits, across all SPs tried:

```text
ldr ip, =target
bx  ip
```

Same byte count; different scratch register. The single byte
difference makes byte-compare fail.

**Method (per brief 050 / 052 pattern):**

1. **C-variation sweep (~10 shapes):** various function-pointer
   tail-call forms, inline-asm preamble, struct dispatcher,
   pointer-to-function-pointer indirection, signature variations,
   `register int x asm("r1")`.
2. **mwcc-version sweep across all 15 SPs.** Some SP may pick r1
   (would classify as T-N new tier).
3. **Inline-asm hypothesis** if (1) + (2) flat.

**Classify and add to codegen-walls.md:**
- C-N (coercible) → tiny decomper brief unblocks affected
  targets.
- T-N (new routing tier) → significant; brain decides whether to
  ship a 4th tier (cost-benefit needs the sweep's candidate
  count).
- E-N (asm-only) → mark for `.s` files.
- P-N (permanent) → defer; mark in cross-reference.

**Non-scope:**

- ❌ Implementing any new routing tier from part 2 — if T-N,
  brain queues a separate brief.
- ❌ src/, libs/, AGENTS.md, state.md edits.

**Success:**

- C-15 vs P-1 distinction folded into codegen-walls.md with
  worked example from wave 14.
- `ldr ip` wall entry (W-H or next letter) added with verdict +
  evidence.
- Sweep finds ≥1 additional unmatched candidate sharing the wall
  (so the count guides brain's T-N decision if applicable).
- Markdown lint clean.

**Branch:** `cloud/c15-vs-p1-taxonomy-plus-ldr-ip-wall`

**Priority:** Medium. Decomper isn't blocked; brief 053 explicitly
skips P-1 candidates. Part 1 is ~30 min; part 2 is the
time-consuming piece.

**After this brief lands:**

1. If part 2 → C-N: small decomper brief unblocks affected
   candidates.
2. If part 2 → T-N + ≥5 candidates: brain queues a 4th-tier
   routing-implementation brief (cloud).
3. Otherwise: documented + deferred.
