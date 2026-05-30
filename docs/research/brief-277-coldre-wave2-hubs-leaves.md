[//]: # (markdownlint-disable MD013 MD041)

# Brief 277 — cold-RE wave 2: hub/leaf-first on ov002 (smallest-first)

**Brief:** 277 (decomper). Wave 1 (brief 275) proved the ov002 0x200-0x400
*branchy* band does not byte-match by hand (the mwcc reg-alloc/schedule
wall, <1 ship/hr). This wave re-aims at the **small, structurally-central
functions** the band map (brief 274) flagged — the Rosetta-Stone hubs
(<0x100, called 12-64×) + the 5 call-free "leaves" — on the thesis that
*small = few reg-alloc permutations, so hand-matching works again.*

## Headline — the thesis is confirmed, emphatically

**12 hubs shipped, every one objdiff-clean + 3-region SHA1 PASS; 1
deferred; 0 hours-long grinds.** The small hubs matched on the first or
second iteration (~5-15 min each) — including the **arg-pack instruction
scheduling that was the exact wall on brief-275's big `021d91e0`**, which
reproduces *perfectly* on the 0x48 `021e286c`. This is the proof the wall
is **degrees-of-freedom, not comprehension or a fundamental mwcc gap**:
the same codegen pattern that is unmatchable across a 0x200 branchy body
is forced (hence matchable) across a 0x30-0x98 one.

Contrast: brief 275 shipped **0/2** on the big band; brief 277 shipped
**12/13** on the small hubs and banked 12 hub verbs for the 260-func band.

## Shipped (12) — the banked hub vocabulary

| addr | size | callers | role (banked verb) | key gotcha |
|---|---|--:|---|---|
| `021ae400` | 0x30 | 64 | guarded event-trigger: `if(!done[a]) dispatch(0x31,0,b,0)` | void leaves r0 as leftover (no guard needed) |
| `021bc618` | 0x74 | 28 | count slots [0,5) passing a predicate; clamp to capacity when gate `0x16df` set | **gotcha 11** decl order (`i` before `count` → i=r4, count=r5) |
| `021e2c5c` | 0x78 | 33 | per-tick **countdown** hub; dispatch `021b1570(10,-1,&v,2)` when a card slot is in state 2, else `f1484--` | **G20** (below) + struct anti-fold |
| `021e2b3c` | 0x98 | 33 | per-tick **countup** sibling (resets f1492/f1672, bumps f1488 on 0→1 edge) | **G20** + struct anti-fold |
| `0223de94` | 0x60 | 27 | leaf: read (bit0, bits1-4) from a u16 slot; `idx = (f18+arg1-5) % 128` else `arr8[arg1]` | **G21** (below) + signed `%128` = `ror#25` |
| `021e286c` | 0x48 | 27 | arg-packer: split `022d016c.f3300` into u16 halves → queue `021d479c` | **arg-pack schedule matches small** (the 275 wall) |
| `021bc6c4` | 0x24 | 16 | guard-then-delegate: `if(021bc618(a)==0) return -1; return 021bc6e8(a)` | `mvneq` for `-1` |
| `021d59cc` | 0x3c | 19 | arg-packer: byte-merge `(arg1&0xff)\|((u8)arg3<<8)` → queue `021d479c` (code 0x36) | **G22** (below) |
| `0226b054` | 0x40 | 16 | C-39f `0x868`-table guard + `0226acf8(a,8,0,0)` | **gotcha 14** `(1-a)&1` index, `mul` by 0x868 |
| `021b3ecc` | 0x40 | 13 | 2-D C-39f: `cf1a6[(a&1)*0x868 + arg1*20]` → predicate-normalise 0/1 | brief-271 2-D `0x868` recipe |
| `022592ec` | 0x38 | 21 | arm a type-7 request in the shared duel-command block `022d016c` | struct field-burst (store order) |
| `0225935c` | 0x4c | 17 | arm a type-8 request, or short-circuit to `0228fa1c` if done-flag==1 | guard + same field-burst |

(8 other appendix hubs — `022593f4` `0202e234` `021ca2b8` `021af9d0`
`021e276c` `021e27c0` `021b0c04` `0227adb8` — were already shipped.)

## New gotchas (candidates for recipe-gotchas.md)

- **G20 — else-block is out-of-line.** mwcc emits the `if`-body **inline**
  (fall-through) and the `else` **out-of-line** (reached by a forward
  branch, placed last). To match an orig where a block is jumped-to and
  physically last, that block must be the `else`. The fix for the
  `021e2c5c`/`021e2b3c` siblings was the **`||`-inverted guard**:
  `if (D0C==0 || tbl[CEC]!=2) { common } else { special }` puts the common
  (decrement/increment) path inline and the dispatch path out-of-line —
  the `&&`-with-call-in-the-then form put the call inline (wrong order).
- **G21 — bitfield reads want a register, not a memory local.** Reading a
  bitfield through a *named struct local* (`VBits v = *p; … v.b0`) gives
  the struct a stack home → mwcc adds a frame + a dead spill (`sub sp,#4;
  strh r,[sp]`). Read through a **bitfield-struct pointer**
  (`((VBits*)p)->b0`) so the u16 is loaded once into a register and both
  fields extract in-register — a frameless leaf, matching orig.
- **G22 — byte-into-high-half pack.** `(x & 0xff) << 8` *fuses* to
  `(x<<24) >>u 16` (one `lsl#24` + a barrel `lsr#16` in the `orr`). To get
  the orig's `and #0xff` + barrel `lsl #8`, write `(unsigned char)x << 8`
  (the gotcha-16 u8 cast supplies the `and`, the `<<8` is the barrel).
  **Corollary:** adding a *named local* to host the masked byte flipped
  mwcc from a framed `bl`+`pop` into a frameless tail-call `bx` — omit the
  local (inline the cast) where the orig is framed.

Reaffirmed: gotcha 11 (decl order picks callee-saves), 14 (explicit `& 1`
on the `0x868` index), 16 (u8 cast forces `and #0xff`), the extern-struct
**anti-fold** (`base + [#offset]`, never folding `sym+const` into one pool
word — every `022d016c`/`022ce288` access used it). One scheduling worry
from brief 275 — materialising `-1` as `sub r1,r0,#11` from a live `#10` —
turned out to be **automatic** on the small functions (`func(10,-1,…)`
emits it without coaxing).

## Deferred (1 hub + the 5 leaves) — permuter candidates (brief 276)

- **`021d479c`** (0x98, 21 callers — the event-queue push the two
  arg-packers feed). Structure fully understood (write 4 u16 columns at
  the write index, run `0229cd40`, bump index). **Blocker:** the index
  lives in a *different* global, so orig **re-reads it before every column
  store** (the computed-pointer stores might alias it); mwcc instead
  **caches** the index and the four column bases in callee-saves
  (`push {r4,r5,r6,r7,…}` vs orig's `push {r4,lr}`, `count*8` computed
  once). A reg-alloc/alias-analysis divergence, not a comprehension gap.
- **The 5 "leaves" are not small.** Raw instruction counts:
  `022a60f4` 139i / **62** shift-mask (dense bit-pack), `022bc2b4` 139i /
  **58** branches, `021b78b8` 185i / **88** branches, `02299d34` 189i /
  **118** branches, `021b947c` 210i / **85** shift-mask. Call-free, but
  every one is 139-210 instructions of interleaved temps/branches/packs —
  squarely the brief-275 reg-alloc/schedule wall. Per the brief's
  anti-grind rule they are deferred wholesale.

## Calibration result (the brief's ask)

**Matchability tracks SIZE / reg-alloc DOF, not call-presence.** The
"leaf" label (no `bl`) does not make a 139-instruction bit-packer
hand-matchable; conversely a 0x30 hub with a `bl` matches instantly. The
clean knee is ~**0x100 / ~25 instructions**: below it, the schedule and
allocation are forced and hand-coercion works (12/13 here); above it the
DOF explode (brief 275: 0/2; the 5 leaves; `021d479c` at 0x98 already
shows reg-alloc can wall even a small-ish body).

| | brief 275 (big band) | brief 277 (small hubs) |
|---|---|---|
| ships / attempted | 0 / 2 | 12 / 13 |
| per-pick time | hours (deferred) | ~5-15 min |
| wall | reg-alloc/schedule | only on the 0x98 reload-pattern hub |

## Recommendation for the brain

1. **Keep draining small hubs by hand** — it works and it banks the band
   vocabulary. The appendix still has open <0x100 hubs (`0225764c` 0x8c,
   plus the 0x10c-0x168 mid-tier) for a wave 3.
2. **The permuter (brief 276) is the right tool for the rest** — the 5
   leaves and `021d479c` are filed with their exact blocking patterns
   (bit-pack schedule / branch-tree lowering / index-reload aliasing).
   m2c (draft) → permuter (byte-match) remains the Track-2 pipeline for
   the 0x100+ band.
3. The 12 banked hub verbs make the 260-func band readable; Cluster A
   (the `0x868` per-player core) is now the natural next hand-target since
   `0226b054`/`021b3ecc` proved the `0x868` recipe still holds.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 12/12 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4646 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2294 passed |

(`src/overlay002/` gains 12 `.c`; `config/eur/.../ov002/delinks.txt` gains
12 `complete` blocks. No USA/JPN config change — those ROMs rebuild
byte-identically from their own delinks + orig gap bytes. The `/tmp/sc272`
m2c harness + `tools/m2c_feed.py` drove every comprehension draft;
research-only, not committed beyond the already-landed feeder.)

## Cross-references

- `docs/research/brief-274-coldre-feeder-and-ov002-band-map.md` — the band
  map + hub list this wave drained, and `tools/m2c_feed.py`.
- `docs/research/brief-275-coldre-wave1-ov002-band.md` — the big-band wall
  this wave re-aims away from; the arg-pack-schedule P-candidate
  (`021d91e0`) whose pattern `021e286c` here matches small.
- `docs/research/recipe-gotchas.md` — gotcha 11/14/16, the anti-fold;
  G20/G21/G22 above are this wave's additions.
