[//]: # (markdownlint-disable MD013 MD041)

# Brief 265 — Over-fire drain wave 2 + C-39 hard-tail sweep

**Brief:** 265 (decomper). (A) Continue the over-fire drain
(StyleA-real → frameless-leaf → C23-noMMIO), StyleA helper-families
first. (B) Opportunistically sweep the C-39 hard-tail shapes brief 262
made coercible.

## Headline

**27 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** — 7 C-39
hard-tail (**closes the hard tail**) + 20 over-fire (14 StyleA-real
`.legacy.c` + 6 frameless-leaf). **27/33 attempted = 82 % yield.** The
StyleA helper-families template at 100 %; the frameless-leaf *tail* is
shape-diverse (~50 %), confirming the cheap front is the homogeneous
helper-families, not the leaf grab-bag.

## (B) C-39 hard tail — 7/7, CLOSED

All six brief-262 coercible shapes ship byte-identical:

| Pick | Shape | Lever |
|---|---|---|
| `0220b420`, `0228abd8` | stride-reuse | plain C-39f; mwcc derives the `add rN,stride,#K` bound from the live stride (bounds 0xbb8 / 0x9c4) |
| `02231f4c`, `021f4d3c` | arg-bit-packing | **gotcha 16** `unsigned char` cast forces `and #0xff` (also cracks the brief-257 byte-pack carry-over `021f4d3c`) |
| `0222b2e0`, `0223483c` | global 3-way switch | `switch`+`break` to a shared `return 0` |
| `02294b64` | multi-helper-`pre()` | invert-polarity + **inline** `(x<<19)>>19` mask |

Two needed a fix past the first compile (still shipped 100 %):

- `02294b64` (81 %→100 %): a **named** `unsigned int v = *pre()` made
  mwcc re-fold `(v<<19)>>19` into a pool-loaded `and #0x1fff`. Inlining
  the unsigned deref — `h2((*pre() << 19) >> 19)` — kept the `lsl;lsr`
  shift-form. (Refines brief-262's note: the shift-form needs to be
  *inline*, not via a temp.)
- `021f4d3c` (93 %→100 %): the bitfield struct needed a leading
  `u16 f0;` so `self->bit0` reads offset 2 (orig `ldrh [r0,#2]`).

**§ C-39 hard tail is closed** — the only residue is the known P-11 CSE
field-temp (`02205c4c` / `0220000c`), permuter fodder.

## (A) Over-fire — 20 shipped

**StyleA-real (14, `.legacy.c` sp2p3), 14/14:**

- **`func_02094c94` 5-arg family (6)** — `helper(code, a0,a1,a2[,a3/0])`,
  more arg-passthrough than wave 1: `02094d4c` `02094dd8` `020950a0`
  `02095270` (4-passthrough), `02094f14` `020950d4` (3+0). (18 c94 ships
  total across waves 1-2.)
- **`func_0209b4a4` dispatch family (6)** — `r = helperA(.., cb,&out);
  if (r) return r; func_0209b4a4(); return out;` with the same callback
  `func_0209b49c`; 3 arg-layouts: `0209a92c` `0209a9b8` `0209b014`
  (a0), `0209ae5c` (void), `0209af48` `0209b0b8` (a0,a1).
- **+2** — `02094fa0` (`r=h2(a0,a3,a4); c94(18,a0,a1,a2,r)`), `0209bd64`
  (`return func_02096358(5,(a0<<8)&0x7f00,0) >= 0`).

**frameless-leaf (6, default `.c`), 6/12 attempted:**

- ships: `022087d4` `0228ac2c` `0220bcb8` (ov002 bit-compare / `&&`),
  `021cd024` (ov011 two field updates), `02096794` (field shuffle),
  `022b3760` (ov002 `q=p+a1; q[17]=a2-q[9]` + consts).

## Non-shippers (6 reverted) — P-candidates with byte-diff evidence

| Pick | % | Divergence |
|---|---:|---|
| `0202f3e8` | 50 | const-compare `a0==K\|\|a0==K+9`: K+9-reuse matched, but mwcc **predicates** (`moveq#1/movne#0`) where orig **branches** (`bne` to shared `return 0`). Predication-form (gotcha-5 adjacent). |
| `021ab32c` | 33 | `q[a1]\|=a2; f24=(x&~1)\|1`: the `bic;orr` / `strh` mask sequence diverges. |
| `021abf50` | 30 | 16-bit insert `(x&0xffff0000)\|(u16)a1`: mask-build (`mov #0x10000; rsb`) + shift form diverges. |
| `021ac508` | 30 | byte-insert `(x&~0xff0000)\|((a&0xff)<<16)`: `lsl#24;lsr#8` vs my form. |
| `020a6d94` | 77 | field-copy with a **double-write** `p[10]=x; p[10]=y` — mwcc elides the dead first store. |
| `02092614` | 42 | struct-init with **re-reads** `p[1]=0; p[0]=p[1]` — mwcc reorders/CSEs vs orig's literal re-read. |

These are **per-pick mwcc codegen quirks** (mask-fold, predication,
dead-store elision), not one new wall. Likely coercible with more
per-pick grind (shift-forms, invert-polarity, `volatile`) but each
exceeds the 10-min cap. Filed as leads, not P-N permanents.

## Yield by tier (for sizing the rest)

```text
C-39 hard-tail   : 7/7   (100%)  — closed
StyleA-real      : 14/14 (100%)  — helper-families template cleanly
frameless-leaf   : 6/12  (50%)   — clean front 100%, diverse tail diverges
C23-noMMIO       : 0     (not attempted this wave)
overall          : 27/33 (82%)
```

**Finding:** the over-fire cohort's *reliable* vein is the **StyleA
helper-families** (c94, b4a4, and similar `helper(code, …)` shapes) —
they batch-drain at 100 % from one source template. The frameless-leaf
tier splits: struct-copy / field-arith / bit-compare ship 100 %, but
bit-insert-mask / struct-init-with-rereads / predication-form shapes are
per-pick and ~50 %. **Brief 264's StyleA family templates would make the
reliable vein batch-drainable** — strongly recommend landing them before
wave 3.

## Recommendation

Wave 3: (1) drain the remaining StyleA helper-families first (apply
brief-264 templates if landed); (2) for frameless-leaf, prefer
struct-copy / field-arith / bit-compare shapes (skip bit-insert-mask and
predication-form unless a recipe lands); (3) the **C23-noMMIO tier is
untouched** (29 ≤0x40 + a medium tail) — a fresh vein.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 27/27 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4543 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2267 passed |

## Cross-references

- `docs/research/brief-262-c39-hard-tail-classify-and-close.md` — the
  hard-tail recipes this wave ships.
- `docs/research/brief-263-overfire-drain-wave1.md` — wave 1; the
  cohort tiering + the c94 family this wave extends.
- `docs/research/recipe-gotchas.md` — gotcha 16 (u8-cast mask), gotcha
  10 (`.legacy.c`), gotcha 15 (C-39g), gotcha 5 (predication).
