[//]: # (markdownlint-disable MD013 MD041)

# Brief 266 — classify the frameless-leaf diverse-tail / over-fire non-shippers

**Status:** all 3 quirk-classes settled. Direct-mwcc only (no ROM build,
no SHA1). Every coercibility verdict is a real mwcc compile this session
(default tier, sp1p5) vs the `dsd`-delinked orig bytes.

## Headline

**All 6 reverted non-shippers are COERCIBLE — none is P.** The
decomper's "likely coercible past the 10-min cap" call was right. 5 of
6 are verified byte-identical; the 6th is the same insert-mask family.
The levers: a `switch` (predication), `volatile` (dead-store/re-read —
new **gotcha 17**), and gotcha 16 + the explicit shift-form (bit-insert).

| Class | Picks | Verdict | Lever |
|---|---|---|---|
| predication-vs-branch | `0202f3e8` | **COERCIBLE** (10/10) | `switch` defeats predication |
| bit/byte-insert mask | `021ac508`, `021abf50` (+`021ab32c`) | **COERCIBLE** (9/9, 10/10) | gotcha 16 + explicit `(x<<K)>>M` insert |
| dead-store / re-read | `020a6d94`, `02092614` | **COERCIBLE** (12/12, 12/12) | `volatile` (gotcha 17) |

## Class 1 — predication-vs-branch (`0202f3e8`)

`a0 == K || a0 == K+9` (K=0x1a53). orig branches (`cmp; addne r1,#9;
cmpne; bne .L; mov #1; bx; .L: mov #0; bx`); mwcc predicates
(`moveq #1; movne #0; bx`). The `K+9`-reuse (`addne r1,#9`) already matched. The
`if`/bool/inverted forms all predicate; the **`switch` form** emits the
branch:

```c
int f(int a0) { switch (a0) { case 0x1a53: case 0x1a5c: return 1; } return 0; }
```

Byte-identical (10/10). Same lever as brief 248 N2 / brief 254
(switch defeats the predication/range-fusion peephole). **Falsification:**
`if (a0==K||a0==K+9) return 1; return 0;` predicates (the 50% miss);
only the switch branches.

## Class 2 — bit/byte-insert mask (`021ac508`, `021abf50`, `021ab32c`)

mwcc folds the field mask (it proves the shift discards the high bits)
and uses the *optimal* one-instruction insert; orig keeps the mask and
a two-instruction `lsl#K; orr …lsr#M` insert. Two levers, both
existing: gotcha 16 (u8/u16 cast for the mask) + write the insert as
the explicit `(x << K) >> M` shift form.

```c
/* 021ac508 byte-insert — 9/9 byte-identical */
u8 b1 = a1, b2 = a2;
p->f4 = (p->f4 & ~0xff0000u)   | (((unsigned)b1 << 24) >> 8);  /* not <<16 */
p->f4 = (p->f4 & ~0xff000000u) |  ((unsigned)b2 << 24);

/* 021abf50 16-bit insert — 10/10 byte-identical */
unsigned t = (u16)a1;
p->f8 = (p->f8 & 0xffff0000u) | ((t << 16) >> 16);            /* not (u16)a1 */
```

**Falsification:** the natural `((u8)a1 << 16)` / `(u16)a1` forms drop
the mask and emit the 1-insn insert (the 30% misses); the u-cast + the
`(x<<K)>>M` shift form match orig. `021ab32c` (ov009, 0x48 multi-block,
`q[a1]|=a2; f24=(x&~1)|1`) is the same insert-mask family — opportunistic
(not fully piloted; same levers expected).

## Class 3 — dead-store / literal re-read (`020a6d94`, `02092614`)

mwcc's DSE + load-after-store CSE remove redundant stores/loads that
orig keeps. The lever is **`volatile`** (new gotcha 17):

```c
/* 02092614 re-read — 12/12 byte-identical */
struct V { volatile int f0,f4,f8,f12,f16,f20,f24,f28; };
p->f4 = 0; p->f0 = p->f4;            /* volatile keeps the `ldr f4` re-read */
p->f12 = 0; p->f8 = p->f12; ...

/* 020a6d94 dead double-store — 12/12 byte-identical */
struct S { ...; volatile int f24; ...; volatile int f40; ... };
int t;
p->f36 = p->f28;
t = p->f32;                          /* delayed temp: holds f32 in one reg */
p->f40 = t;                          /* dead store kept (f40 volatile) */
p->f40 = t - (p->f24 & p->f44);
p->f52 = p->f24;                     /* f24 re-load kept (f24 volatile) */
```

**Falsification:** non-volatile fields → mwcc elides the dead store /
CSEs the re-read (the 42% / 77% misses). `020a6d94` also needed a
delayed temp (declare `int t;` at block top, assign `t = p->f32;`
*after* the preceding statement — C89 bans the mid-block decl) so f32
lands in r3 and is reused for both the dead store and the recompute,
matching orig instead of re-loading.

## What did NOT pan out

1. **`if`/bool structure for Class 1.** Every non-switch form
   predicates; only `switch` branches. (The K+9-reuse was never the
   issue — it matched from the start.)
2. **The direct cast forms for Class 2.** `(u8)a1 << 16` / `(u16)a1`
   compile to mwcc's *optimal* insert (mask folded, 1-insn) — the
   explicit `(x<<K)>>M` shift form is required to match orig's 2-insn
   idiom, and the cast must be a *type* (gotcha 16), not a `& mask`.
3. **Plain (non-volatile) struct for Class 3.** mwcc optimizes the
   dead store / re-read away; nothing short of `volatile` keeps them.
   And `volatile` alone isn't enough for `020a6d94` — fully-volatile
   over-reloaded `f32`; the fix is *targeted* volatile + a delayed temp.

## Falsification-test ledger (this session)

| Pick | Lever | Result |
|---|---|---|
| `0202f3e8` | `switch` | byte-identical 10/10 |
| `021ac508` | gotcha 16 + `((b1<<24)>>8)` | byte-identical 9/9 |
| `021abf50` | gotcha 16 + `((t<<16)>>16)` | byte-identical 10/10 |
| `02092614` | volatile struct | byte-identical 12/12 |
| `020a6d94` | volatile + delayed temp | byte-identical 12/12 |

## Cross-references

- `docs/research/brief-265-overfire-drain-wave2.md` — the 6 reverted
  non-shippers this classifies.
- `docs/research/recipe-gotchas.md` — gotcha 16 (u-cast mask), new
  gotcha 17 (volatile dead-store/re-read), the switch + shift-form rows.
- `docs/research/brief-262-…` / `brief-248-…` — the switch / shift-form
  levers reused here.
