[//]: # (markdownlint-disable MD013 MD041)

# Brief 303 — cold-RE wave 15: keep draining the ov002 reachable cohort

**Brief:** 303 (decomper). (A) `<0x100` fast zone (`021d479c` posts +
forwarder predicates). (B) `0x100-0x200` composite tier. Defer
loop/liveness/register-numbering.

## Headline

**7 shipped (all `.c`), all 3-region SHA1 PASS.** A lower-yield wave: after 14
prior waves the ov002 `<0x100` *clean* cohort is **heavily drained** — the
simple `021d479c` posts and pure forwarders are gone, and the remaining
small functions are dominated by the **register-numbering wall** (byte-temp
ordering, global-value-in-reg, RMW addressing). The 7 picks are the last clean
forwarders + a `ce950` flag-post family; ~10 near-miss candidates were deferred
register-walled.

## (A) `<0x100` — 7 `.c`

- **Forwarder / guard predicates**: `022163f4` (021bb068 guard → 0220e650),
  `02238bc8` (021bb91c guard → 02211b64), `02229ca4` (021b3ecc guard →
  021e276c), `021ff320` (021b3ecc(bit0, field5) predicate — itself a band sink).
- **`ce950` flag-post family** (`(ce950.unk0 & 0x8000) ? 1 : 0` → helper →
  `0229ade0(0x24,…)` → clear `ce950.unk80C`): `021ca7f0` (post 9),
  `021d14e4` (021c9b80), `021cd4ac` (021b2d4c, **5 args** — m2c under-counted
  the stack-passed `unk6`; read the disasm for the real arity).

### Sub-recipe: the ce950 flag-post family

Uniform shape — `ldrh [ce950]; tst #0x8000; movne/moveq` for the flag, then
a helper(flag, ce950 fields…), `0229ade0(0x24,0,0,0)`, `str 0, [ce950+0x80C]`.
The flag is `(*(u16*)data_ov002_022ce950 & 0x8000) ? 1 : 0`; `ce950` is
`char[]` so field reads are `*(u16*)(ce950 + off)` (ldrh) and the +0x80C write
is `*(int*)(ce950 + 0x80C) = 0`.

## (B) `0x100-0x200` — 0 (not attempted)

Budget went to the thinning `<0x100` vein; the band remains `.s`-territory
(waves 13/14: composite reg-walls + dispatchers). No change to that verdict.

## Deferred this wave (register-numbering / addressing walls)

| func | wall |
|---|---|
| `021b9b64` | 3-way byte/word extract — temps colour into permuted regs |
| `02256108` | global-flag compare — value/global swap regs |
| `021d0f48` | RMW `ce950.unk810++` — reg-numbering + pool-vs-`#imm` addressing |
| `021d5d08` `021d5a6c` `021e2cd4` `021df62c` `021d8128` `021d8184` `0225a51c` | `021d479c` composite posts (packed payload / global value) — all reg-numbering or reschedule (prior-wave) |

Every one is byte-identical-from-C **except register numbering** — the exact
class the brief-294 verdict sends to ship-as-`.s`.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | objdump byte-identical (bl/pool modulo) |
| `tools/check_match_invariants.py` | 0 errors (4812 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 7 `.c`; EUR ov002 `delinks.txt` gains 7 `complete`
blocks. No header change this wave, no USA/JPN config change, no tool change.)

## Recommendation for the brain

1. **The ov002 `<0x100` clean-`.c` cohort is near-exhausted.** Yield fell 12 →
   7 this wave; the residue is register-numbering composites. **A
   register-rename `.s` hatch is now the gating tool** for further ov002
   progress — it would unlock this wave's ~10 deferrals *and* the band's
   reg-walled composites in one mechanism. This is the third wave (13/14/15)
   recommending it; it is now the bottleneck, not a nice-to-have.
2. **Consider pivoting the decomper to a fresher overlay** (the scaffolder is
   already on ov006) while the reg-rename hatch is built — ov002 `<0x100` no
   longer sustains a full 12-18/wave without it.
3. The `ce950` flag-post family + the 021b3ecc-guard forwarders are fully
   characterised here; any stragglers are a quick follow-up.

## Cross-references

- `docs/research/brief-301-coldre-wave14-reachable-drain.md` — the post/forwarder
  recipes + the register-rename-hatch recommendation this reaffirms.
- `docs/research/brief-294-*.md` — the ship-as-`.s` endgame for the reg-alloc
  wall (this wave's deferrals are that cohort).
