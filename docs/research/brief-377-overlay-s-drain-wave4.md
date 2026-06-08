[//]: # (markdownlint-disable MD013 MD041)

# Brief 377 — overlay reg-alloc backlog → `.s`, wave 4 (+ `stm`/`ldm` fix, + thinning verdict)

**Brief:** 377 (decomper). Wave 4 of draining the overlay reg-alloc tier through
the Windows `.s` lane (waves 1-3 = briefs 371/373/375, PRs #895/#896/#899). Plus
an explicit ask: **if the overlay `.s` tier is thinning, flag it** — the cue to
weigh the permuter/WSL for the commutative-peephole tier.

## Result

- **12 overlay functions shipped as byte-exact `.s`** (target ~8-10) — 3-region
  `ninja sha1` (EUR / USA / JPN) all `OK`; 25/25 `asm_escape` tests pass.
- **Fixed the `stm`/`ldm` "did not assemble" gap** (the other half of the
  translation failures; also unblocks the scaffolder).
- **Applied the scaffolder's `kind:data` link-screen** — dropped 2 ships that
  would have link-failed.
- **THINNING: flagged.** The curated worklist TIER-3 is drained; what remains is
  scattered, lower-value. Recommend standing up the permuter (WSL) now — see
  verdict below.

## The 12 ships

The curated `permuter-worklist.md` TIER-3 is **fully drained** (waves 1-3), so
wave 4 mined the per-overlay `*_core.h` §WALL/§DEFERRED catalogues for
reg-alloc / loop-SR / block-layout / frame near-misses (NOT commutative /
peephole / scheduling — those are permuter). Each `asm_escape
--whole-function`-verified byte-identical vs the delinked gap `.o`.

| overlay | function | size | class (best%) |
|---|---|---|---|
| ov003 | `func_ov003_021cd358` | 0xc8 | func_0201ef90 marshalling (43%) |
| ov005 | `func_ov005_021af704` | 0x4c | byte-sum loop strength-reduction (47%) |
| ov010 | `func_ov010_021b28a8` | 0x48 | edge predicate (89%) |
| ov010 | `func_ov010_021b3f98` | 0x7c | `col` alloc coin-flip r0-vs-r1 (76%) |
| ov010 | `func_ov010_021b27d8` | 0x84 | req[0]/req[1] store-merge wants stmia (71%) |
| ov012 | `func_ov012_021ca36c` | 0x90 | 2-mode tile lookup reg-permutation (32%) |
| ov015 | `func_ov015_021b30f0` | 0x78 | nested tile-fill loop pointer-IV (34%) |
| ov015 | `func_ov015_021b43a8` | 0x9c | whole r4-r7 allocation rotation (44%) |
| ov017 | `func_ov017_021b6610` | 0x98 | param-apply jump table base-reg reuse |
| ov018 | `func_ov018_021aaa3c` | 0x4c | cell-attr forwarder address-add (63%) |
| ov019 | `func_ov019_021b3f34` | 0x48 | coord-offset wrapper inline ldrsh (77%) |
| ov020 | `func_ov020_021ab9d0` | 0x84 | o[0x48]/o[0x44] load-register swap (78%) |

Wiring = brief-358/371 convention (EUR-only `.s` + delinks carve, `end = addr +
symbols.txt size`). USA/JPN keep them in the gap → byte-identical for free.

## Tooling: the `stm`/`ldm` "did not assemble" fix

Two candidates (`ov003 021cd358`, `ov010 021b27d8`) hit `Undefined macro or
opcode: stm`. objdump prints a store/load-multiple in the **default IA**
addressing mode with the suffix omitted — `stm sp, {r4, r5}` — but mwasmarm
requires it explicit: `stmia sp, {r4, r5}` (and `stmeq` → `stmeqia`). Added that
to `to_mwasm()` (`+unit test`); both then assembled + verified. This is the same
"did not assemble" class the scaffolder flagged on main (`02004fb8`); the fix
clears it for both lanes. (The earlier `-z` fix, brief 375, handled the *other*
class — "did NOT verify".)

## Link-safety: the `kind:data` screen (scaffolder's brief-378 lesson)

A whole-function `.s` references its pooled globals via `.extern`. If a global is
`kind:data` (not `kind:bss`), `dsd` emits no linkable definition → the link
fails with an undefined symbol — and `asm_escape`'s byte-verify can't see it
(it checks the `.o` in isolation). I pre-screened every ship's `.extern data_*`
against `symbols.txt` and **dropped 2** that referenced `kind:data` globals:
`ov005 021af874` (→ `data_ov005_021b1618`) and `ov012 021cb400` (→
`data_ov000_021b56b4`, `data_ov012_021cc120`). The other ships' externs are all
`kind:bss` (verified). This is the brief-361 data-reloc risk, caught pre-gate.

## THINNING VERDICT — time to weigh the permuter/WSL

**The overlay `.s` reg-alloc tier is thinning — flagged as requested.** Specifics:

- The curated worklist TIER-3 is **drained** (waves 1-3 took every explicit
  entry). Wave 4 had to mine the looser `*_core.h` §WALL catalogues, where
  reg-alloc walls are now **scattered 1-3 per overlay** and trending **low-%**
  (many 26-47%) — still valid `.s` targets, but lower-density to find.
- There is roughly **one more `.s` wave** of scattered §WALL reg-alloc walls left
  (~8-12 across ov005/010/012/015/018/020 + overlays not yet swept), then the
  overlay reg-alloc tier is genuinely done.
- The **highest-leverage remaining overlay work is permuter-shaped**, and `.s`
  can't (or shouldn't) take it:
  - **Crack-once-propagate families** — dispatcher ×4, switch-discriminant ×6,
    post-blx increment ×3, BGCNT bit-pack ×4 (~20 funcs). One permuter crack of
    each canonical instance propagates to its siblings **as real C**. `.s`-ing
    them forfeits that — they've been deliberately skipped every wave.
  - **The commutative / peephole HIGH tier** — proven permuter-tractable (brief
    363), not reachable by `.s` at all (it's about *matching* in C).

**Recommendation:** continue the `.s` drain for ~1 more wave to mop up the
scattered reg-alloc walls, **but stand up the permuter on WSL now** — it's the
only path to the ~20-func crack-once families and the commutative/peephole tier,
which together dwarf the remaining `.s`-able backlog. The brief-369 spike pegged
the permuter as bootstrap-OK / run-mode-blocked-on-Windows, with WSL the
low-risk route.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**. 25/25 `asm_escape` tests
pass.

## Running total

Waves 1-4 = **42 overlay `.s` ships** across ov000 / 003 / 005 / 007 / 009 / 010
/ 011 / 012 / 014 / 015 / 016 / 017 / 018 / 019 / 020 (15 overlays). With the
`-z` (brief 375) and `stm`/`ldm` (this wave) fixes plus the `kind:data` screen,
the lane is now robust end-to-end; the residual translation gaps are down to
rare opcodes.
