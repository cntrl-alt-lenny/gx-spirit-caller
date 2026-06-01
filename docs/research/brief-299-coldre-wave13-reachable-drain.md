[//]: # (markdownlint-disable MD013 MD041)

# Brief 299 — cold-RE wave 13: keep draining the reachable cohort

**Brief:** 299 (decomper). (A) Continue the `<0x100` fast zone (families +
`.s`-hatch). (B) Keep draining the `0x100-0x200` tier (~3-6 `.c`/wave,
composite hand-RE; the shared header vocabulary is the lever). Defer
loop/liveness/register-numbering.

## Headline

**12 shipped, all 3-region SHA1 PASS — all 12 from the `<0x100` tail.** The
`<0x100` fast zone is *not* exhausted: it still carries rich **post-wrapper
families** (`021d479c` event-posts, `021d730c` lookup-posts) plus forwarder
predicates. The `0x100-0x200` band, by contrast, yielded **0 clean `.c` this
wave** — every band attempt walled. That is the wave's main finding (below):
the brief-296 "404 reachable" census **overcounts** clean-`.c` band yield.

## (A) `<0x100` — 12 `.c`

- **`021d479c` event-post family** (`(arg0 ? 0x8000 : 0) | cmd` + packed
  payload): `021d90fc` `021e28b4` `021df780` `021df7cc` `021d5b80`.
- **`021d730c` lookup-post family** (`021c93f0(self, 11, arg)` → `021d730c`):
  `021d79d0` `021d7970`.
- **Forwarder predicates**: `02208f74` `02264030` `02264d54` `021ca698`
  `0229da1c`.

### Sub-recipe: the `021d479c` post family (refined)

`021d479c` truncates every arg to u16 on entry. The byte-near form:
- declare the wrapper args **`int`** and let the u16 callee proto force each
  `lsl#16;lsr#16` (a `u16` wrapper arg is *not* re-truncated);
- a payload **`>> 16`** split needs the source **unsigned** (`asr`→`lsr`):
  `021d90fc`/`021e28b4` were 1-diff (asr) until the arg/global was `unsigned`;
- a byte field is `(arg & 0xFF) | imm` (the `| imm` keeps the `and #255`
  un-fused), not `(u8)arg`;
- arity varies (3- vs 4-arg `021d479c`) — declare per-TU.

## (B) `0x100-0x200` band — 0 `.c`, and why (the census correction)

Brief 296 measured the band as **58 % "reachable" (91 simple + 313
dispatcher)**. In practice, at the byte-exact level, that reachable set is
mostly **not clean-`.c`**:

| band sub-shape | attempted | outcome |
|---|---|---|
| "simple" flat predicate | `02205e08`, `02267f90`, `021f0848`, `0220c6b8` | **reg-wall** — composite bodies (XOR-key + 3-5 bitfield reads + `cf17c` index + nested helper) overflow mwcc's allocator; the bitfield-compare / global-arith values land in different scratch regs than orig |
| dispatcher (value-map switch) | `02206780` | **uninitialized-var switch** — no `default`, so unmatched cases read the saved r4/r5; not expressible in clean C |
| dispatcher (state-machine) | `02231994`, `02231fa4`, `02234650` | **block-layout wall** (the `g != 0x7F` / `== 0x80` handler-block ordering, brief-295) + global mutation |
| composite procedure | `02214c58` | frame-size + `(u16)x>>8` truncation-order diff |

**So the band's clean-`.c`-shippable subset is ~0 with current tooling.** The
"reachable" 404 is really **`.s`-territory** (reg-alloc-walled composites +
dispatchers), not hand-`.c`. The two wave-12 band `.c` (`02259f98`,
`0220a5b8`) were the rare args-only flat predicates; that seam is now thin.

## Header

Adopted brief 296's "0x100-0x200 BAND" extension into the **build copy**
`src/overlay002/ov002_core.h` (the extension had landed only in the
`docs/research/` research copy; brief 298's full de-dup is still in flight).
**Preserved the `u8` typedef** the `<0x100` `.c` depend on — a blind `cp` of
the research copy would have dropped it and broken the build. (When brief 298
merges, this is a trivial same-content reconcile.)

## Deferred this wave (with reason)

| func | wall |
|---|---|
| `02205e08` `02267f90` `021f0848` `0220c6b8` | band composite reg-wall |
| `02206780` | uninitialised-var dispatcher |
| `02231994` `02231fa4` `02234650` | state-machine block-layout |
| `02214c58` | frame-size + truncation-order |
| `021d5a6c` | post with `ip`-held flag + u8-mask fusion (reg-wall) |
| `02281994` `0220ddac` `022b0444` … | u16-trunc / reg-numbering / mutation |

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | objdump byte-identical (bl/pool modulo) |
| `tools/check_match_invariants.py` | 0 errors (4793 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 12 `.c` + the header band-block; EUR ov002
`delinks.txt` gains 12 `complete` blocks. No USA/JPN config change, no tool
change.)

## Recommendation for the brain

1. **The `0x100-0x200` band is `.s`-territory, not clean-`.c`.** Revise the
   throughput expectation: clean-`.c` band yield is ~0-2/wave, not 3-6. To
   drain the band's 404 "reachable" funcs needs the **`.s` tooling**: (a) the
   `asm_escape` internal-branch enhancement (brief 295/297 ask — unblocks the
   composite predicates' canonicalisation residue), and (b) a **register-rename
   `.s` hatch** (emit orig when the only diff is a consistent register
   renaming) for the reg-walled composites. Without those, the band is a
   hand-`.s` grind.
2. **The `<0x100` tail still has runway** — the `021d479c`/`021d730c` post
   families and forwarder predicates keep yielding (12 this wave). Mine these
   while the band tooling is built; they're fast and reliable.
3. **Brief 298 de-dup**: this wave wrote the band extension into the build
   header to get the vocabulary; 298 should reconcile (drop `docs/research`
   copy, keep src canonical incl. `u8`).

## Cross-references

- `docs/research/brief-296-ov002-0x100-0x200-tier.md` — the band census this
  wave field-tests (and corrects on clean-`.c` yield).
- `docs/research/brief-297-coldre-wave12-0x100-tier.md` — the band reg-wall map
  this extends.
- `docs/research/brief-294-*.md` — the ship-as-`.s` endgame for the walled tail.
