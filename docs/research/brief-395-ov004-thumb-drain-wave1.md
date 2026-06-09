[//]: # (markdownlint-disable MD013 MD041)

# Brief 395 — ov004 Thumb-cohort drain, wave 1

**Brief:** 395 (decomper). Wave 1 of the lane brief 393 (PR #918) opened: the
`*.thumb.c` harness proved the call-having Thumb interworking frame is a
compiler-version thing (mwcc 1.2/sp2p3, the same binary as `.legacy.c`), so **no
harness change is needed** — just write `.thumb.c` files with `#pragma thumb on`.
Sweep the ~37 remaining 4-aligned call-having Thumb funcs (`021dbxxx`–`021ddxxx`),
small-first. Gate = 3-region `ninja sha1`; carve-size audit. Branch
`decomper/ov004-thumb`.

## Headline — 14 byte-identical Thumb `.c`, 3-region sha1 OK

**14 matched, EUR/USA/JPN `ninja sha1` = OK, carve-size audit clean (14 sizes
exact, 0 overlaps).** No harness change — every func is a plain `.thumb.c` with
`#pragma thumb on`, built through the existing `mwcc_thumb` rule. The cohort is the
coherent crypto/network util library brief 393 predicted; this wave drained the
small/clean tier and banked the recipes that crack it.

## The 14 (sorted by size)

| addr | size | what |
|---|---|---|
| `021dbddc` | 0x18 | byte-write forwarder (`*e = f; sink(a,b,c,d,e)`) |
| `021dbe40` | 0x1a | byte-write forwarder, deref (`*e = *g; …`) |
| `021dbf48` | 0x24 | fn-ptr dispatch (`(*(fp*)g)(a1)` via `blx`) |
| `021dbe78` | 0x26 | `memcmp` (compare-in-loop-condition idiom) |
| `021dd20c` | 0x38 | set-if-changed `-1` guard |
| `021dd5f0` | 0x38 | free-pair (`if(g){sink(g);g=0;}` ×2) |
| `021dd244` | 0x38 | per-element transform loop |
| `021dbd34` | 0x38 | bswap32 |
| `021dbd84` | 0x38 | bswap32 (identical twin of `021dbd34`) |
| `021dc954` | 0x44 | validate-then-forward |
| `021dbfd4` | 0x4a | wrapping-key XOR (two divmod calls) |
| `021dd27c` | 0x4c | init builder |
| `021dccc8` | 0x54 | compare/validate, `~0`/`~1` error codes |
| `021dd59c` | 0x54 | network-config init (default IP `192.168.11.1`) |

## Recipes banked (the new ones this wave)

- **Stack-arg pass-through forwarders.** `021dbddc`/`021dbe40` take 6 params (p1–p4
  in r0–r3, p5/p6 on the caller stack at `sp[16]`/`sp[20]`), do a byte write, then
  forward p1–p4 *unchanged* to a 5-arg sink with p5 on the stack. Writing
  `void f(int a,int b,int c,int d,uchar*e,int g){ *e=g; sink(a,b,c,d,e); }` keeps
  a–d in r0–r3 (no moves) and spills `e` to `sp[0]` — byte-exact. Earlier these
  read as un-decodable "stack-arg" funcs; the trick is recognising the pass-through.
- **The combined `long long` divmod decl.** A TU that needs *both* the quotient and
  the remainder of the same helper can't declare it twice. Declare it once
  `extern long long func_020b3870(int,int);` and take `(int)x` for the quotient (r0)
  / `(int)(x>>32)` for the remainder (r1) — `021dbfd4`.
- **Dispatch-order inversion** (`021dd20c`, `021dbf48`): when the orig branches the
  *equal*/`<=0` case forward to a shared `return 0`, write `if (NOT-that-case)
  {body} return 0;` — not `if (that-case) return 0; body;` (which inlines the
  return). Same lever as the ARM tier.
- **Post-increment placement** (`021dbfd4`): `buf[i] ^= key[ki++]` emits the `ki++`
  right after the `key[ki]` load (orig order), vs a separate `ki++;` after the store.
- **`~0`/`~1` error codes** (`021dccc8`): writing `r = ~0` reuses the running result
  reg (which already holds 0) for the `mvns`; `r = ~1` materialises the `1`.
- **`memcmp` loop** (`021dbe78`): fold the byte compare into the loop condition —
  `while (count-- > 0 && (d = *p0 - *p1) == 0) { p0++; p1++; }` — to get the orig's
  rotated layout (jump-to-condition, increment-only body).
- **Bit-mask endianness** (`021dbd34`/`84`): objdump's halfword grouping is per-
  halfword LE — `0000 ff00` at a word boundary is the bytes `00 00 00 ff` = the u32
  `0xFF000000`, not `0x00FF0000`. Read the 4 raw bytes, not the halfword display.
  The bswap OR-tree matches when right-associated:
  `(<<24&m) | ((<<8&m) | ((>>24&m) | (>>8&m)))`.

## Deferred (3 → permuter/`.s` or a later wave)

- **`021dc1cc`** (RC4 KSA, 0x6c) — the sibling of the PRGA shipped in brief 393.
  Structurally exact (53 vs 50 ins) but a **spill-choice reg-alloc** divergence:
  the orig spills `N` to the stack and keeps `S[i]` in a callee-saved reg; mwcc does
  the reverse. Not steerable from C → the brief's "skip reg-alloc" rule. `.s`/permuter.
- **`021dbdf4`** (fixed-point 64-bit accumulate, 0x4c) — two embedded multiplier
  constants whose pool straddles the function boundary in the gap object; layout
  needs more care than the wave budget allowed. Tractable, deferred.
- **`021dcd1c`** (scan + dispatch, 0x48) — a branch that compares the entry `r0` to
  an embedded constant with no intervening call; the param semantics are ambiguous
  on a cold read. Re-attempt with the caller's prototype in hand.

## Vein status

The small/clean Thumb tier is now drained. **~21 call-having Thumb funcs remain**
(the ≥0x5c tier: multi-stack-arg builders `021dc350`/`021dc418`/`021dc500`, the
larger crypto `021dc020`/`021dc238`/`021dca68`/`021dd374`, the 0xaec giant
`021dd648`) plus the deferred 3 — a wave-2's worth, trending harder (embedded
constants, stack-arg builders, reg-alloc). Still a real vein, not a wall.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (14 `.c`, byte-identical) |
| Carve-size audit (14 sizes vs symbols.txt, overlaps) | **PASS** (exact, 0 overlaps) |
| No orphan `.thumb.c` (every file in delinks) | clean |

EUR-only carve (+14 `complete_units`); usa/jpn are the regression gate (the
`.thumb.c` files are EUR-baseline, excluded from usa/jpn builds).

## Cross-references

- `docs/research/brief-393-ov004-realc.md` — the `*.thumb.c` harness + the first 8
  Thumb funcs; established the divmod / keystream-temp / pool-`.word` recipes.
- `src/overlay004/ov004_core.h` §VERIFIED b395 — the per-func recipe index.
