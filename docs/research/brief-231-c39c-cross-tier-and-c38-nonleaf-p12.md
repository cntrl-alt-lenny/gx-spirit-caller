# Brief 231 — C-39c cross-tier workaround + C-38 non-leaf P-12 verdict

**Status:** Both investigations document permanent walls. Neither
sub-shape reaches the ≥2/3 lock threshold despite cross-tier
combinations and full falsification matrices.

- **Investigation A (C-39c bitfield packing)** — locked as **P-13**.
  All 5 mwcc tiers (2.0/sp1p5, 1.2/sp2, 1.2/sp2p3, 1.2/sp3, 1.2/sp4)
  produce identical output for the v1 baseline (TCO + mask fold).
  Best-case workarounds reach 2/3 features but never all 3
  simultaneously.
- **Investigation B (C-38 non-leaf chained-cast)** — locked as
  **P-12**. The brief 225 chained-cast recipe extends to non-leaf
  shapes (preserves under 1.2/sp2p3 and 1.2/sp3), but mwcc's
  register allocator consistently places `end` in r0 instead of
  orig's r3. 9 source-shape variants × 5 tiers tested; no nudge
  moves `end` to r3 under a tier that also preserves the cast.

## Investigation A — C-39c cross-tier workaround

### The wall

Brief 229 documented C-39c as a tier-mismatch wall: mwcc 2.0/sp1p5
has the right outer shape (single-push prologue + Style B
epilogue) but folds the `and+and+orr` packing masks; mwcc 1.2
preserves the masks but uses different prologue style. Brief 231
tested whether cross-tier workarounds unlock byte-identical
match.

### All 5 tiers identical on v1 baseline

Surprising finding: **all 5 available mwcc tiers** (2.0/sp1p5,
1.2/sp2, 1.2/sp2p3, 1.2/sp3, 1.2/sp4) produce **bit-identical
output** for the natural recipe `return helper(tag, packed, c,
e)`. TCO via `bx ip` + folded masks is consistent across every
SP revision.

This means TCO + mask-folding aren't tier-specific behaviours —
they're mwcc-version-spanning optimizations. Cross-tier
workarounds via different SP revisions don't unlock C-39c.

### Variant matrix (021d5b28, the best-case pick)

10 source-shape variants tested under 1.2/sp3 (the tier that
gives Style B epilogue + explicit pack):

| Variant | Idiom | Outer shape | Pack shape | Loop reg-alloc | Scheduling |
|---|---|---|---|---|---|
| v1 | `unsigned char a, b` args | ✓ | mask-folded | ✗ wrong | n/a |
| v2 | `int a, b` args | ✓ | mask-folded | ✗ wrong | n/a |
| v3 | explicit u32 masks | ✓ | ✓ `and+and+orr` | ✗ wrong | n/a |
| v4 | two named locals | ✓ | ✓ `and+and+orr` | ✗ wrong | n/a |
| **v5** | **swap decl `int j, i`** | ✓ | ✓ | ✓ matches orig | ✗ `lsr/mov r6` swapped |
| v6 | `register int i, j` | ✓ | ✓ | ✗ wrong (back to v3) | n/a |
| v7 | do-while loop form | ✓ | ✓ | ✗ wrong | n/a |
| v8 | `i = 0` BEFORE pack | ✓ | ✓ | ✗ shifted r6/r7/r8 | n/a |
| v9 | mask-first computation | ✓ | ✓ | ✗ wrong | n/a |

**Closest match (v5)**: produces the right outer shape, right
pack, AND right loop reg-alloc. Only the instruction scheduling
differs in 4 independent ops:

```
v5 1.2/sp3:                orig:
14: lsr r8, r0, #16        14: mov r6, #0
18: mov r6, #0             18: lsr r8, r0, #16
1c: mov r5, r6             1c: mov r4, #1
20: mov r4, #1             20: mov r5, r6
```

These 4 instructions have NO data dependencies between them, so
mwcc's instruction scheduler is free to reorder. Source-level
nudges (early-i-init, fake dependencies, register hints) either
don't change the schedule, or they change it in a way that
breaks other features.

Confirmed via build: shipping v5 as `.legacy_sp3.c` causes SHA1
fail at exactly these 4 bytes.

### Three picks, three failure modes

| Pick | Size | Failure mode |
|---|---|---|
| `021d59cc` | 60 B | TCO across ALL tiers. Helper takes 4 regs + 1 stack arg; mwcc tail-calls regardless of `void`/`int` return, intermediate locals, or volatile. Only address-taken locals (union) defeat TCO, but they force memory-based pack. |
| `021d5b28` | 88 B | Scheduling. v5 matches outer shape + pack + reg-alloc; only the `lsr r8 / mov r6` order differs. No source idiom defeats mwcc's scheduler reorder. |
| `021d5c50` | 84 B | Prologue style. orig has `push {r4,r5,lr} + sub sp, #4` (matches 1.2/sp3) BUT body has explicit `and+and+orr` (matches 1.2) AND prologue r3-push-include is unavailable. mwcc 2.0 has right body shape ONLY when `b` is `int` not `unsigned char` (forces mask), but 2.0 still folds. |

### P-13 classification

Locked as **P-13 cross-tier-irreducible**. Decomper should not
pilot C-39c picks further. The 4 known C-39c hits in ov002
(`021aba60`, `021d9828`, `021f6304`, `021ff6d0`) are already
shipped as `.s` under brief 207's C-34 recipe. The 3 brief 229
deferred picks should remain in gap objects.

## Investigation B — C-38 non-leaf chained-cast P-12 verdict

### The wall

Brief 225 locked the C-38 chained-cast leaf recipe
(`func_0207d304.legacy.c`) — `(unsigned short)(unsigned char)*p`
via named locals preserves both casts under mwcc 1.2/sp2p3. Brief
229 deferred 2 non-leaf siblings (`func_0207db8c`,
`func_0207dbf8`) as P-12 candidates. Brief 231 ran the full
falsification matrix.

### Variant matrix (0207db8c)

9 source-shape variants tested:

| Variant | Source idiom | Outer | Cast chain | end reg |
|---|---|---|---|---|
| v1 (brief 229) | struct ptr + inline `((u16)(u8)*p) & 1` | ✓ sp3 | ✗ fold (1.2 ldrb) | r0 |
| v2 | u32-word + inline chained | ✓ sp3 | ✗ collapsed (and+tst) | r0 |
| v3 | named-local chain (`v = (u8)*; t = (u16)v`) | ✓ sp3 | ✓ preserved | r0 |
| v4 (brief 229) | v3 + keep end alive | ✓ sp3 | ✓ preserved | r0 |
| v5 | `register unsigned int end` | ✓ sp3 | ✓ preserved | r0 |
| v6 | inline aligned via temp | ✓ sp3 | ✓ preserved | r0 |
| v7 | volatile flag_word + 2.0/sp1p5 | ✓ 2.0 | ✗ fold | **r3** ✓ |
| v8 | volatile + 1.2/sp3 | ✓ sp3 | ✓ preserved | r0 |
| v9 | mask before end load | ✓ sp3 | ✓ preserved | r0 |

**Best preservation (v3-v6, v8, v9)** under 1.2/sp3: outer shape ✓
+ cast chain ✓ + callee-saved alloc ✓, but `end` lives in r0
instead of orig's r3.

**v7 only path that puts end in r3**: requires mwcc 2.0/sp1p5
with `volatile flag_word` — but 2.0 STILL folds the chained cast
to `ldr + and #0xff + tst #1` (skipping `lsl/lsr #16`). v7 also
shuffles r4/r5 (mine: r4=self, r5=aligned vs orig: r4=aligned,
r5=self) — additional byte-level divergence.

### Tier-feature matrix

| Feature | 2.0/sp1p5 (v3+volatile) | 1.2/sp2p3 (v3) | 1.2/sp3 (v3) |
|---|:---:|:---:|:---:|
| Prologue matches orig (`push 3 + sub sp #4`) | ✗ (2.0 uses 4-reg push) | ✓ Style A | ✓ Style B ← orig matches sp3 |
| Chained cast preserved (`and+lsl/lsr+ands`) | ✗ folded | ✓ | ✓ |
| `end` in r3 (orig: `ldr r3, [r5, #4]`) | ✓ (with volatile) | ✗ (r0) | ✗ (r0) |

No single (tier, variant) gives all three. The closest is 1.2/sp3
+ v3 — only `end` register differs.

### Why mwcc can't be nudged to put end in r3

mwcc 1.2's register allocator follows a "first-fit-after-mov"
heuristic: after `mov r5, r0` (saves self), r0 is the lowest free
register. The first new load uses r0. Even with:

- `register unsigned int end` (mwcc 1.2 ignores register hints)
- Reordering source to compute mask first (mwcc reorders anyway)
- Splitting `end` initialization into multiple statements
- Volatile on the storage (forces memory but doesn't change reg)

mwcc consistently picks r0 for `end`. The orig was compiled with
a register allocator that chose r3 for the first load (probably
to keep r0 free for upcoming arg-shuffle). That choice isn't
reproducible from C source.

### P-12 classification

Locked as **P-12 non-leaf chained-cast reg-alloc divergence**.
Decomper should not iterate on chained-cast non-leaf picks.
`func_0207db8c` (76 B) and `func_0207dbf8` (60 B) remain `.s`
ships.

The chained-cast IDIOM extension to non-leaf shapes IS confirmed
— it's just that this particular pair has an additional
reg-alloc wall on top.

## Detector + tests

No detector extensions added — P-12 and P-13 are classifications
of EXISTING wall families (C-38 non-leaf variant + C-39c). The
existing C-38 and C-39 detectors already flag the affected
picks. The new entries in `codegen-walls.md` document the
"don't iterate" verdict.

## What's next

Both investigations close as permanent walls. Future briefs
should:

- **Not iterate on C-39c picks** without major toolchain changes
  (e.g., upgrading mwldarm to allow per-instruction tier
  selection, or a custom post-link patcher that swaps independent
  instructions).
- **Not iterate on chained-cast non-leaf picks**. The 2 known
  hits stay as `.s`.
- **Continue C-39a/b/d drains** (brief 226 + 228 + 230 path).
  Those have locked recipes and a clear drain queue (~400-500
  remaining picks).

## Drain impact

Brief 231 locks 0 new ships but documents 2 P-classifications.
Net effect: ~10-30 C-39c picks and 2 C-38-non-leaf picks
permanently `.s`. Decomper should remove these from any pilot
queue.

## Cross-references

- `docs/research/brief-222-c39-non-leaf-bitfield.md` — base C-39
- `docs/research/brief-225-c39-subpatterns-and-c38-deferred.md` —
  C-38 chained-cast leaf recipe + brief 225 near-misses
- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`
  — C-39a + C-39b (locked sub-shapes)
- `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md` —
  C-39d (locked), C-39c (tier-mismatch), C-38 non-leaf (P-12
  candidate)
- `src/main/func_0207db8c.s`, `src/main/func_0207dbf8.s` — P-12
  picks that remain `.s`
- `src/overlay002/func_ov002_021aba60.s` (+ 3 siblings) —
  pre-existing C-34+C-39c picks, already `.s`
