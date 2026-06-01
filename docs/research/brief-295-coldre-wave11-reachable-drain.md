[//]: # (markdownlint-disable MD013 MD041)

# Brief 295 — cold-RE wave 11: keep draining the reachable cohort

**Brief:** 295 (decomper). (A) Continue the open families (`0229ade0` /
`021ff3bc` / `021ca2b8` / `02253458` tail). (B) Keep draining the `.s`-hatch
canonicalisation class with `tools/asm_escape.py` (trust the REFUSE).
Shape-triage; loop / liveness / register-numbering bodies stay deferred.

## Headline

**14 shipped, all 3-region SHA1 PASS** — 5 via the `.s` hatch, 9 `.c` family
members. The easy small-caller veins are now thin (waves 8-10 creamed them),
so this wave is as much about **mapping the walls** as draining: every
deferral below is a clean, reproducible reason the function is *not* reachable
from C-or-swap-`.s`, which sharpens the brief-294 scaffolder's target.

## (B) .s-hatch drain — 5 picks

Straight-line cf1a4/cf1a2 + f30 accessors (the CSE'd-`idx*20` commutative-add
wall): `021f2ac8` `021f2138` `021ee23c` `021f1504` `021f0028`. Recipe
unchanged from wave 10 (byte-near C → `asm_escape.py` → ship the verified
`.s`). `021f1504`/`021f0028` confirm the hatch also covers accessors that pass
the f30 value to a helper (`0202e2c8`/`0202e2f8(id)`).

### asm_escape limitation discovered (sub-recipe)

**The hatch only emits straight-line (early-return-chain) bodies.** A function
with an *internal branch* — e.g. a compound `if (idx < 5 && helper(...) == 0)`
guard compiling to a forward `bge` — makes `emit_asm` write `bge <addr>` with
objdump's bare numeric target, which mwasmarm cannot resolve (`did not
assemble`). So the **021b8fcc compound-guard accessors** (`021eea90`,
`021ea10c`, `021ea044`, `021eeb6c`, `021ebb34`, `021ea1b4`, …) are
canonicalisation-residue the tool finds the swap for but cannot ship.
**Recommendation:** teach `emit_asm` to assign a label to each in-range branch
target (and rewrite `b<cc> <addr>` → `b<cc> .Lxxx`). That single enhancement
unlocks ~6+ blocked accessors — high-value, well-scoped, test-bearing; a
tooling task for the brain/scaffolder, not a mid-drain edit to the canonical
tool.

## (A) families continued — 9 `.c`

- **`021ff3bc` predicates:** `022087f8` (021b3ecc + cf17c slot → query),
  `022059d8` (021ff320 + field5 branch), `0220052c` (cf17c/cf288 0x868
  index + field6 short-circuit), `02202b58` (021ca3f0 + field6 gate),
  `02202680` (021b4204 + unk4 9-bit field), `02204330` (global-phase guard +
  021ff354).
- **`021ca2b8` predicates:** `02209ed4` (021bc8c8 + field5, returns 2),
  `021fb138` (key = bit14 ^ bit0).
- **`021ff320` forwarder:** `0220a838` (pure 2-call forwarder, no field reads).

## Sub-recipes banked (the reg-alloc-wall map)

The deferrals cluster into reproducible codegen walls — useful triage signals:

1. **Open-with-bare-bitfield-read → register-numbering wall.** A predicate that
   opens by reading a bitfield and *comparing it to a constant* colours that
   value into a scratch reg mwcc picks differently from orig (mine `r1`, orig
   `r2`); everything downstream matches but the bytes differ. Deferred:
   `02204b08`, `02202840`. **Conversely, reg-STABLE:** open with a helper call
   (self→r4 first), or use the field as a call argument (→r0/r1/r2, forced).
   Every `.c` shipped this wave is call-first or arg-positioned.
2. **Global compare: vs-constant is stable, vs-bitfield walls.** `02204330`
   (`global[+0xCF8] != 2`) and the `02234650` attempt (`global[+0x5A8] ==
   0x7F`) colour fine; `0220623c` (`global[+0xCEC] == self->b0`, wave 10)
   register-walled. The second live value (the bitfield) is what tips it.
3. **Commutative operand eval order is right-first.** `021fb138`'s
   `key = bit0 ^ bit14` matches; `bit14 ^ bit0` swaps the two `lsl`s.
4. **Block-layout wall (new).** `02234650` is byte-near but mwcc places the
   `== 0x7F` handler block *before* the `return 0` tail where orig places it
   *after* — same instructions, different branch offsets. A codegen-ordering
   wall, sibling to register-numbering; not C-controllable. Deferred.
5. **Bitfield-offset idiom** (from wave 10, reused): N-bit field at bit P reads
   as `ldrh; lsl #(32-P-N); lsr #(32-N)` — field5 = bits 1-5, field6 = bits
   6-11, the unk4 9-bit field = bits 6-14.

## Deferred this wave (with reason)

| func | wall |
|---|---|
| `021eea90` `021f21f8` | internal-branch body — asm_escape can't emit (see B) |
| `021ed138` | byte-near but instruction count C=44 vs orig=45 (real gap) |
| `0220623c` `02204b08` `02202840` | register-numbering (open-with-bitfield-compare) |
| `02234650` | block-layout ordering |
| `02253458` small tail | loops (`do/while` over the sink) — liveness, deferred |

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | `.s`: asm_escape byte-verify ✅; `.c`: objdump byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4767 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 5 `.s` + 9 `.c`; EUR ov002 `delinks.txt` gains 14
`complete` blocks. No USA/JPN config change. No tool change — `asm_escape.py`
used as-is.)

## Recommendation for the brain

1. **Extend `asm_escape.emit_asm` with internal-branch labelling** (see B) —
   the single highest-leverage unblock for the `.s` runway (~6+ compound-guard
   accessors immediately, more behind them).
2. **The reg-numbering / block-layout walls are now characterised** (§Sub-
   recipes) — these are the brief-294 scaffolder's cohort. A "register-rename
   `.s` hatch" (emit orig stream when the only diff is a consistent register
   renaming) would unlock `0220623c`/`02204b08`/`02202840` and likely many more.
3. **`.c` predicate runway continues** but is now one-off (each a unique guard
   chain) rather than batchable; expect ~5-8 clean `.c`/wave, declining, until
   a fresh uniform family or a tooling unblock changes the slope.

## Cross-references

- `docs/research/brief-293-coldre-wave10-asm-escape-drain.md` — the recipe +
  the register-numbering wall first flagged.
- `docs/research/brief-290-asm-escape-hatch-generator.md` — the generator + the
  93-function class.
- `tools/asm_escape.py` — the canonical `.s` hatch (the internal-branch
  enhancement target).
