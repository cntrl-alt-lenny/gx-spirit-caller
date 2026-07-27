# cm-data-inference-9 — data wave 9

2026-07-27. Continues the opaque-blob data-retyping campaign with the
same method: parallel read-only `Explore` agents, exhaustive symbol-grep
+ `relocs.txt` address cross-check, classify fixed-offset (WEAK) vs
computed-stride (STRONG), never force a type onto insufficient evidence,
implement centrally afterward.

No specific carried-over lead this time — both of wave 8's CONTRADICTIONs
were resolved in-wave rather than deferred. Live census re-run fresh
(`grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\]
= \{" src/main/*.c src/overlay*/*.c`): **45** opaque blobs remained at
this wave's start, not trusted from any prior estimate. 15 investigations
dispatched, spread across `main` and 7 overlays (2 of them, ov014 and
ov020, untouched by this campaign before).

## Results

| Symbol | Outcome | Evidence |
|---|---|---|
| `data_020be6c4` | no change (reconfirms wave 4 STRONG) | already correctly typed `unsigned char[88]`; `ldrb` register-offset access proves 1-byte stride, count is boundary-proven |
| `data_020b4b1c` | no change (reconfirms wave 3 → wave 5 WEAK, 3rd time) | genuinely variable-length length-prefixed record chain — no uniform stride exists, independently re-simulated byte-for-byte |
| `data_020be754` | no change (reconfirms wave 4 WEAK) | one-hop-removed bulk copy only; surfaced an unrelated real bug (see below) |
| `data_020b4a2c` | no change (already shipped wave 5) | census false-positive — file also contains an unrelated, already-correctly-declined sibling symbol in the same TU |
| `data_020bebbc` | no change (reconfirms wave 4 WEAK) | pure mutable strcpy/strcat scratch buffer, no record structure (1 of a 3-buffer cluster) |
| `data_020beb8c` | no change (reconfirms wave 4 WEAK) | same 3-buffer cluster, 2nd member confirmed |
| `data_020b59a0` | no change (reconfirms wave 4, reclassified WEAK not CONTRADICTION) | runtime-variable index but no loop bound/mask proves the count; USA/JPN cross-region check newly added, fully agrees with EUR |
| `data_ov010_021b8870` | no change (reconfirms wave 5 WEAK) | full 22/22-halfword coverage (corrects wave 5's "20/22") but every access is compiler-unrolled fixed-offset, not blob-level computed-stride |
| `data_ov002_022ca390` | **shipped** — `const unsigned int[2]` | 4 static access sites across 3 independent consumers, boolean-selector-indexed (word stride); cross-region CONTRADICTION with USA/JPN resolved the same way as wave 8's `022ca370` (byte-safe regardless, divergence documented) |
| `data_ov017_021b7f3c` | **shipped** — `const int[8]` | byte-identical to wave-8's `data_ov003_021cf0f4`; `&0x7`-masked runtime index hard-proves 8 elements |
| `data_ov014_021b4bf8` | **shipped** — dual-purpose struct | ov014's first touch; 8-byte sprintf format string + 4×u16 RGB555 blend ramp, two independent non-overlapping consumers |
| `data_ov020_021addd0` | **shipped** — `int[2]` | ov020's first touch; loop-hardcoded `cmp r8/sl,#0x2` bound in 2 independent consumers, cross-region identical |
| `data_ov006_021cc078` + 3 siblings | **shipped** — `{short x,y}[5]` × 4 files | `021cc03c`/`021cc050`/`021cc064`/`021cc078` are one family, selected by the same `self->f40` dispatch in 2 consumers; loop-bound-proven 5-element/4-byte-stride access; 3 siblings shipped as a bonus from the same evidence |
| `data_ov005_021b1568` | **shipped** — mixed-evidence struct | RGB555 gradient (STRONG, loop-bound-proven) + rect w/h (WEAK but ground-truthed via an already-matched consumer) + 6 genuinely opaque tail bytes |
| `data_020b46b8` | **CONTRADICTION, deferred** | see below |

## `data_020b46b8`: a genuine cross-region content divergence, deferred

EUR's declared 40-byte opaque blob is correctly typed as-is (pure
0x00/0x01 flags, no consumer found in 3 prior investigation attempts
across waves 5 and 9). But USA/JPN's own independently-derived symbol
tables show the *same address* spans **174 bytes**, not 40 — and a real
consumer exists there (`func_0200a180.s`, present in the tree since
before wave 5's "no consumer" finding, missed by that investigation):
an unconditional loop reads all 174 bytes into a stack buffer, then
indexes it via a runtime-computed value fed by a *different* function
than the EUR-namesake of the same address (`func_020191dc` is a 4-bit
nibble extractor in EUR but an ASCII-range classifier with outputs into
the 80s in USA/JPN — an address-based naming collision, not the same
logical function). Verified directly against raw ROM bytes
(`extract/{eur,usa,jpn}/arm9/arm9.bin`): EUR's 40 bytes are followed by
three other already-typed, unrelated objects; USA/JPN's 174 bytes are one
coherent sparse `unsigned short[87]` lookup table, internally
corroborated by the classifier's own range-adjust logic landing exactly
on a 7-element ascending run at the predicted offset.

This is not implemented this wave: it requires **new** USA/JPN-only
region-override files (`src/usa/main/data_020b46b8.c`,
`src/jpn/main/data_020b46b8.c`) rather than a byte-preserving retype, and
the investigating agent flagged an open build-scoping question (an
unprefixed EUR-only definition feeding a non-EUR-only consumer) that it
could not verify read-only. This wave's own `gate3.py --scope all` run
confirms USA and JPN currently build byte-identical with **no** such file
present — dsd's gap-filler is already correctly supplying the original
bytes for this still-unclaimed range, so there is no live build risk
today, only a documentation/matching opportunity for a future,
dedicated USA/JPN item. Per this project's own EUR-first phased strategy,
not chased further this wave.

## Aside: an unrelated bug found and flagged separately

While investigating `data_020be754`, the agent found that
`src/main/func_02026f78.c`'s declared signature (`int
func_02026f78(int *arg)`, 1 parameter) no longer matches how its sole
caller `src/main/func_02024430.c:62` invokes it (`func_02026f78(&localbuf,
0, 0x80, 5)`, 4 arguments) — a leftover inconsistency from the caller
being re-audited in a later, unrelated pass without the callee being
reconciled. Out of scope for the data-blob campaign; spawned as a
separate background task rather than fixed inline.

## Gate

`ninja` (EUR) passed SHA-1 clean on the first rebuild after all 9
implemented files — zero `.data`/`.rodata` link-warning class of failure
(expected: none of this wave's shipped files touch pointer fields, so
the wave-7 const-placement rules weren't exercised). Full
`python tools/gate3.py --scope all` (3-region SHA-1 + pytest) run to
confirm USA/JPN and the test suite.

## Hit rate

6 of 15 fresh census investigations shipped directly (40%), yielding 9
actual files with the 3-sibling bonus from the `021cc078` family. 8 of
15 were solid reconfirmations of prior-wave declines or already-shipped
symbols (not fresh misses — real, useful work that prevents a future
wave from re-investigating the same ground, and one of them corrected
a wave-5 investigation's undercounted coverage figure). 1 CONTRADICTION
investigated to a real, well-understood resolution and explicitly
deferred rather than forced or discarded. This is well below wave 8's
100% outlier and roughly in the range this campaign's queue entry
predicted going in — the census methodology's inherent limitation
(grep can't distinguish "never investigated" from "investigated and
correctly left opaque") means a meaningful fraction of any fresh batch
will land on already-settled ground, especially this deep into the
campaign.
