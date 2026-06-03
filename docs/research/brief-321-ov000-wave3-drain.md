[//]: # (markdownlint-disable MD013 MD041)

# Brief 321 — ov000 co-drain wave 3

**Brief:** 321 (scaffolder, co-drain). Continue the ov000 stream from waves 1–2
(briefs 317/319). Branch `scaffolder/ov000-wave3` off latest main (waves 1–2
merged: 36 ov000 `.c`). Per-pick gate = **EUR objdiff 100%** (direct-mwcc); the
brain runs the 3-region SHA1 on merge. Own `src/overlay000/`, the ov000
`delinks.txt`, and `ov000_core.h`. Target ~10–15 picks; **flag thinning**.

## Headline — thinning confirmed

**3 shipped (all `.c`), all EUR objdiff 100%**, all drop out of a clean ov000
re-delink, and **EUR `ninja sha1` PASSES** with the wave applied. ov000 matched
`.c`: 36 → **39**.

**The clean-C cohort is now mined.** Yield by wave: **11 → 13 → 3**. Waves 1–2
drained every easy read / predicate / RMW / store / small-orchestrator shape
(recipes in `ov000_core.h`). I examined essentially all 62 remaining unmatched
ov000 functions this wave; the residue is dominated by four classes that are
**not** clean-C co-drain material (census below). This is the thinning the brief
asked us to flag — wave 4 should pivot.

## The 3 picks

| shape / family | funcs |
|---|---|
| u16 saturating-clamp RMW (sibling of `021abfbc`/`abfec`) | `021ac050` |
| **object-builder clone pair** (12-arg `0201e964` window build) | `021ad540` · `021ad49c` |

The object-builder pair is the wave's substantive result: `021ad540` was
flagged in the wave-2 header as a "dedicated-RE orchestrator", but it **matched
first try** once modeled, and `021ad49c` is a near-identical clone (differs only
in the object table pointer + two window-size constants). The template + the
recovered sink signatures are captured in `ov000_core.h` §VERIFIED.

### Sinks recovered (byte-proven via the call sites)

- `func_0201e800(void *obj, int a1)` — re-init.
- `func_0201e964(...)` — **12-arg** window build (4 reg + 8 stack args).
- `func_0201e7ec(void *obj, int a1)` / `func_0207fd28(void *obj, int a1)` — finalize/free.
- `data_ov000_021c760c[]` / `021c7604[]` — stride-4 object-pointer tables.

## Residue census — why wave 3 thinned (62 unmatched, all examined)

| class | count | disposition |
|---|--:|---|
| Fixed-point math (`smull`/`mla` coord/distance) | ~7 | m2c / permuter (`021ae510`, `021ab01c`, `021aaee4`, `021aa8d4`, `021ac578`, `021acc58`, …) |
| Multi-field bitfield **PACKs** (incl. command-record builds) | ~14 | **ship-as-`.s`** (`021af4d8`, `021ae394`, `021abd50`, the `021c7530` accessors, `021ad660`/`8dc`, …) |
| Reg-alloc / CSE / codegen near-misses | ~5 | **permuter** (`021ac920` 2-byte, `021abf78` 17v17, `021acdcc` 17v18, `021ab850`, `021aa840`) |
| Big branchy state-machine builders | ~15 | dedicated RE (`021ac578`, `021acaf8`, `021ae218`, `021adc50`, `021adfc4`, …) |

### High-value near-misses (for the permuter / brain-on-merge)

- **`021ac920`** (0x108 guarded builder) — **66v66, byte-identical except 2
  bytes**: the entry guard loads `obj->f104` into r0 (mine) vs r3 (orig), pure
  register-numbering the C front-end won't flip. Modeled fully (incl. the lever
  that `obj->flags` must be **`volatile`** so mwcc re-reads `[+152]` each use
  instead of caching it in a callee-saved reg). **Permuter-trivial**, and it
  recovers four more sinks (`0201ef90` 10-arg / `0201ef10` / `0201e7e0` /
  `0201ede4`). Worth landing on merge.
- **`021ad660`/`021ad8dc`** — 0x27c command-record builder clone pair (dual
  record + MMIO + field packs). The builder *shape* is proven drainable
  (021ad540), but 159 instructions with multi-field packs is dedicated-RE, not
  a sweep pick.
- **`021ae42c`** — `bx ip` pooled tail-call: the orig pools the far `021ae510`
  and tail-branches; a standalone direct-mwcc compile emits `bl`+frame. A
  link-layout artifact — it will match once linked (the brain reproduces on
  merge), but the harness can't show it standalone.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **3/3 byte-identical** |
| clean re-delink drop-out (disasm-header scan) | **3/3** out of the ov000 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| overlay-swap aliasing (gotcha 18) | still clear (picks all in the ov000-only range) |
| ov000 `delinks.txt` | 39 `complete .text` blocks (36 prior + 3) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay000/` gains 3 `.c`; `ov000_core.h` gains the §VERIFIED wave-3 block
(object-builder template, recovered sinks, the residue census, the near-misses).
EUR ov000 `delinks.txt` +3 `complete`. No tool / USA / JPN change.

## Recommendation for the brain

1. **Pivot wave 4 to a fresh clean-C overlay — ov000's clean cohort is mined.**
   Per brief-300's ov004 > ov000 > ov008 reachability ranking and the decomper
   already on ov004, the scaffolder's next clean-C stream is **ov008**.
2. **Hand the ov000 residue to its right tools, in parallel:**
   - **Permuter** the reg-alloc near-misses — `021ac920` first (2 bytes, +4
     sinks), then `021abf78` / `021acdcc` / `021ab850` / `021aa840`.
   - **`asm_escape.py --whole-function`** the multi-field PACK family (the
     `021c7530` accessors + region packs + `021abd50`/`af4d8`/`ae394`) — same
     `.s` pass that closed the ov002/ov006 tails.
   - **Dedicated RE** for the object/command-record builders (`021ad660`/`8dc`
     clone pair is the best next target — the 12-arg template already exists)
     and the fixed-point class (m2c/decomp.me).
3. ov000 will reach a high match rate via (2) without more co-drain sweeps; the
   sweep's marginal value here is now low (this wave: 3 picks for a full pass).

## Cross-references

- `docs/research/brief-319-ov000-wave2-drain.md` — wave-2 (13 picks) + the recipe set.
- `docs/research/brief-317-ov000-wave1-drain.md` — wave-1 footing + struct map.
- `docs/research/brief-300-ov006-premap.md` — the ov004 > ov000 > ov008 ranking.
- `src/overlay000/ov000_core.h` — globals / struct map / sink signatures /
  recipes / the §VERIFIED wave-3 object-builder template + residue census.
