[//]: # (markdownlint-disable MD013 MD041)

# Brief 343 — pivot to ov009: clean-C wave 1

**Brief:** 343 (scaffolder, co-drain). ov003 is drained (brief 341, #857), so
pivot to **ov009** — flagged as the small tail of the fresh-overlay vein (~15
funcs `<0x100` remain after an earlier stub/sinit pass), expect a smaller ramp,
flag if thin. Decomper is on ov019 — steer clear. Survey by size-histogram
clustering, spot-check reshape-ability, full recipe library. Own
`src/overlay009/` + the ov009 `delinks.txt` + a new `ov009_core.h`. Per-pick gate
= EUR objdiff 100%; the brain runs the 3-region SHA1 on merge. Target ~8.

## Headline

**8 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK — at target, not
thin.** 8 of 12 attempts matched; the 4 misses are all register-allocation
coin-flips (catalogued for the Mac lane, not graded down). ov009 is a
scene/transition controller in the overlay-0/2 swap base range; the recipe
library transferred to a **5th overlay** (after ov006/005/015/021/003).

## Survey

26 gap funcs (15 `<0x100`, 9 `<0x80`). The size-histogram threw three "clone-size"
pairs (0x44 / 0x80 / 0xe8) but **every pair was coincidental** — distinct logic,
no real clone families. So each pick stood on its own recipe rather than
clone-by-template. Authoritative sizes came from `symbols.txt`
(`kind:function(arm,size=…)`), not the disassembly line-count (which over-counts
pool words — bit me twice).

## The 8 picks (by recipe)

| func | size | recipe |
|---|---|---|
| `021ad73c` | 0x98 | scene-exit **teardown** (ov005/ov003 recipe verbatim; dual `func_0208c884(reg,-0x10)` → `mvn`) |
| `021ab848` | 0x80 | controller **init** (zero block + seed fields + alloc + sub-builders) |
| `021ab7b4` | 0x84 | enable/disable **state-setter** (load `o[0x8]` once before the branch) |
| `021ab32c` `021ab8c8` | 0x48 | per-entry **poll / teardown** guard-chains (MMIO 0x800 status bit) |
| `021ab74c` | 0x68 | frame-retarget **setter** (branch-to-shared-return lever) |
| `021ad1bc` | 0x48 | **bit-test** `(mask & (1<<(n-1))) != 0` (`&` operand-order lever) |
| `021ad6bc` | 0x80 | per-frame **step** + `&&`-return (orr shifted-operand-first lever) |

Four matched first try (`021ab32c`, `021ab8c8`, `021ad73c`, `021ab7b4`); the
other four took one reshape each.

## Reshape levers (one NEW)

1. **Branch-to-shared-return** (`021ab74c`, re-proven from ov003 `021cce58`): a
   guard `if (cond) return K; <work>; return K;` (same K both arms) emits an
   *inline* conditional return (`moveq`/`ldmeqia`); rewrite as
   `if (!cond) { <work> } return K;` — guard skips the work, one trailing return —
   to get the orig's branch-to-shared epilogue. (92.6% → 100%.)
2. **`&` operand order picks the `tst` register** (`021ad1bc`): `mask & (1<<s)`
   put the mask in the wrong reg; `(1<<s) & mask` flipped it. (83.3% → 100%.)
3. **NEW — shifted-operand-first for an `orr` destination reuse** (`021ad6bc`):
   `A | (B<<k)` made mwcc reuse **B**'s register as the destination
   (`orr Rd, RB(=Rd?), RA…` mismatch); writing `(B<<k) | A` makes it reuse **A**'s
   register, matching the orig `orr Rd, RA, RB lsl#k` with `Rd==RA`. (90.6% → 100%.)
   Temp-binding either operand did **not** help — only the source operand order did.

## Deferred (attempted, register coin-flips → Mac lane)

| func | best % | class |
|---|:---:|---|
| `021aa59c` | 73% | register-use: orig parks the extracted BGxCNT field in the `r12` scratch, mine packs into `r2` |
| `021ad7d4` | 72% | blx post-call: clean-tail idiom fixed the no-handler path (45→72), but the post-`blx` increment block rotates registers |
| `021ac458` | 66% | point-in-rect `&&`-chain: per-pair `cmp` ties register **and** operand order to source — can't get both right |
| `021ab910` | 60% | switch-discriminant coin-flip (lands in r0 not r1, rotates the whole body); declaration-order did not move it (= ov003 `021cbe8c`) |

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **8/8 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov009 `delinks.txt` | +8 `complete .text`; gap set 26 → 18 (−8, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `origin/main` (`f0c8c0a`, after #857/#858);
cleaned stale gaps + re-`dis`. Deferred near-misses removed from `delinks.txt`
and `src/` before the authoritative build. New `ov009_core.h` (reference only —
the `.c` files stay self-contained).

## Recommendation

ov009 yielded **8 at target** — the small tail was healthier than flagged. The
remaining 18 gap funcs split into the four catalogued coin-flip classes plus the
big 0x158–0x974 render/update bodies (`021ac4d0` is 0x974), all Mac/permuter
material. A wave 2 on ov009 would be thin (a few coin-flips at most); recommend
the next scaffolder wave pivot to another fresh overlay and route ov009's residue
to the permuter/m2c lane.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
