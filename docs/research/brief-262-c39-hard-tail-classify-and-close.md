[//]: # (markdownlint-disable MD013 MD041)

# Brief 262 — classify the C-39 ov002 hard tail + close C-39

**Status:** triaged. Direct-mwcc only (no ROM build, no SHA1). Every
coercibility verdict is a real mwcc compile this session vs the
`dsd`-delinked orig bytes.

## Headline

**The deferred-resister→coercible pattern (db973→C-39f,
global-chase→C-39g) holds emphatically: 4 of the 6 hard-tail shapes are
cleanly coercible NOW, and the other 2 reduce to the
already-classified P-11 CSE field-temp — no new permanent wall.**
§ C-39 is **closed**: the cheap vein is mined out, the hard tail is an
opportunistic decomper sweep (existing levers + one new gotcha 16),
and the only permanent residue is the known P-11.

| Shape | Pick(s) | Verdict |
|---|---|---|
| Stride-reuse compare | `0220b420`, `0228abd8` | **COERCIBLE** (byte-identical; the "constant-fold→P" diagnosis was wrong) |
| Multi-helper-`pre()` chain | `02294b64` | **COERCIBLE** (shift-form mask + invert-polarity — existing) |
| Arg-bit-packing | `02231f4c` | **COERCIBLE** (byte-identical; NEW gotcha 16 u8-cast) |
| Global 3-way switch | `0222b2e0` (`0223483c`) | **COERCIBLE** (byte-identical; `switch` + shared-epilogue `break`) |
| Weird range/mask | `02205c4c` | shape coercible; blocked by **P-11 CSE field-temp** |
| Composite (3-exit) | `0220000c` | composite of coercible shapes; blocked by **P-11 CSE field-temp** + grind |

## Per-shape detail

### 1. Stride-reuse → COERCIBLE (byte-identical)

Orig computes the guard bound as `add rN, stride, #K` (reusing the
0x868 stride already in a reg). Brief 261 read this as P because C
constant-folds `0x868 + K` to one literal. **Falsified:** the natural
`if (table[bit0] > 0xbb8)` makes mwcc derive the bound from the live
stride via `add r2, r2, #0x350` (its constant-derivation peephole, same
family as C-15). `func_ov002_0220b420` is **fully byte-identical
(26/26)** with the plain C-39f recipe; `0228abd8` is the same shape
(`add r2, r2, #0x15c` = 0x868+0x15c). Falsification test: `if (v >
0xbb8)` vs orig — identical, including `add r2, r2, #0x350`.

### 2. Multi-helper-`pre()` chain → COERCIBLE (existing levers)

`if (h1(bit0, f0, 0) < 0) return 0; return h2(*pre() & 0x1fff) >= 5;`.
Two residuals, both existing gotchas: (a) `& 0x1fff` — mwcc pool-loads
the mask + `and`; orig uses `lsl#19; lsr#19`, recovered by writing
`((unsigned)x << 19) >> 19` (shift-form, confirmed byte-matched); (b)
the early `return 0` predicates (`movlt/poplt`) where orig branches to
a shared epilogue — invert-polarity (gotcha 5). Falsification test: the
shift-form mask compiled to `lsl r0,#19; lsr r0,#19` (matched).

### 3. Arg-bit-packing → COERCIBLE (byte-identical; new gotcha 16)

`helper(1-bit0, f0, (u16)((((g.fcec==bit0)+2)&0xff)<<4|1), 0)`. Orig
keeps a redundant `and #0xff` on the provably-small `(cond+2)∈{2,3}`;
mwcc folds it away. **Lever (gotcha 16):** type the masked intermediate
`unsigned char t = (cond)+2` — the u8 TYPE forces the `and #0xff`. An
explicit `(c & 0xff)` does NOT (mwcc proves `c<256` and folds); only the
u8 cast/type works. `func_ov002_02231f4c` is **byte-identical (22/22)**.
This likely also cracks brief-257's byte-pack mask-fold class
(`021f4d3c`) — a lead for the decomper.

### 4. Global 3-way switch → COERCIBLE (byte-identical)

`switch (g.f5a8) { case 0x80: …; case 0x7f: …; default: … }` over the
contiguous {0x7f,0x80}. mwcc emits a sequential
`cmp #0x7f; beq; cmp #0x80; bne` (no range-fusion for the switch). The only residual was the
`return 0` epilogue: an explicit `return 0` per case generates a
separate epilogue; orig **shares** it. Lever: `break` to a single
trailing `return 0`. `func_ov002_0222b2e0` is **byte-identical (22/22)**
with `case 0x7f: func(); break; … return 0;`. (`0223483c` is the same
family — verify per-pick.) Falsification test: separate `return 0` → one
extra epilogue; `break`+shared → identical.

### 5. Weird range/mask → shape coercible, P-11-blocked

`if (b11_6 == 6 || b11_6 == 7)` lowers to the unsigned range check
`(u16)(b11_6 - 6) <= 1`, with the `0xfffa` constant built via the pair
`add #0xfa; add #0xff00` (same derivation as stride-reuse). The **operation
sequence is byte-matched** — the range/mask is coercible. The residual
is the `@2` field landing in r2 vs orig's `ip`: that is the **brief-258
P-11 CSE field-temp** (the field is CSE'd for the range test + bit0).
Falsification test: v0 reproduced the `add #0xfa; add #0xff00; cmp #1;
bhi` exactly; only the field register diverged. NOT a new wall.

### 6. Composite (3-exit) → coercible parts, P-11-blocked

`0220000c` (0x78): `b11_6==2` guard + 2-D C-39f index (`base +
(bit0&1)*0x868 + b5_1*20`) + bit5 test + helper, across 3 return-0
exits. Every component is a now-coercible shape (range guard, 2-D C-39f
per gotcha 14/7, shared-epilogue), but the `@2` field is CSE'd for the
range test + bit0 + b5_1 → the same **P-11 CSE field-temp** residual,
plus multi-exit predication grind. Brief 261's 57% was this stack of
levers not all applied at once. NOT a new wall.

## § C-39 — CLOSED

The hard-tail triage surfaced **no new permanent wall.** The C-39
taxonomy is complete: base C-39 + sub-shapes a/b/d/e + C-39f
(bit0-table-index, gotcha 14) + C-39g (global-ptr-chase, gotcha 15),
with the coercibility toolkit (gotchas 4/5/6/7/14/15/16 + shift-form +
invert-polarity + shared-epilogue + arg-liveness). The only permanent
residue is the **P-11 CSE field-temp** (brief 258), which `02205c4c` /
`0220000c` carry. The cohort's cheap vein is mined out; the over-fire
cohort (brief 263) is the right pivot. The remaining ~28 ≤0x80 C-39
picks are opportunistic decomper cleanup (4 shapes ready; 2 wait on the
P-11 / permuter), not a dedicated wave.

## What did NOT pan out

1. **The "stride-reuse = P" hypothesis.** It was a misdiagnosis: mwcc
   derives the bound from the live stride automatically; the natural
   recipe is byte-identical. The decomper saw the `add` and assumed C
   couldn't express it.
2. **The "weird range/mask" and "composite" as distinct walls.** Both
   reduce to the already-classified P-11 CSE field-temp once the
   range/index parts are shown coercible — they are not new mechanisms.
3. **Explicit `& 0xff` to recover the byte mask.** mwcc folds it on a
   provably-small value; only the `unsigned char` *type* forces it
   (gotcha 16). The explicit-mask intuition fails.

## Falsification-test ledger (this session)

| Claim | Test | Result |
|---|---|---|
| Stride-reuse coercible | `if (v > 0xbb8)` vs orig | byte-identical 26/26 (`add r2,r2,#0x350`) |
| Arg-bit-pack coercible (u8) | `unsigned char t=(cond)+2` | byte-identical 22/22 (`and #0xff` emitted) |
| Global-switch coercible | `switch`+`break` shared `return 0` | byte-identical 22/22 |
| Multi-helper-pre mask | `(x<<19)>>19` | `lsl;lsr` matched |
| Range/mask + composite = P-11 | v0 op-seq vs orig | op-seq matches; field reg diverges (P-11) |

## Cross-references

- `docs/research/brief-261-c39-ov002-drain-wave4.md` — the ~28-pick
  hard tail this triages.
- `docs/research/brief-258-c39-cse-field-temp-and-taxonomy.md` — the
  P-11 CSE field-temp the 2 hard picks reduce to.
- `docs/research/codegen-walls.md` § C-39 (closed) + recipe-gotchas.md
  gotcha 16 (u8-cast mask).
