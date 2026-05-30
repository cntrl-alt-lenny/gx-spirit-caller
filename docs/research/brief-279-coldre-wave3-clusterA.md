[//]: # (markdownlint-disable MD013 MD041)

# Brief 279 — cold-RE wave 3: rest of ov002's small hubs + open Cluster A

**Brief:** 279 (decomper). Keep running the wave-2 recipe (`m2c_feed` draft
→ name/type from the 12 banked verbs + band map → coerce → 3-region SHA1)
on (1) the remaining open hubs and (2) **Cluster A** — the `0x868`
per-player core that `0226b054`/`021b3ecc` proved drainable. Defer
reg-alloc walls to the permuter (brief 276 confirmed it plateaus there).

## Headline

**10 shipped, all 3-region SHA1 PASS; Cluster A is open.** The
`021b3ecc`-template (2-D `0x868` lookup → handler → normalise) turned out
to be a **uniform family** — 7 members drained in one batch — plus a
2-member group-2 sink and the last small hub. **The simple-accessor tier
of Cluster A is batch-drainable; the loop/multi-value tier walls on
reg-alloc** and is filed for the permuter. Net: the band's `0x868` core is
now half-mapped and the verbs are banked.

## Shipped (10)

**Last standalone hub:**

| addr | size | role | key |
|---|---|---|---|
| `0225764c` | 0x8c | guarded fp-member dispatch (`r->f8(a0,a1,a2)`) behind a 2-D `0x868` gate-bit; f1472 re-entrancy flag | **int-return contract** (default 1 / gated 0 / call-result) + **unsigned** table read (orig `lsr`, not `asr`) — the `blx` was *not* the wall |

**Cluster A — the 2-D `0x868` handler family (7).** Common head
`v = *(u16*)((char*)data_ov002_022cf1a6 + (arg0 & 1)*0x868 + arg1*20)`
(gotcha 14 `& 1` + the brief-271 `mla`/`mul` 2-D form), varying only by
the tail:

| addr | size | tail |
|---|---|---|
| `021b3e28` | 0x34 | `return h(v, arg2);` (raw) |
| `021b4054` | 0x44 | `return h(v, arg2, arg3) != 0;` |
| `021b4098` | 0x44 | `return h(v, arg2, -1) != 0;` |
| `021b40dc` | 0x44 | `return h(v, arg2, arg3) != 0;` |
| `021b4120` | 0x40 | `r = h(v, arg2); return r ? r->f4 : -1;` |
| `021b4160` | 0x44 | `r = h(v, arg2, arg3); return r ? r->f4 : -1;` |
| `021b41a4` | 0x44 | `r = h(v, arg2, -1); return r ? r->f4 : -1;` |

(`-1` is materialised by mwcc from the live `#20` as `sub r2, ip, #21` —
automatic, like brief 277's `sub r1,r0,#11`.)

**Cluster A — group-2 stack-arg sinks (2).** `func_021b2ebc(arg0, v,
arg2, mode, 0, 0)` with the same `0x868` lookup; `021b3014` mode 0,
`021b30ac` mode 1 (`sub sp,#8` for the two trailing zero stack args).

## Deferred → permuter list (comprehension solved, reg-alloc walls)

Each is **structurally byte-exact** in the draft; only mwcc's
register allocation / scheduling diverges — the brief-276 permuter's exact
domain.

| pick(s) | size | blocking pattern |
|---|---|---|
| `021b9210` | 0x24 | per-player counter; orig keeps `old` (r0) and `old+1` (r1) in separate regs + idx in r3 — mwcc reuses r0 and picks r2. Pure reg-numbering. |
| `021b98c4` + search-loop family (`021b9a30` `021b9aa8` `021b993c` `021b99b4`…) | ~0x78 | linear search w/ bitfield-decoded key. 3 independent diffs: `bls`↔`beq` guard, bound/entry-ptr register swap (orig entry→lr,bound→r2), and the `(field<<1)+bit13` add-operand order. Loop reg-alloc. |
| `021b314c` | 0x6c | 2 calls → `0x868` lookup → 6-arg sink. Structure exact; the 3 saved args land in a different callee-save permutation (gotcha 11, no source lever). |
| list-walk family (`021b3f5c` `021b3fd8` `021b3958`) | ~0x6c-0x7c | `0x868` lookup → `data_ov002_022d0650` linked-list scan w/ bitfield match. Loop reg-alloc. |

**Mid-tier hubs (0x10c-0x168) not attempted:** `02257b48` (0x10c) is a
nested-loop + `blx` monster (defer-class); `021af9d0` (0x120) a long range
router; `0223df38`/`0227ac64`/`021b9ecc` similar. Left for a permuter pass
or a later hand-wave — they are past the forced-codegen knee.

## Calibration refinement — the knee is reg-alloc DOF, not raw size

Wave 2 put the knee at ~0x100 / ~25 instrs. Wave 3 sharpens it: the real
axis is **control-flow shape / value-liveness**, not byte size.

- **Straight-line + ≤1 branch matches at any small size** — the 0x34-0x44
  `0x868` call-wrappers matched first-try (7/7), and `0225764c` (0x8c,
  `blx`) matched once the return contract was right.
- **Loops and multi-value liveness wall regardless of size** — the 0x78
  search loops, the list-walks, and even the **0x24** counter (`021b9210`)
  all diverge on register allocation. mwcc's allocator has too many
  equally-good colourings once ≥3 values are simultaneously live across a
  branch/loop back-edge.

So the hand-matchable cold-RE tier is **simple-accessor / dispatcher
shapes**; loop/liveness-heavy bodies are permuter work even when tiny.
This is consistent with brief 276 ("permuter plateaus on reg-alloc"): the
permuter and hand-matching are blocked by the *same* thing, so the split
is by control-flow shape, not size.

## Banked Cluster A vocabulary (verbs for the band)

- `func_ov002_022cf1a6` (+`cf16c`/`cf17c`/…): the per-player state table,
  `0x868` stride, indexed `(player & 1)`; rows are 20 bytes (`arg1*20`).
- `021b3c10`/`021b3c5c`/`021b3cb0`/`021b3d2c`: per-variant **slot
  handlers** the family dispatches to (take the looked-up u16 + 1-2 args;
  return a node\* whose `f4` is the result, or 0).
- `func_021b2ebc`: a 6-arg **command sink** (group-2).
- `0225764c`: the **current-handler fp dispatcher** (`02257464` fetches
  the handler; `f8` is its callback).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 10/10 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4656 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2294 passed |

(`src/overlay002/` gains 10 `.c`; EUR ov002 `delinks.txt` gains 10
`complete` blocks. No USA/JPN config change. The `/tmp/sc272` m2c harness
+ `tools/m2c_feed.py` drove every draft.)

## Recommendation for the brain

1. **Cluster A's simple tier is a clean hand-vein** — the `0x868`
   handler-family + group-2 sinks have more members (the scan flagged
   ~25+ small `0x868` funcs; ~12 are simple wrappers). A wave 4 can drain
   the rest of the wrappers before the loop tier.
2. **Route the loop/liveness tier to the permuter** — the search-loop and
   list-walk families are uniform (one cracked seeds the rest), and each
   is filed with its exact blocking diff. Good first real permuter targets
   now that brief 276 stood it up.
3. The 12 (wave 2) + 10 (wave 3) banked verbs make Cluster A readable;
   `cf16c`/`cf1a6` row layout (20-byte rows, the bit-packed key) is the
   next thing worth a dedicated struct map (a brief-278-style artifact).

## Cross-references

- `docs/research/brief-277-coldre-wave2-hubs-leaves.md` — the 12 hubs +
  gotchas 20/21/22 this wave reuses; the `021b3ecc` template this extends.
- `docs/research/brief-274-coldre-feeder-and-ov002-band-map.md` — Cluster
  A definition (`022cf16c`, `0x868`) + `tools/m2c_feed.py`.
- `docs/research/recipe-gotchas.md` — gotcha 14 (`& 1` index), the 2-D
  `0x868` form (brief 271), gotcha 11 (callee-save order, the `021b314c`
  defer).
