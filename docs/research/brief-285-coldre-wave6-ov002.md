[//]: # (markdownlint-disable MD013 MD041)

# Brief 285 — cold-RE wave 6: ov002 simple-shape, batch the families

**Brief:** 285 (decomper). Batch the largest simple-shape family (the
multiplier); apply the full gotcha catalog (now through 26) + the
extern-struct anti-fold; shape-triage from the m2c draft and send loop /
liveness / predication-heavy bodies to the permuter.

## Headline

**12 shipped, all 3-region SHA1 PASS.** brief-284's explicit worklist
hadn't landed, so I built the family worklist myself with an in-process
`m2c_feed.feed()` shape-triage scan: it surfaced **~140 simple-shape
`<0x58` candidates** in ov002 — a vast hand-drain runway. The dominant
class is the gotcha-26 `0x868` pass-through accessors plus a spread of
small dispatchers / predicates / command-state writers. **12/15 attempted
shipped; the 3 misses are scheduling / 2-bitfield / callee-save nuances**
(permuter), not shape failures.

## Shipped (12)

| addr | size | shape / role |
|---|---|---|
| `021c9b2c` / `021c9b80` | 0x54/0x68 | **per-player bit set/clear pair** (cf288 word; cf1ac 2-D) |
| `021c9be8` | 0x60 | gated threshold (`021bd85c` guard → cf16c counter vs `021bb068*500`) |
| `021b9d34` | 0x70 | gated threshold (`02030ea4`/`021b9bd4` guards → cf1a8 u16) |
| `021d6714` | 0x68 | **arg-pack accessor** — bitfield-id guard → `func_021d479c(packed,…,8)` |
| `021c031c` | 0x30 | two-call predicate (`021bff50` then `021c0258(1-arg0)`) |
| `021c9c48` | 0x4c | two-call predicate (`021b3fd8` then `021b3ecc`) |
| `021ff540` | 0x30 | out-param pair test (`021ff540: 0220eb00(&buf); buf0\|buf1`) |
| `021de480` | 0x30 | bit-mask test (`1<<(arg1+arg0*16)` vs `021de41c`) |
| `021cb23c` | 0x34 | command-state writer (enter state 9; reset block + queue tail) |
| `021d1250` | 0x34 | guarded step (`0229c7f8(5)` busy-guard → step 10) |
| `021d1b2c` | 0x30 | dispatch event 54 (queue head) + clear tail |

No new gotcha needed — every pick fell to the existing catalog (G23-26 +
the anti-fold + the unsigned-shift / bitfield rules). The wave validates
that the simple-shape drain is now **recipe-driven and high-throughput**.

## Method — the shape-triage scan as a family-worklist generator

`tools/m2c_feed.py`'s `feed()` imported in-process; for each unshipped
`<0x80` ov002 func: parse the GAS, flag **loop** (backward branch to a
seen label), **indirect** (`blx` / `addls pc`), and branch count; emit the
straight-line / ≤2-branch ones. Two passes (0x868-only, then all-globals)
produced the worklist. This *is* the family batcher the brief wanted —
shape, not a single call-graph cluster, is the right grouping key (the
12 ships span 6 micro-shapes but one triage pass).

## Family recipes banked

- **per-player bit set/clear** (`021c9b2c`): `if (set) *flag |= 1<<b;
  else *flag &= ~(1<<b);` over `cfXXX[(player&1)*0x868 (+row*20)]` —
  inline the `(player&1)*0x868` per branch (orig muls per branch, hoists
  only the `& 1`).
- **gated threshold** (`021b9d34`): `if (g0 && g1>=0) return v > thresh;
  return 0;` — the `&&`-return form yields the shared `return 0` block
  (vs inline conditional returns).
- **arg-pack accessor** (`021d6714`): bitfield-id guard (gotcha 25) →
  `021d479c((player?0x8000:0)|code, …)` — the wave-2 arg-pack recipe.

## Deferred → permuter (3 of 15 attempted)

| pick | nuance |
|---|---|
| `021c2330` | mul **scheduling** — orig delays both index muls past the base load; mine emits them early. Logic/branches exact. |
| `021c2a40` | reads **two bitfields from one word** (player=bit13, id=low13); single-load + dual-extract reg coloring. |
| `021d2ca0` | `(field<<1)+bit13` key decode + event dispatch — bitfield scheduling. |
| `021b314c` | wave-3 **callee-save permutation** (gotcha 11), not a G26 pass-through case — distinct allocator nuance. |

Plus the loop families (search-loop / list-walk) the triage filters out.
Small residue; the bulk of the vein is hand-drainable.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 12/12 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4689 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2302 passed |

(`src/overlay002/` gains 12 `.c`; EUR ov002 `delinks.txt` gains 12
`complete` blocks. No USA/JPN config change. `tools/m2c_feed.py` + the
in-process triage drove every pick; m2c itself unused — simple-shape GAS
reads directly.)

## Recommendation for the brain

1. **The simple-shape vein is the steady-state hand-drain** — ~140
   `<0x58` candidates surfaced in one pass; at ~12/wave that is many
   waves of runway in ov002 alone, before the next gameplay overlay.
2. **Bank the shape-triage scan as a tool** (`find_simple_shape.py`-style)
   — it is the reliable worklist generator; promote it out of the inline
   one-offs so each wave starts from a fresh ranked list.
3. Route the small permuter residue (scheduling / 2-bitfield / callee-save
   / loops) as a batch — they share root causes the permuter targets.

## Cross-references

- `docs/research/brief-282-ov002-accessor-signature.md` — the G26
  pass-through lever (the accessor-tier unlock).
- `docs/research/brief-283-coldre-wave5-ov002.md` — wave 5; G26.
- `docs/research/recipe-gotchas.md` — G23-26 + the anti-fold, all applied
  here without addition.
