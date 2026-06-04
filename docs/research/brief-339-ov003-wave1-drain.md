[//]: # (markdownlint-disable MD013 MD041)

# Brief 339 — pivot to ov003: clean-C wave 1 (fresh, reshape-able overlay)

**Brief:** 339 (scaffolder, co-drain). ov021's tractable tier is drained (brief
337), so pivot to **ov003** — 19 funcs `<0x100`, clustered by the decomper's
brief-336 survey at 8 clone-families. Per-pick gate = EUR objdiff 100%
(direct-mwcc); the brain runs the 3-region SHA1 on merge. Own `src/overlay003/`,
the ov003 `delinks.txt`, and a new `ov003_core.h`. Target ~10-12.

## Headline

**11 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK.** ov003 is an
ov006-style overlay again — per-state methods over a central struct
(`data_ov003_021cf6c0`) — and **the whole recipe library transferred** (11 of 14
attempts matched). Two clone pairs, the dispatch/state/bounds-check vein, and a
notable finding: **a clean `blx` dispatch matches** (the permuter-class blx
near-misses were specifically the ones doing work in the no-handler tail).

## The 11 picks (by recipe)

| recipe | funcs |
|---|---|
| teardown (ov005) | `021ca0c8` |
| dispatch step (ov006 family A, **blx**) | `021ca1fc` |
| hit-test bounds-check (ov005 `&&`-chain) | `021cefec` `021cf064` (clone pair) |
| cell-addr lookup | `021ccd80` `021ccdb8` (clone pair) |
| progress gate / gesture poll | `021cce58` `021ceeb4` |
| FIFO push / button event / cursor glyph | `021ca254` `021cef78` `021ccdf0` |

## Findings re-proven / new

- **A clean `blx` dispatch MATCHES** (`021ca1fc`, ov006 family A): `cb =
  table[state[0]]; if (cb) { if (cb()) {++state[0]; state[1]=0;} return 0; }
  return 1;`. The permuter-class blx near-misses (ov005 `021acfb0`, ov015
  `021b5a14`) were specifically those whose no-handler tail did *work* (a `bl`);
  a tail that just `return 1` has no post-blx scheduling to diverge.
- **Per-case bool codegen** (`021cce58`): `return (unsigned)v >= K` compiles to a
  branchless `movhs/movlo`, but the orig branches to a shared `return 0`. Write
  `if ((unsigned)v >= K) return 1; break;` with one trailing `return 0;`.
- **Arg in the 2nd param register** (`021ccd80`): the orig reads the arg from r1,
  so declare `(int dummy, int arg)` — 78% → 100%.
- **Branch-tail-dup over stack** (`021cef78`): each `mode` branch gets its own
  stack packet (sp[4] vs sp[0]); declare the local inside each branch.
- **Bind-struct-base** (`021ceeb4`) + the `data_02104f4c.chan` `:3` bitfield
  (`021ccdf0`) + the ov005 bounds-check `&&`-chain (`021cefec`) — all unchanged.

## Deferred (NOT shipped — catalogued for the Mac lane)

| func | % | class |
|---|:---:|---|
| `021cbe8c` | 87% | 3-state machine — switch discriminant in r0 vs r1 (allocator coin-flip, same as ov005 `021ad284`; the state-temp does not move it) |
| `021ceb84` `021cbdf4` `021cc010` | — | sprite-build loops (bit-packing) |
| `021cd358` `021cedf8` `021cd420` … | — | big render setups (register/stack-arg-dense) |

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **11/11 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov003 `delinks.txt` | +11 `complete .text`; gap set 32 → 21 (−11, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `main` (`cd9e1e9` = #853 + #852); cleaned stale
gap files + re-`dis`.

## Recommendation for the brain

1. **ov003 is a strong, reshape-able vein — keep the scaffolder here for wave 2.**
   ~10 funcs remain: the sprite-build loops (bit-packing) and the big render
   setups. Expect a smaller wave 2 (~4-6) like ov021's, then the loop/render tail
   for the Mac lane.
2. **The recipe library remains overlay-portable** (4th fresh overlay in a row;
   ov006/005/015/021 recipes all applied unchanged). The clean-blx-dispatch
   finding refines the "blx = permuter" rule: only blx-with-work-in-the-tail is
   permuter-class.
3. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.

## Cross-references

- `docs/research/brief-337-ov021-wave2-drain.md` — the prior wave + the
  declaration-order reshape lever.
- `src/overlay003/ov003_core.h` — §VERIFIED wave-1 block + the clean-blx finding
  + the deferred catalogue.
