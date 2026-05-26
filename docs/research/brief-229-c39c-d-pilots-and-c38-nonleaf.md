# Brief 229 — C-39c + C-39d pilots + C-38 non-leaf chained-cast

**Status:** Mixed outcomes across three pilots:

- **C-39c (bitfield packing)** — NEAR-MISS / NOT LOCKED. 0/3 picks
  ship byte-identical. Tier-mismatch wall: the right outer shape
  (single-push prologue + Style B epilogue) needs mwcc 2.0; the
  right inner shape (explicit `and+and+orr` pack) needs mwcc 1.2.
  No single tier provides both.
- **C-39d (multi-call re-read)** — LOCKED. 3/3 picks ship
  byte-identical under "natural source" recipe. Brief 224's
  hypothesis of "needs CSE-defeat idiom" was wrong: mwcc 2.0
  already preserves the re-read naturally (TBAA conservatism).
- **C-38 non-leaf chained-cast** (Investigation B) — RECIPE
  EXTENDS, NOT BYTE MATCH. The brief 225 chained-cast recipe
  (`(unsigned short)(unsigned char)*p`) preserves under
  mwcc 1.2/sp2p3 and 1.2/sp3 for non-leaf shapes too — the
  cast chain emits as expected. But reg-alloc differs from
  orig (the allocator's `end` pointer lands in r0 instead
  of r3 throughout). 0/2 picks ship byte-identical.

## Sub-shape C — bitfield packing

### The shape

Orig manually packs two bytes into a u16 helper argument:

```
and  r2, r0, #0xff           ; mask field a
and  r0, r1, #0xff           ; mask field b
orr  r0, r2, r0, lsl #8      ; pack: r0 = a | (b << 8)
lsl  r0, r0, #16
lsr  r0, r0, #16             ; (u16) cast
... bl helper(..., r0=packed, ...)
```

208 functions in ov002 contain this `orr Rd, Ra, Rb, lsl #imm`
shape. Most are large multi-wall picks (C-34 cross-overlay BLs +
bitfield packing). The clean small picks tested:

| Pick | Size | Outcome |
|---|---|---|
| `021d59cc` | 60 B | 2.0 tail-calls helper (no `push/bl/pop` — `bx ip` instead). 1.2 also TCO. No tier produces orig's prologue. |
| `021d5b28` | 88 B | Pack pattern matches under 1.2/sp3; reg-alloc shuffles loop variables. |
| `021d5c50` | 84 B | Pack pattern matches under 1.2/sp2p3 and 1.2/sp3 (explicit `and+and+orr`). 2.0 folds masks (`lsl/orr-with-lsr`). 1.2/sp3 has `sub sp, #4` prologue not in orig (`stmdb sp!, {r4, r5, lr}` direct push). |

### Variant matrix (021d59cc, 10 idioms)

| Variant | Source idiom | Outcome |
|---|---|---|
| v1 | `int outer(int a, ...) { return helper(tag, packed, ...); }` | TCO (`bx ip`) |
| v2 | `void outer(...) { helper(...); }` | TCO still |
| v3 | inline-pack in helper-arg position | TCO |
| v4 | union for pack via `.lo`/`.hi` bytes | non-TCO ✓ but memory-based pack (strb/ldrh) not register |
| v5 | struct {u8 lo, hi} as helper arg | non-TCO but emits memory-based pack |
| v6 | named locals + `if/else` for tag | TCO |
| v7 | `int result = helper(...); return result;` | TCO (intermediate DCE'd) |
| v8 | `volatile unsigned short tag/packed` | non-TCO ✓ but memory-based pack via `strh/ldrh` |
| v9 | dummy address-take to force frame | TCO |
| v10 | extra call to void helper | non-TCO but adds extra `bl`, doesn't match |

**Insight:** every TCO-defeat idiom that worked (v4, v5, v8) used
address-taken locals, which force the pack through stack memory
instead of registers. No combination delivers both the register-
based pack AND the non-TCO shape.

### Tier-feature matrix

| Feature | 2.0/sp1p5 | 1.2/sp2p3 | 1.2/sp3 |
|---|:---:|:---:|:---:|
| Explicit `and+and+orr` register pack | ✗ folds | ✓ | ✓ |
| Style B single-instr return (`pop {... pc}`) | ✓ | ✗ Style A | ✓ |
| Direct `push {regs, lr}` (no `sub sp, #4` pad) | ✓ | ✗ adds pad | ✗ adds pad |

No single tier gives all three. **C-39c is a tier-mismatch wall**:
the natural recipe is correct but mwcc's tier-specific codegen
choices don't align.

### Verdict

C-39c is NOT recipe-shippable under current tooling. Skip-and-
document: 4 known C-39c candidates in ov002 (`021aba60`,
`021d9828`, `021f6304`, `021ff6d0`) are already shipped as `.s`
under brief 207's C-34 recipe; no other walls block them at the
`.s` tier.

## Sub-shape D — multi-call re-read

### The shape

Orig emits the same `ldrh rX, [rY, #N]` halfword load TWICE —
once before a helper `bl` and once after — when the field is
referenced on both sides of the call.

### Recipe

Natural source code. No volatile, no asm clobber:

```c
int a = helper(self->f2.bit0);
int b = helper(1 - self->f2.bit0);
return (a + b) >= 4;
```

mwcc 2.0/sp1p5 emits `ldrh r0, [r4, #2]; ...; bl helper;
ldrh r1, [r4, #2]; ...; bl helper` — exactly the orig pattern.

### Why the natural recipe works

Brief 224's hypothesis: "mwcc CSEs the bitfield read across
the call, needs special idiom to defeat."

Brief 229's finding: mwcc 2.0/sp1p5 **doesn't CSE narrow loads
through pointer parameters across function calls**. The compiler
can't prove `helper` doesn't see `self` (TBAA conservatism for
narrow integral loads), so the re-read is emitted by default.

This makes C-39d the EASIEST sub-shape to lock — no idiom needed,
just write code that naturally reads the field twice.

### Three shipped worked examples (3/3 ship)

| Pick | Size | Notable | Outcome |
|---|---|---|---|
| `02204f28` | 68 B | Same helper twice with `!bit0` and `bit0` | ✓ byte-identical |
| `02200378` | 76 B | Two different helpers + literal pool arg `0x14f8` | ✓ byte-identical |
| `02200650` | 76 B | Same helper twice + ternary `m >= 1 ? 2 : 0` tail | ✓ byte-identical |

## Investigation B — C-38 non-leaf chained-cast

### The shape

Brief 225 locked the leaf chained-cast recipe (`func_0207d304.legacy.c`)
using `(unsigned short)(unsigned char)*ptr`. Brief 229 tested whether
the same recipe extends to NON-LEAF allocator functions
(`func_0207db8c`, `func_0207dbf8` — flagged in brief 227 deferrals).

### Variant matrix

| Variant | Source idiom | 2.0/sp1p5 | 1.2/sp2p3 | 1.2/sp3 |
|---|---|---|---|---|
| v1 | `((u16)(u8)*(u8*)p) & 1` (u8 ptr) | ldrb + tst | ldrb + ands | ldrb + ands |
| v2 | inline `((u16)(u8)*(u32*)p) & 1` | ldr + and + tst (folded `lsl/lsr`) | ldr + and + ands (folded) | ldr + and + ands (folded) |
| v3 | named-local chain (`v = (u8)*p; t = (u16)v;`) | ldr + and + tst (folded) | **ldr + and + lsl + lsr + ands** ✓ | **ldr + and + lsl + lsr + ands** ✓ |
| v4 | v3 + keep `end` alive across cast | same as v3 | same as v3 | same as v3 |

### Verdict

The chained-cast recipe **EXTENDS** to non-leaf shapes — under
1.2/sp2p3 and 1.2/sp3, the named-local chain forces mwcc to
preserve both casts (`and #0xff` + `lsl/lsr #16`). 2.0/sp1p5 still
collapses (the cast-coalescing peephole is too aggressive).

But reg-alloc differs from orig: orig's allocator keeps `end` in
r3 throughout the function; my v3/v4 keeps `end` in r0 and shuffles
through r1/r3. The chained-cast instructions are present but use
different registers (e.g., orig
`ldr r0, [r5, #-4]; and r0, r0, #0xff; mov r0, r0, lsl #16; mov r0, r0, lsr #16; ands r0, r0, #1`
vs mine
`ldr r1, [r5, #-4]; and r1, r1, #0xff; lsl r1, r1, #16; lsr r1, r1, #16; ands r1, r1, #1`
— same instructions, different Rd).

Additional structural mismatch: 1.2/sp3 emits `push {r4, r5, lr};
sub sp, sp, #4` (4-byte stack pad). Orig has `stmdb sp!, {r4, r5,
lr}; sub sp, sp, #4` — same bytes for the push but different
encoding for the immediate sub. (Actually `push {r4, r5, lr}` and
`stmdb sp!, {r4, r5, lr}` are aliases — same encoding `e92d4030`.
So that part matches.) The body reg-alloc is the actual divergence.

**Filed as P-12 candidate** — non-leaf chained-cast reg-alloc
divergence. Could be a permanent wall (mwcc 1.2 specifically
allocates differently than orig). Decomper drain not recommended
without recipe upgrade.

## Detector + test additions

`tools/predict_walls.py` extended:

- **C-39d**: fires when 2+ `ldrh rX, [rY, #N]` reference the same
  `(rY, N)` with at least one `bl` between them.

3 new unit tests in `TestC39SubShapeDetection`:

1. `test_d1_multi_call_reread_fires_c39d` — D1 disasm fires
   C-39 + C-39d.
2. `test_single_ldrh_does_not_fire_c39d` — baseline C-39 with
   only one ldrh: no C-39d.
3. `test_ldrh_different_offsets_does_not_fire_c39d` — ldrh
   at different offsets after bl: not a re-read; no C-39d.

## Drain estimate

Brief 226 unlocked C-39a (~180 picks) + C-39b (~135 picks). Brief
229 adds C-39d (~100-150 picks estimated, based on the 200+ small
re-read candidates I scanned). C-39c remains blocked (4 known
ov002 picks already shipped as `.s`).

Combined C-39 sub-shape drain unlock for brief 230+:

- C-39a: ~180 picks
- C-39b: ~135 picks
- C-39d: ~100-150 picks
- C-39c: tier-mismatch wall, ~10-30 picks remain `.s`-only

**Total mechanical drain target: ~400-500 C-39 picks** under
the locked sub-shape recipes. Decomper drain throughput from
brief 227 (~10 min/pick) suggests ~65-85 hours of work to
exhaust the sub-shape drain.

## Cross-references

- `docs/research/brief-222-c39-non-leaf-bitfield.md` — base C-39
- `docs/research/brief-224-c39-wave1.md` — wave 1, sub-shape catalog
- `docs/research/brief-225-c39-subpatterns-and-c38-deferred.md` —
  C-38 chained-cast (leaf) + Wall 2 sub-shape
- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`
  — C-39a (sign-check) + C-39b (helper-reuse)
- `docs/research/brief-227-c38-chained-cast-c39-wave2.md` — C-38
  drain (0 ships) + C-39 wave 2 (19 ships)
- `src/overlay002/func_ov002_02204f28.c` — C-39d canonical
- `src/overlay002/func_ov002_02200378.c` — C-39d with literal pool
- `src/overlay002/func_ov002_02200650.c` — C-39d with ternary tail
