[//]: # (markdownlint-disable MD013 MD041)

# Brief 375 — overlay reg-alloc backlog → `.s`, wave 3 (+ the `-z` tooling fix)

**Brief:** 375 (decomper). Wave 3 of draining the overlay reg-alloc (TIER-3
plateau) backlog through the Windows `.s` lane (waves 1+2 = briefs 371/373, PRs
#895/#896). Continue from wave 2; `asm_escape --whole-function` each; leave `main`
+ `ov002` to the scaffolder. Gate: 3-region `ninja sha1`.

## Result

- **12 overlay functions shipped as byte-exact `.s`** (target ~8-10) — 3-region
  `ninja sha1` (EUR / USA / JPN) all `OK`.
- **Root-caused and fixed the trailing-pool reloc bug** that blocked ~50% of
  attempts in waves 2-3 (and ~25% of the scaffolder's main probes). The fix is a
  single objdump flag; it unblocked every previously-deferred function,
  including wave 2's `ov010 021b46a8`.

## The headline: the `-z` fix (objdump zero-run collapsing)

Waves 2-3 kept hitting a "did NOT verify" failure whose flagged word had
**identical bytes** (e.g. `e8bd8010(pop {r4, pc}) vs e8bd8010(pop {r4, pc})`).
The scaffolder hit the same thing on ~25% of their main probes. Diagnosis:

- A freshly-assembled `.s` has its literal pool as `0x00000000` placeholders
  (the real value arrives via a link-time `R_ARM_ABS32` reloc).
- `objdump` **collapses a run of zero words into a single `\t...` line** by
  default. So the pool words vanish from the disassembly of *our* `.o`.
- `parse_objdump` therefore never appends those words, and their `R_ARM_*` reloc
  lines cascade onto the **preceding instruction** (the final `pop {…pc}`) — a
  spurious reloc that doesn't exist in the delinked orig (whose pool words are
  non-zero and print in full). `bytes_match` flags the pop, even though every
  real byte is identical.

**Fix:** pass `objdump -z` (`--disassemble-zeroes`) in `disasm()`. Now both the
orig and the assembled `.o` render every word, so they parse symmetrically and
the relocs attach to the correct pool words. One flag. Regression test added
(`TestDisasmZeroFlag`); 24/24 pass.

This was the bug the brief-373 follow-up task was spawned for — now fixed
(simpler than the by-address rewrite that task proposed). It also unblocks the
scaffolder's deferred main funcs.

## The 12 ships

All TIER-3 (reg-alloc plateau) overlay funcs, each `asm_escape
--whole-function`-verified byte-identical vs the delinked gap `.o`.

| overlay | function | size | class |
|---|---|---|---|
| ov003 | `func_ov003_021cc010` | 0xc8 | loop strength-reduction (sprite-band) |
| ov003 | `func_ov003_021cbf08` | 0x108 | loop strength-reduction (sprite-band) |
| ov010 | `func_ov010_021b46a8` | 0xa8 | whole-fn reg-numbering (wave-2 deferral) |
| ov012 | `func_ov012_021caea8` | 0x9c | 11-arg stack-layout builder |
| ov012 | `func_ov012_021caf80` | 0x108 | 11-arg stack-layout builder |
| ov014 | `func_ov014_021b274c` | 0xc0 | block-layout (branch-displacement) |
| ov014 | `func_ov014_021b2644` | 0xa8 | block-layout (branch-displacement) |
| ov020 | `func_ov020_021aae64` | 0x48 | inline tilemap-fill reg-rotation |
| ov020 | `func_ov020_021ab364` | 0x64 | inline tilemap-fill reg-rotation |
| ov020 | `func_ov020_021ab43c` | 0x64 | inline tilemap-fill reg-rotation |
| ov020 | `func_ov020_021ab0d8` | 0x104 | inline tilemap-fill reg-rotation |
| ov020 | `func_ov020_021ada1c` | 0x50 | script-step dispatcher (gotcha-20 block layout) |

Wiring = brief-358/371 convention: `.s` under `src/overlayNNN/` (EUR baseline →
EUR-only build), carve in `config/eur/.../ovNNN/delinks.txt` with `end = addr +
symbols.txt size`. USA/JPN keep these in the gap → byte-identical for free
(rebuilt in 6 steps).

The ov020 picks are the §WALL tilemap-fill loops + the gotcha-20 dispatcher (all
allocator/block-layout class). I deliberately **avoided** the ov020 OBJ-dispatch
`021ab8f8` family — those are explicitly *scheduling* class (permuter territory,
not `.s`).

## Scope

Still **TIER 3 only**. The TIER-2b crack-once-propagate families (script-step
dispatcher ×4, switch-discriminant ×6, post-blx increment ×3, BGCNT bit-pack ×4)
and the scheduling class remain queued for a bounded permuter probe.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**. 24/24 `asm_escape` unit
tests pass.

## Running total

Waves 1 + 2 + 3 = **30 overlay `.s` ships** across ov000 / 003 / 007 / 009 / 010
/ 011 / 012 / 014 / 016 / 017 / 019 / 020. With the `-z` fix the lane no longer
silently drops ~half its candidates, so the remaining reg-alloc backlog is now
fully `.s`-reachable (the prior "deferred — tool edge" caveat is retired).
