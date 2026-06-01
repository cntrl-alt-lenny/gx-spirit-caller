[//]: # (markdownlint-disable MD013 MD041)

# Brief 291 — cold-RE wave 9: open the shared-sink families + ship the residue via .s

**Brief:** 291 (decomper). (A) Open the remaining proven-signature
shared-sink families (`0229ade0`, `021ff3bc`, `021ca2b8`) via `.c` +
`ov002_core.h`. (B) Ship the wave-7/8 add-order / reg-numbering residue
through the **.s escape hatch** (brief 290 generator + recipe, precedent
`021ff3bc.s`). Keep shape-triaging; loop/liveness bodies stay deferred.

## Headline

**16 shipped, all 3-region SHA1 PASS.** The .s hatch is now
*productionized*: `tools/gen_asm_tu.py` converts a `m2c_feed` GAS dump into
a mwasm-assemblable `.s` TU, so the 8 residue picks shipped mechanically.
All 3 families are open with two new reusable `.c` templates.

## (B) The .s hatch — `tools/gen_asm_tu.py` (8 residue shipped)

The feeder (`m2c_feed`) emits the orig disassembly in **UAL/GNU-as**
syntax; mwasmarm wants **old-ARM**. The converter bridges the gap:

| UAL (feeder) | mwasm (shipped) |
|---|---|
| `.globl` / `.type` / `.size` / `.align` | `.global`; the rest dropped |
| (external symbol) | `.extern <sym>` (one per data/func load + `bl` target) |
| `push {regs}` / `pop {regs}` | `stmdb sp!, {regs}` / `ldmia sp!, {regs}` |
| `popeq {…}` / `popge {…}` | `ldmeqia sp!, {…}` / `ldmgeia sp!, {…}` (cond between `ldm` and `ia`) |
| `lsl/lsr/asr rD, rS, #n` (+ `s`) | `mov/movs rD, rS, lsl/lsr/asr #n` |
| `ldr rX, =sym` | `ldr rX, .L<fn>_pN` + trailing `.L<fn>_pN: .word sym` |

**Recipe (per pick):** `m2c_feed --version eur <fn> > f.s` →
`gen_asm_tu.py f.s > src/overlay002/<fn>.s` → add a `complete` `.s` block
to ov002 `delinks.txt` (declared identically to a `.c`) → reconfigure →
3-region `ninja sha1`. Covered by `tests/test_gen_asm_tu.py` (12 cases).

Shipped (8): wave-7 add-order — `021ec094` `021f15a8` `021eec48`
`021efc64` `021f0174`; wave-8 key-decode — `0224ea54` `0224bdd4`
`0224c620`. Each is byte-identical to orig except the one mwcc-invariant
instruction brief 288 identified (no C lever); the `.s` ships the orig
verbatim.

## (A) Families opened (8)

### `0229ade0` "post packed event" (command sink)

`func_ov002_0229ade0(0x31, 0xA, self, payload)` where `payload` packs a
u16 in the high half and a seq in the low half.

- **`021ae6d0` (.c)** — template member. The cast rules that make it match:
  - `(u8)x` *cast* on an `int` → a standalone `and rN, rN, #255` (the bare
    `u8` *param* type instead lets mwcc trust the reg and skip the mask;
    `(x & 0xFF)` *fuses* into a shift pair — only the explicit cast keeps
    the `and`).
  - `(u16)arg` *cast* on an `int` → the `lsl #16; lsr #16` truncation (a
    bare `u16` param is used raw, no truncation).
- **`021ae70c` (.s)** — the 5-arg variant. Identical to orig but for the
  high-nibble `(arg4 & 0xF) << 4`: mwcc canonicalises to `lsl #28; lsr #24`
  and will **not** emit orig's `and #15; … lsl #4`. Pure instruction
  selection, no source lever → routed to the .s hatch.

### `021ff3bc` self-query predicate / forwarder

Header sink `func_ov002_021ff3bc(struct Ov002Self *self)` (the `.s` from
wave 8). Members `mov r4,r0` to keep `self` live across the query, then
read `self->b0` (1-bit field at byte 2) or forward saved args (G26).

- **`02206340` (.c)** — `if (!query(self)) return 0; return helper(self->b0, K) != 0;`
- **`0220a0bc` (.c)** — pure forwarder: `query(self)` then two
  `helper(self, arg1)` guards, all args passed through.
- **`021f634c` (.c)** — forwarder returning `-1` (`mvneq`) on query fail,
  else tail-calls `021f4a84(self, arg1)`.

### `021ca2b8` predicate (C-39d local-struct convention, brief 229)

Already partially shipped; each member declares the sink **locally as
1-arg** (`extern int func_ov002_021ca2b8(unsigned int)`) and a per-file
`struct …Self { u16 pad0; struct { u16 bit0:1; u16 rest:15; } f2; }`.
`self->f2.bit0` → `ldrh [r4,#2]; lsl #31; lsr #31`; re-read across each
call (no CSE-defeat idiom needed).

- **`02206b88` (.c)** — three guards: `021ca2b8(bit0)`,
  `021ca3f0(bit0, 0x1670)`, `021ff2b8(self, 1 - bit0) >= 3`.
- **`02205278` (.c)** — `021ca2b8(bit0)`, `021bc618(bit0) >= 2`,
  `022536e8(bit0, self->f0, 0) >= 2`.
- **`022082c4` (.c)** — 0x868-indexed: `cf17c[(bit0 & 1) * 0x868] +
  021ff2c8(self, bit0)` nonzero. **Layout gotcha:** the shared `return 0`
  must be a fall-through *tail*, so write `if (sink != 0) { return …; }
  return 0;` (the inverted guard) — the natural `if (sink == 0) return 0;`
  emits an inline `moveq; popeq` instead of orig's `beq <tail>`.

## Header (`ov002_core.h`)

Added `typedef unsigned char u8;` (used by the `(u8)` cast in the
`0229ade0` packed-event template). Additive; the 15 wave-7 `.c` and the
wave-8 batch are untouched.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| objdiff per-pick | 16/16 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4737 warns, pre-existing) |
| `ruff check tools/` | clean |
| `tests/` (full suite) | 2333 passed (+12 `test_gen_asm_tu.py`) |

(`src/overlay002/` gains 7 `.c` + 9 `.s`; EUR ov002 `delinks.txt` gains 16
`complete` blocks. No USA/JPN config change — they rebuild from orig gap
bytes. `find_callsites.py` gave the family worklists; the local m2c clone
+ `m2c_feed` gave the drafts.)

## Recommendation for the brain

1. **The `021ca2b8` / `021ff3bc` predicate families have a long clean
   tail** (~100 callers each). The two `.c` templates above (header-based
   021ff3bc; local-struct C-39d 021ca2b8) clear any member whose guards are
   bit0 + a helper. Medium-effort members remain: 6-bit-field guards
   (`(word2 << 20) >> 26`), 2-global 0x868 indexing (`0220052c`), range
   checks (`02205c4c`), and the `data_022d016c` central-state reads
   (`02201614`).
2. **The .s hatch is now general.** Any family member that matches
   byte-for-byte except one mwcc-invariant instruction (add-order,
   reg-numbering, nibble-shift selection) ships via `gen_asm_tu.py` — no
   permuter, no source lever. `021ae70c` is the worked precedent.
3. **Loop/liveness bodies stay deferred** (`022020e0`, `021ae514`, …) —
   not the .s-hatch class; these need real reverse-engineering.

## Cross-references

- `docs/research/brief-288-wave7-addorder-residue.md` — why the residue
  has no C lever (the .s hatch is the route).
- `docs/research/brief-289-coldre-wave8-families.md` — header adoption +
  the `02253458` batch this continues.
- `src/overlay002/func_ov002_02200378.c` — the C-39d local-struct
  predicate convention (brief 229) reused for the `021ca2b8` family.
- `tools/gen_asm_tu.py` + `tests/test_gen_asm_tu.py` — the converter.
