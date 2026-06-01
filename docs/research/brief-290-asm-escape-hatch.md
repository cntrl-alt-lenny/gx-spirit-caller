[//]: # (markdownlint-disable MD013 MD041)

# Brief 290 — `.s` escape-hatch generator + canonicalisation-residue class size

**Status:** built + verified. decomp.me / research / tools only — no SHA1,
no `.c`/`.s` shipped (the generator is committed; the `.s` it emits are the
decomper's to ship, kept in gitignored `build/`). Fetched content as data.
**Headline: `tools/asm_escape.py` turns the brief-288 wall into a one-command,
byte-verified, REFUSE-guarded `.s` generator — all 8 wave-7/8 residue picks
produce `.s` that assemble byte-identical to the delinked `.o` (1 fix each).
The class it unlocks: ~93 `<0x100` ov002 funcs carry the canonicalisation
signature (47 are accessor-helper members), drainable as ship-as-C /
ship-as-`.s` / refuse instead of blocked.**

## (A) The generator — `tools/asm_escape.py`

Brief 288 proved the residue is byte-identical-from-C except ONE commutative
`add` operand order (a CSE'd-temp wall mwcc canonicalises invariant to source;
unfixable by C or the permuter). This brief productionises the only fix — the
`.s` hatch (precedent `func_ov002_021ff3bc.s`, brief 207):

```text
byte-near C  --mwcc-->        my .o   --objdump-->  my instrs
delinked .o  --objdump-->                           orig instrs
   classify every divergence:
     * commutative-operand swap (same op+dest, sources a permutation) -> a FIX
     * anything else (count, real bytes, reloc target)               -> REFUSE
   emit mwasmarm .s from the ORIGINAL stream (byte-exact; the swap is
     "corrected" by emitting orig's operand order), in the project's syntax
   assemble with mwasmarm + byte-verify the .o vs the delinked orig
```

Key properties:

- **Safe by construction.** The classifier only emits a `.s` when *every*
  divergence is a commutative-operand swap. Anything else (a real codegen
  difference, a wrong guard, a count mismatch) → **REFUSE** with the offending
  instruction, so the hatch can never paper over a function that should be
  matched in C. Live: feeding wrong-logic C (`cmp r2,#6` vs `#5`) →
  `REFUSE … [1] non-canonicalisation diff: 'cmp r2, #6' vs 'cmp r2, #5'`.
- **Self-verifying.** It assembles the emitted `.s` with `mwasmarm` (the build's
  own assembler) and byte-compares against the delinked `.o`; it reports ✅ only
  on a true byte match (bl/pool relocs modulo).
- **Project-syntax output.** objdump→mwasmarm conversion: `push`/`pop`→
  `stmdb`/`ldmia` (+ condition: `popeq`→`ldmeqia sp!`), shift-ops→`mov rD,rM,lsl #n`,
  hex immediates, pc-relative pool loads→explicit `_LITn: .word` slots,
  `bl`/`.word` use the reloc symbol. Pool words are detected by pc-relative-ldr
  target (robust across objdump's raw-vs-`.word` renderings).
- **Pure core is CI-tested.** `parse_objdump` / `pool_addrs` / `to_mwasm` /
  `is_commutative_swap` / `classify_fixes` / `emit_asm` have 16 unit tests on
  fixtures (no build); the compile/assemble pipeline is build-gated.

### Verification — 8/8 residue picks byte-identical

Each: byte-near C → generator → `.s` assembled by mwasmarm → byte-compared to
the delinked `.o`. All eight differ from orig by exactly one `add` and the
generator's `.s` is byte-identical:

| pick | wave | C emits → orig (the one fix) | `.s` verify |
|---|---|---|---|
| `021ec094` | 7 | `add r3,r4,r3` → `add r3,r3,r4` | ✅ byte-identical |
| `021f15a8` | 7 | `add lr,ip,lr` → `add lr,lr,ip` | ✅ |
| `021eec48` | 7 | `add lr,ip,lr` → `add lr,lr,ip` | ✅ |
| `021efc64` | 7 | `add r3,lr,r3` → `add r3,r3,lr` | ✅ |
| `021f0174` | 7 | `add lr,ip,lr` → `add lr,lr,ip` | ✅ |
| `021e8b34` | 8 | `add lr,ip,lr` → `add lr,lr,ip` | ✅ |
| `021eb128` | 8 | `add r3,lr,r3` → `add r3,r3,lr` | ✅ |
| `021ebf40` | 8 | `add r3,lr,r3` → `add r3,r3,lr` | ✅ |

(The wave-8 picks were tagged "reg-numbering" but compile-diff shows they are
the same commutative-`add` swap — one uniform fix class.) The emitted `.s`
documents the fix in its header; e.g. `func_ov002_021ec094.s` opens:

```text
; func_ov002_021ec094 — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [11]: C emits `add r3, r4, r3`; original is `add r3, r3, r4`.
        .text
        .extern data_ov002_022cf16c
        ...
        add r3, r3, r4        ; <- orig operand order (the fix)
        ...
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
```

The decomper ships the emitted `.s` (this brief commits the tool, not the `.s`).

## (B) Class size — what the hatch unlocks

Structural scan of ov002's `<0x100` unmatched cohort for the canonicalisation
signature — reads the 0x868 row's `+0x30` f30 AND a parallel `cf1a4`/`cf1a2`
table (the shared `idx*20` CSE that triggers the swap):

| cohort | count |
|---|---:|
| ov002 `<0x100` unmatched scanned | 2041 |
| **carry the canonicalisation signature** (f30 + cf16c + cf1a4/cf1a2) | **93** |
| …also call an accessor helper (`021c1ef0`/`021c1e44`) | 47 |
| …read both `cf1a4` and `cf1a2` | 14 |
| compile-confirmed residue so far (waves 7-8) | 8 |

The 93 is the **structural** upper bound — the shape that *can* produce the
swap. It is not a blind ship count: per function the generator decides
deterministically — **ship-as-C** if mwcc is already byte-identical,
**ship-as-`.s`** if the only divergence is the swap, **REFUSE** otherwise. So
the tool converts the whole class from "deferred, root cause unknown" into a
mechanical drain step. The 47 accessor-helper members are the highest-confidence
subset (same shape as the 8 confirmed); waves 7-8 already shipped the members
that compiled byte-identical from C, leaving the swap-residue for the hatch.

## Falsification

- "8/8 byte-identical": `tools/asm_escape.py func_ov002_<x> --c <byte-near.c>`
  emits + assembles + byte-verifies each; all report ✅ (1 fix).
- "safe": feeding non-swap C → REFUSE with the offending instruction (live
  demo above; unit tests `test_real_byte_diff_is_refused`,
  `test_count_mismatch_is_refused`).
- "class = 93": the scan (`f30 [.,#0x30]` read + `cf16c` + `cf1a4`/`cf1a2`
  relocs over `<0x100` unmatched) is re-runnable; all 8 confirmed picks ∈ class.
- The unlock count shrinks iff some of the 93 turn out to diverge by more than
  the swap — in which case the generator REFUSES them (no false ships).

## Scope

Tool + research: `tools/asm_escape.py` + `tests/test_asm_escape.py` are
committed; no `.c`/`.s` is shipped (the 8 `.s` live in gitignored
`build/_asm_escape/`, regenerated on demand by the decomper from byte-near C).
No SHA1 run. The generator emits to `--out` (default under `build/`); the
decomper points `--out src/overlay002/func_<x>.s` when shipping.

## Cross-references

- `docs/research/brief-288-wave7-addorder-residue.md` — the wall this hatch
  resolves (no source lever, permuter plateau).
- `docs/research/recipe-gotchas.md` — gotcha 19 (commutative order; the
  CSE'd-temp hard variant the hatch targets).
- `docs/research/brief-286-ov002-core-header.md` — the accessor family the
  byte-near C comes from (`ov002_core.h`).
- `src/overlay002/func_ov002_021ff3bc.s` — the hand-written `.s` precedent
  (brief 207) this tool generalises + automates.
- `tools/asm_escape.py` / `tests/test_asm_escape.py` — the deliverable.
