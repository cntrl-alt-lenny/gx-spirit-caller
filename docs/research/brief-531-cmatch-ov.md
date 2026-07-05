# Brief 531 — overlay dispatch-table sibling sweep

Date: 2026-07-04
Branch: `claude/cmatch-ov-531`
PR: https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1100

## Scope

Brief 529 matched `func_ov001_021ca2f8` and `func_ov018_021ace14`, both
instances of an audio-dispatch-table-advance idiom already catalogued as
**Pattern A1** in
[`docs/research/data/VtableDispatchPatterns.md`](data/VtableDispatchPatterns.md)
(GlobalAudioState `+0xb6c` cursor, table-indexed `blx`). Rather than
picking fresh candidates from the safe-queue one at a time, this brief
mined that catalogue directly for every other listed instance of the same
family — Pattern A1 (10 overlays) and its offset-`+0x0` sibling **Pattern
A2** (8 overlays) — and drained the entire list.

As with brief 529, `tools/containment_check.py` was **not used** (main-ARM9
only, false-positives on overlays). Every containment verdict is a manual
byte diff: `extract/eur/arm9_overlays/ovNNN.bin` vs
`build/eur/build/arm9_ovNNN.bin`, translated via that overlay's own
`OVNNN_TEXT_START` from `build/eur/arm9.o.xMAP`.

## Summary

| Metric | Count |
|---|---:|
| candidates attempted | 18 |
| EUR matches accepted | 16 |
| USA ports accepted | 16 |
| JPN ports accepted | 16 |
| candidates skipped without attempting (risk) | 2 (both ov002) |
| reg-alloc-scale near-misses on first try (fixed, not parked) | 1 |

Every accepted match ported clean to USA+JPN at HIGH/EXACT confidence and
gated `ninja sha1` OK for all three regions, checked after every batch.

## Candidates

### Pattern A1 (`GlobalAudioState.fb6c`, offset `+0xb6c`) — 8 attempted, 8 matched

| Overlay | Function | Size | Result |
|---|---|---:|---|
| ov012 | `func_ov012_021cc01c` | 80B | MATCHED, byte-exact 1st try |
| ov013 | `func_ov013_021cb700` | 80B | MATCHED, byte-exact 1st try |
| ov015 | `func_ov015_021b5a14` | 80B | MATCHED, byte-exact 1st try |
| ov020 | `func_ov020_021ada1c` | 80B | MATCHED, byte-exact 1st try |
| ov011 | `func_ov011_021d0afc` | 80B | MATCHED, byte-exact 1st try |
| ov011 | `func_ov011_021d0b4c` | 100B | MATCHED, byte-exact 1st try (flag-set variant, see below) |
| ov008 | `func_ov008_021aafa4` | 100B | MATCHED, byte-exact 1st try (secondary-field-clear variant) |
| ov004 | `func_ov004_021cb518` | 80B | MATCHED, byte-exact 1st try (see collision note below) |

### Pattern A2 (per-overlay local state, offset `+0x0`) — 8 attempted, 7 matched, 1 skipped

| Overlay | Function | Size | Result |
|---|---|---:|---|
| ov009 | `func_ov009_021ad7d4` | 88B | MATCHED, byte-exact 1st try |
| ov014 | `func_ov014_021b26ec` | 88B | MATCHED, byte-exact 1st try |
| ov016 | `func_ov016_021b2824` | 88B | MATCHED, byte-exact 1st try |
| ov017 | `func_ov017_021b2c8c` | 88B | MATCHED, byte-exact 1st try |
| ov019 | `func_ov019_021b26d0` | 88B | MATCHED, byte-exact 1st try |
| ov023 | `func_ov023_021b2314` | 88B | MATCHED, byte-exact 1st try |
| ov005 | `func_ov005_021acfb0` | 104B | MATCHED, byte-exact 1st try (state-reset-on-miss variant) |
| ov021 | `func_ov021_021aa4a0` | 116B | MATCHED after 1 fix — inverted branch condition, see below |

### ov002 (Pattern A3) — skipped, not attempted

`func_ov002_021b08a8` (136B) and `func_ov002_021b0a30` (220B) are the two
remaining Pattern-A3 instances in ov002. Both are structurally far more
complex than the A1/A2 idiom — multi-branch guard chains with additional
helper calls and, for `021b0a30`, a completely different conditional-multiply
miss-path — not simple copies of a proven template. Given brief 529's
finding that ov002 needs byte-perfect-or-nothing treatment (a non-exact
first attempt risks a 300KB+ scattered avalanche tied to the documented W7
mwldarm veneer-collision bug), and that neither of these has an
already-matched byte-identical sibling to copy from, both were skipped
without spending build time on them. Flagging for a future wave with a
larger time budget for careful reshaping.

## Notable variants beyond the base idiom

The base idiom (`fn = table[state]; if (fn) { if (fn()) state++; return 0; } return 1;`)
recurs with small, mechanical deltas per overlay:

- **ov008**: on advance, also zeroes two secondary `u16` fields in a
  different struct (`data_ov008_021b2780`) before incrementing the cursor.
- **ov005**: on a *miss* (no handler installed), fully resets its 4-word
  state struct (`idx=0, f8=0, fc=0`) instead of the base idiom's plain
  `return 1`.
- **ov011** (`021d0b4c`): sets a flag bit
  (`data_ov011_021d4000+0x2bc |= 0x400000`) unconditionally before every
  dispatch — ov011's *other* entry (`021d0afc`) is the plain base idiom.
- **ov021**: the most divergent — on a miss, falls back to a
  `GlobalAudioState.f24` gate that either returns 1 or fires a one-shot
  `func_020071a4(9, -1, &data_ov021_021ad7d4)` notify. This is the only
  candidate this wave that didn't match byte-exact on the first attempt.

## ov021 — the one near-miss, root-caused and fixed (not parked)

First attempt diffed 2 bytes, both inside the candidate's own range (fully
contained, no cascade). A `capstone` instruction-level diff pinpointed the
exact mismatch: `movne r0,#1 / popne` (built) vs `moveq r0,#1 / popeq`
(orig) at one branch. I had written `if (f24 != 0) return 1;` when the
assembly's `cmp r0,#0; moveq r0,#1` actually means "if `f24 == 0`, return
1" — an inverted condition, not a register-allocation issue. Flipping
`!=` to `==` produced a byte-exact match immediately. Documenting this
distinctly from brief 529's reg-alloc near-misses (`021ac91c`, `021b7a20`,
still parked) since this was a straightforward logic bug, not a scheduling
wall — worth the one fix rather than parking.

## ov004 — collision-adjacent overlay, confirmed safe

ov004 is the **sink** overlay in the documented W7 mwldarm veneer bug
(`docs/research/ov004-thunk-section-fix.md`): its `.rodata` pointers
collide with ov002's `.text` addresses, not the other way around. Matching
a function *in* ov004 itself doesn't touch that collision mechanism (which
keys off ov002 `FUNC` symbols at addresses ov004's *data* points to, not
ov004's own code) — confirmed empirically here: byte-exact, 0 diff bytes,
whole-overlay, no cascade. This is a useful data point for future waves:
**ov004-as-source-of-a-match is safe; ov002-as-source is the risky one.**

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Verified with all 16 matches applied, all three regions, immediately
before writing this report.

## Remaining runway

- The 2 skipped ov002 Pattern-A3 candidates (`021b08a8`, `021b0a30`) —
  worth a dedicated wave with a larger time budget for careful reshaping,
  or once a proven byte-exact sibling exists to copy from.
- Brief 529's queue remainder (non-dispatch-table candidates, EUR ranks
  88-248) is untouched by this brief and still open: `021b08a8` `021b9830`
  `021d1f04` `021b3a78` `021ac098`(ov000, calls confirmed-wall `021abe64`
  as dependency but isn't itself walled) `0228791c` `021ae218`(ov000,
  complete sketch available, 6-branch guard chain) `021b2e04` `021b3e14`
  `021ca70c` `021ae2cc` `021b7db0` `021cca04` `021c1954` `021b0a30`
  `021b6e3c` `021c2c54` `021d1974` `021bbda8` `021b33dc` `021bd85c`
  `021c4bd4` `021abcc4` `021b29c0` `021b3864` `021d3a7c`.
- Brief 529's two parked reg-alloc near-misses (`021ac91c` ov005,
  `021b7a20` ov006 — unrelated to this brief's dispatch-table work) are
  still open and still candidates for a future permuter pass.
- The brief's suggestion to hunt for *other* reusable shapes (e.g. real
  `switch`/jump-table dispatchers, as opposed to this fn-ptr-table idiom)
  wasn't pursued this wave given the strong yield already in hand from the
  known catalogue — worth a dedicated search in a future brief.
