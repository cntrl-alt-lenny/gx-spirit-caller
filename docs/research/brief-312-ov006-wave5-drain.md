[//]: # (markdownlint-disable MD013 MD041)

# Brief 312 — co-drain wave 5: ov006 second stream

**Brief:** 312 (scaffolder, co-drain). Continue the ov006 second stream
(waves 1–4 = 85 matched `.c`). Collision-free footing: own
`src/overlay006/`, own EUR `delinks.txt`, own `ov006_core.h`. Per-pick gate =
**EUR objdiff 100%** (direct-mwcc); the brain reproduces the 3-region SHA1 on
merge.

## Headline

**15 shipped (all `.c`), all EUR objdiff 100%** — byte-identical vs the
delinked gap `.o`, wired into `delinks.txt`, and all 15 confirmed dropped out
of a clean ov006 re-delink. ov006 matched `.c`: 119 → **134**. The wave is
**command-record-family-dominated** — the `0201e5b8` "build an OAM/sprite
record on the stack and submit it" shape is the richest remaining vein, and
this wave cracked its config-prefixed and conditional variants (5 picks incl.
a clone-3). The simple-clone cohort is otherwise mined out (only 2 funcs
≤0x40 remain), so the rest is individual RE; ~10 reg-alloc/scheduling walls
were hit and deferred (ship-as-`.s`).

## The 15 picks

| family / shape | funcs |
|---|---|
| **command-record (`0201e5b8`)** | `021c16d8` `021c5d00` (config-prefixed pair) · `021c12fc` `021c13c4` `021c148c` (conditional, clone-3) |
| **callback-dispatch** | `021b2280` (state `021cf140`) · `021b3fd8` (state `0224f290`, `state[4]=1` + rich no-cb tail) |
| **guarded-call / lazy-init** | `021b8cb8` (2× release+clear) · `021b8c50` (2× lazy-init) |
| **guard + switch** | `021b6be0` (ptr select) · `021b6ca0` (-1 default) · `021b6c30` (0 default) |
| **misc** | `021cb0d8` (13-word struct copy) · `021bd864` (range-clamp) · `021be878` (7-scan → flag) |

## Banked recipes & gotchas (new this wave)

### Command-record family — the wave's spine

`h = func_02006c0c(table,4,0); func_0201d47c(cmd); <set cmd fields>;
func_0201e5b8(cmd); func_02006e1c(h);` on a `char cmd[40]` stack record.
Three sub-shapes matched:

- **config-prefixed** (`021c16d8`/`021c5d00`): a leading display-register
  config `*(volatile u16*)0x0400000a = (*reg & ~3)|3; … |0xd00` (the same
  MMIO-config shape wave 1 matched in `021c8278`), then the record. Clone-by-
  one-global (`021c5d00` = `021c16d8` with `data_021ce16c`).
- **conditional, clone-3** (`021c12fc`/`13c4`/`148c`): `if (entry) { 02091554
  → 02006c0c → record with slot-scaled fields } else { 02094504 clear }`.
  Members differ in **two globals + two scaled-field constants** (the field
  base `+829`/`+845` and the slot offset `+5`/`+9`).

Three command-record **gotchas** (carry forward):

1. **The `+20` field re-read must be `unsigned short`** (`ldrh`); a signed
   `short` emits `ldrsh` (wave-4 finding, reconfirmed).
2. **Two-buffer stack frame ordering**: mwcc gives the **last-declared** local
   the **lowest** stack address. `021c12fc` has `buf[32]`@sp+0 and `cmd[40]`@
   sp+32 in the orig — so declare `cmd` *first*, `buf` *second*. (Cost one
   iteration; the diff was pure `add rX, sp, #off`.)
3. Store-scheduling can still wall: `021ca678` (wave 4) and `021c11c8` (3
   records with inconsistent per-record store order) don't reproduce from C.

### switch → jump table needs the full dense range (new)

A `switch (sel)` with only `case 0/1` compiles to an **if-chain** (`cmp #0;
beq …`); the orig uses a **jump table** (`cmp #3; addls pc, pc, sel<<2`).
Add the explicit upper cases — `case 2: case 3: default:` — so mwcc sees the
dense `0..3` range and emits the table. Fixed `021b6ca0`/`021b6c30`.

### register-numbering via declaration order (new lever)

`021bd864` (range-clamp) diverged only in register numbers; declaring the
`changed` accumulator **first** (so it lands in the low reg the orig uses)
made it byte-identical. A cheap first thing to try on a reg-numbering near-miss
before giving up to `.s`.

### Other

- **Leaf struct copy** = explicit per-field `dst[i] = src[i]` (`021cb0d8`),
  *not* a `*(S*)a = *(S*)b` struct-assign (which spills to r4/r5 + a prologue;
  the orig is a leaf using one scratch reg).
- **dispatch no-cb tail variant** (`021b3fd8`): the family's no-callback path
  can carry a `state[4]=1` prologue + a `*(g+60)=state[6]; 020071a4(4,1,data)`
  tail; `r1=1` from the prologue is reused as the `020071a4` arg.

## Deferred this wave (walls → ship-as-`.s`)

| funcs | wall |
|---|---|
| `021ca678` `021c11c8` | command-record store-scheduling (field-store order) |
| `021c4028` `021c63cc` | counter-normalise — orig's redundant double-`cmp` return-value lowering |
| `021bd6bc` | `ldmib` + 1-bit bitfield + `mla` reg-numbering |
| `021b8fa8` | bit-set — pool-load / `1<<v` reg-numbering |
| `021c1958` | search loop with pre-index `ldrsh [p, #24]!` writeback |
| `021ba090` `021cae24` | bitfield + predicated 3-way store / MMIO packed-offset |
| `021c8e98` `021c426c` `021c82ac` | large conditional / loop composites (0x108–0x8c8) |

Each is byte-identical-from-C except register numbering / instruction
scheduling — the brief-294 ship-as-`.s` cohort.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **15/15 byte-identical** |
| in-tree build + clean re-delink | 15 `.o` compiled; **15/15 dropped out** of the ov006 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical — stronger than per-pick) |
| ov006 `delinks.txt` | 15 `complete .text` blocks (matched-set subtracted first; overlap 0) |
| USA / JPN `ninja sha1` | deferred to the brain on merge (EUR-baseline `.c`, no region port) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay006/` gains 15 `.c`; EUR ov006 `delinks.txt` +15 `complete`;
`ov006_core.h` §VERIFIED extended. No tool change, no USA/JPN config change.
(Build note: a stale ov006 gap object can survive an incremental re-delink and
double-provide a now-`complete` func — `rm build/eur/delinks/_dsd_gap@ov006_*.o`
before the re-delink forces a clean drop-out. The pre-existing macOS
`m2ctx.py` `-fworking-directory` `.ctx.c` failure is unrelated; `ninja -k 0`
steps past it.)

## Notes for the brain

1. **The command-record family is the ov006 spine going forward.** 6 matched
   across waves 4–5 (`021c74e0` + this wave's 5); the remaining members
   (`021ca678`, `021c11c8`, `021c8e98`, …) wall on store-scheduling or size —
   good `--whole-function` `.s` candidates.
2. **Clean-C cohort is thin** (~187 unmatched ov006 funcs, dominated by
   >0x80 composites + the walls above). Wave-6 yield will lean on whatever new
   command-record / dispatch variants exist plus individual composites; expect
   tapering without a `.s` hatch for the reg-alloc tail.
3. **EUR sha1 passes with the wave applied** — a strong signal the 15 are
   byte-perfect in the linked ROM, not just per-function. Confirm USA/JPN
   reproduce on merge.

## Cross-references

- `docs/research/brief-310-ov006-wave4-drain.md` — wave 4 + the command-record
  template (`021c74e0`) this wave extends.
- `docs/research/brief-304-ov006-wave1-drain.md` — the callback-dispatch family
  (`021b2280`/`021b3fd8` are new members).
- `src/overlay006/ov006_core.h` — §VERIFIED extended with this wave's vocab.
