# Brief 676 — size-filtered small sweep, upper range 0x02040000+ (queue item cm-small-resweep-upper)

**Result: 3 ships, 3-region (`gate3.py --scope all --no-tests` PASS: EUR,
USA, JPN), each individually fastmatch-verified at 100% before the
aggregate `batch_sha1.py` gate.** One region-specific struct-offset
porting bug caught and fixed before it shipped wrong.

## Scope

The companion half of a size-filtered small-function re-sweep (the
other half, the lower address range, is Scaffolder's). Filter:
`--max-size 256 --min-addr 0x02040000`. The ≤128B slice of this range
overlaps heavily with brief 675's just-completed `cm-main-128-drain`
sweep (including several of that brief's own parked near-misses, which
still show up as "unknown" since a parked attempt isn't recorded to
`attempts.tsv`) — the genuinely new territory here is the 129–256B
tier: 528 fresh candidates in `main` after filtering.

## Ships (3)

- **`func_02061f20`** — seven `if (field) helper(field);` guarded calls
  in a row (two different helper functions across seven struct
  offsets), then one final unconditional call. Purely mechanical,
  first-pass 100%.
- **`func_0204c384`** — a loop calling a validation helper per array
  element, checking a global getter's re-read result (not cached) both
  before and inside the loop on every iteration — the established
  "reload via a fresh call, don't cache in a local" pattern applies
  here too, just via a function call rather than a pointer deref.
  First-pass 100% for EUR; **the USA/JPN ports needed a fix** — see
  below.
- **`func_020aabac`** — a 3-way `switch` implementing what looks like a
  classic `getc`/`ungetc`/peek character-stream API (case 0: read a
  byte, advance a cursor, or set an EOF flag; case 1: clear the EOF
  flag or back up the cursor; case 2: return the flag). First attempt
  was 63.64% with `case 1`'s if/else predicated instead of a real
  branch; swapping which branch of the `if`/`else` came first (test
  `== 0` and put the decrement branch first, rather than testing
  `!= 0` with the clear-flag branch first) flipped it to a real branch
  and reached 100%. Same predication-vs-branch sensitivity as brief
  675's early-return findings, just manifesting as a straight `if/else`
  rather than a chain of early returns.

## Porting bug caught before shipping wrong (region-specific struct offset)

`func_0204c384`'s port to both USA and JPN initially landed at 88.24%
in each region — NOT the "everything or nothing" signal a genuine
porting collision or infrastructure problem gives (see brief 675's
process-lesson section), but a clean, small, consistent 4-word diff.
Decoding it: EUR reads a global-state struct's fields at offsets
`0x1a6`/`0x1a0`; USA and JPN read the *same* fields at `0x19e`/`0x198`
— an 8-byte-earlier layout in both non-EUR regions (identical shift in
both, confirmed independently by testing each region separately).
`port_to_region.py` correctly renamed the two called-function symbols
(`func_020498f0`→`func_0204987c`, `func_0204b280`→`func_0204b20c`) but,
per its own documented scope, does not rewrite raw hex struct-literal
offsets embedded in hand-written C — this is exactly the region-
specific-struct-offset class of porting bug brief 673 first identified,
just recurring on fresh material. Fixed by hand for both regions
(same replacement in both, since USA and JPN share this struct layout);
each port re-verified individually at 100% before re-gating.

## Process note: individual per-port verification (not just the aggregate gate) is what caught this

The initial USA aggregate `batch_sha1.py` call reported "0 confirmed, 3
culprit(s)" for all three candidates at once — on its own, indistinguishable
from the all-or-nothing false-negative pattern brief 675 diagnosed (bisection
can't isolate anything once a candidate's `.s` sibling is gone). The
difference this time: the working tree was verified clean first (no
stray contamination, matching brief 675's fix), so a genuine failure
really was in this batch — the bisection just couldn't say *which*
candidate. Individually testing each port (restore `.s`, move the
draft aside, single-candidate `fastmatch` via the same diagnostic
script from brief 675, one region at a time) isolated it immediately:
2 of 3 were already correct, 1 had the offset bug. This is now the
established per-region verification step for every future port,
regardless of what the aggregate gate reports — the aggregate gate
tells you pass/fail for the *batch*, never which specific port is
wrong.

## Remaining near-misses (parked, not shipped)

Checked 8 more candidates this brief; none reached 100% in the time
available:

- **`func_02054ec0`** / **`func_0206ea00`** — both classic 32-bit
  byte-swap (endian-reversal) idioms. The *values* match (verified by
  hand-tracing the shift/mask sequence), but mwcc's specific
  instruction ordering for an unrolled byte-swap proved resistant to
  the single big nested-OR expression tried; a genuinely different
  attempt (matching the original's exact per-term evaluation order)
  wasn't tried this brief given time constraints.
- **`func_0209cae4`** — a global-init-once guard; the original reserves
  4 bytes of stack (`sub sp,sp,#4`) that this brief's model doesn't
  explain (the function takes no visible parameters and has no
  apparent local needing a stack slot) — flagged as needing a closer
  read rather than continued guessing.
- **`func_0207c4ec`** (3.03%), **`func_02041e18`** (44.12%),
  **`func_02052c58`** (not yet re-tested after drafting),
  **`func_02052f04`** (not yet re-tested after drafting) — moderate-to-high
  complexity multi-call sequences; drafted but not converged.

829 candidates remain in the ≤128B tier already covered by brief 675
(mostly the same parked near-misses) and ~520 remain in the 129-256B
tier alone; this brief drained only a small sample given time
constraints. A future round should continue from
`upper_129_256.txt`-style candidate ordering (129B+ first, since the
≤128B tier is comparatively drained) rather than re-reading from
scratch.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean (81
delinks.txt, no duplicate `.text` addresses).
