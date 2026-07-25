# Brief 680 — q-sm64ds-reingest: catalogue re-ingest + 5 residual ships

**Queue item:** `q-sm64ds-reingest` — "the external catalogue grew 100+
commits since our snapshot." r11's postwall report
(`docs/research/rnd-swarm-2026-07-24-r11-postwall.md`) is the source for
everything in this brief; every finding below traces back to one of its
sections.

## Scope note: this queue item overlapped a parallel agent's work

Before starting, discovered `docs/queue/codex-decomper.md` already carries
its OWN `q-sm64ds-reingest` item, completed 2026-07-23 by a separate
cooperating agent (`imported-sm64ds-r2.md`, a faithful transcription of
the peer's `notes/mwccarm-codegen.md`). r11's own report (one day later)
flagged that r2 was already stale the wrong way: the notes file it
transcribed hadn't moved, but the peer's commit stream had — 100+ new
commits carrying levers that live only in commit bodies, never folded
into the notes file. So this brief's re-ingest work (below) is genuinely
additive, not a duplicate: it changes the ingestion METHOD (commit/DB
mining, not notes-file diffing) rather than re-doing r2.

r11's report also contained two concrete, ready-to-execute INTERNAL leads
(not from the external catalogue at all) directly addressing 2 of this
queue item's named "3 open residuals." Those aren't literally the
re-ingest task, but they're squarely inside the item's own gate text
("verify the promising ones against our own matched corpus... with the
result") and were sitting unclaimed in the same source report that
spawned this whole 4-item queue — executing them was higher-value than
spending equivalent effort chasing external levers with no guaranteed
local match, so this brief did both.

## Part 1 — 5 residual ships (main, EUR + USA + JPN)

### C-23 TST-vs-ANDS routing fix (3 of 4 shipped)

r11 found that all 4 of brief-675's/676's TST-vs-ANDS-residual parks are
instances of the already-documented wall **C-23** (`docs/research/
codegen-walls.md`), whose fix — routing through `*.legacy.c` (mwcc
1.2/sp2p3) — none of the parking briefs had actually tried:

| Function | Prior state | Fix | Result |
|---|---|---|---|
| `func_0208be70` | 90.91%, brief 675 (hardware busy-wait poll, `TST` vs `ANDS` residual) | `.legacy.c` routing, same C brief 675 already had | **100%, fastmatch-verified** |
| `func_0207e6bc` | 33.3% before brief 675's own if/else-duplication fix got it to the same residual | `.legacy.c` routing + the duplicated-field-read shape (both branches re-read the same two fields, matching the original) | **100%, fastmatch-verified** |
| `func_0209aa48` | Parked, mis-cited as wall P-1 (see Part 3) | `.legacy.c` routing; `(x & 1) != 0` boolean-materialize is the same ANDS-dead-value shape as the wait-loop case | **100%, verified via full `ninja sha1`** (see tooling note below) |
| `func_0209d788` | Parked, mis-cited as wall P-1 (see Part 3) | `.legacy.c` routing recovered the LOGIC (int-not-unsigned-short local removes a spurious truncate the original doesn't have) but left a pure register-letter swap (`r1`↔`r2` on the address-holding vs. AND-test registers) that 4 source-shape variations (named/unnamed pointer, named/unnamed bit-test, declaration-order swaps) did not move | **NOT shipped** — parked with the exact word-level diff on file (see Part 4) |

### Byte-swap fix: `func_0206ea00`

r11's corpus-grep found the canonical byte-swap expression produces an
identical instruction schedule on both compiler tiers (two matched
counter-examples: `func_0206eb08.legacy.c`, `func_0203ed2c.c`), and the
parked function's own asm was already instruction-for-instruction that
schedule. Drafted per r11's exact recipe (nested-OR 32-bit half, natural
`unsigned short`→promoted-`int` typing for the u16 half so `>>` compiles
to the original's signed `asr` with no explicit casts needed) and routed
`.legacy.c` for its Style-A-like separate epilogue. **Verified via full
`ninja sha1`** (see tooling note below) — **shipped**.

### `func_0209cae4`: mis-parked epilogue case, not a "stack-layout mystery"

Brief 676 parked this as an unexplained `sub sp,#4` stack reservation
("the original reserves 4 bytes... this brief's model doesn't explain").
It's row 215 of `epilogue-wall-corpus.md`, already mechanically
pre-classified Style A → `.legacy.c` — the sweep loop that parked it never
consulted that corpus (r11's own methodology finding: "sweeps skip the
project's own signature indices"). A straightforward guard-flag +
field-init + 3-call sequence, **100% fastmatch on the first attempt**
once routed. **Shipped.**

### Tooling note: fastmatch.py has two gap-lookup gaps this brief hit and worked around

Both are genuine tool limitations, not correctness concerns — the full
`ninja sha1` gate is authoritative regardless and every ship above passed
it — but worth flagging for whoever next touches `tools/fastmatch.py`:

1. **No defining gap symbol for some isolated addresses.** `func_0209aa48`
   never appears as an `F .text`-typed symbol in ANY `_dsd_gap@main_*.o`
   chunk across a full fresh `ninja delink` — only as a weak `*UND*`
   reference (something else in a neighboring gap chunk calls it, but its
   own bytes never land in a chunk with a defining symbol). Root cause not
   chased further; worked around by gating the whole batch, then bisecting
   with real `ninja sha1` runs instead of per-function fastmatch.
2. **Spurious `bl`-target mismatch under the resolved comparison.**
   `func_0206ea00.legacy.c` reported 97.0% (1 word off, a `bl` instruction)
   even though `objdump -r` confirms both sides' `R_ARM_PC24` relocation
   correctly targets `func_0206c61c` by name. A full `ninja sha1` on that
   candidate alone passed clean. Not root-caused (likely something in the
   "fictional virtual address" assignment for this specific ambiguous
   case) — flagged, not fixed, out of scope here.

### Verification discipline note

Given both tool gaps above, every one of the 4 shipped functions was
confirmed via a REAL `ninja sha1` on the isolated candidate (or a bisected
subset) before commit, not just a fastmatch percentage — matching this
whole campaign's standing rule that fastmatch is a fast pre-check, `ninja
sha1` is the only gate that actually proves anything.

## Part 2 — Cross-region port (USA + JPN)

All 5 shipped EUR functions ported via `port_to_region.py`. 2 of 5
resolved at HIGH confidence directly; the other 3 (`func_0208be70`,
`func_0207e6bc`, `func_0209aa48`) are tiny leaf functions with almost no
relocations to fingerprint against, so `find_region_siblings` only reached
MEDIUM (auto-promoted from LOW by a 5-neighbor shift-consensus of `-0xe8`/
`-0xf4` — the known USA/JPN main drift band). Accepted at
`--confidence-floor MEDIUM` and, per the same discipline as Part 1, proved
by a real `ninja sha1` on each region rather than trusted from the
resolver's confidence label alone. Both USA and JPN gate green with all 5
ported.

## Part 3 — Wall taxonomy correction (found investigating Part 1)

Both `func_0209aa48` and `func_0209d788` were cited in `codegen-walls.md`'s
**P-1** ("shift-pair vs mask collapse") "Affected drops" list from brief
028. Neither's disassembly shows P-1's `lsl K; lsr K` shift-pair pattern
at all — both are `ands`-then-conditional-overwrite shapes, a completely
different mechanism. Both `.s` files already carried a header comment from
brief 655 saying the citation had been removed ("no duplicate-address
evidence... never assessed as a C-match target") — that correction was
never synced into `codegen-walls.md`'s own prose. Fixed: removed both from
the Affected-drops list, corrected the "real remaining P-1 count" from
10/69 to 8/69 (it had already been corrected once before, from 17/69, for
an unrelated set of 7 addresses — see the brief-596 note in the same
entry), and left a pointer explaining why for whoever reads this wall
entry next.

## Part 4 — sm64ds catalogue re-ingest r3 (the literal queue ask)

Full writeup: `docs/research/reshape-recipes/imported-sm64ds-r3.md`.
Summary:

- **Method changed, not just content.** r2 transcribed the peer's notes
  file faithfully; that file has been frozen at 1,465 lines since, while
  147 commits landed in the peer repo in the same window (confirmed via
  `gh api .../commits?since=...`, 2 pages). This ingest mines the commit
  stream and the peer's own new `nearmiss/db.jsonl` (683 structured
  near-miss rows, ~3MB) directly instead.
- **Second, stronger negative-result confirmation.** Queried the 683-row
  structured DB for our 3 open residuals (TST-vs-ANDS, byte-swap,
  4-register argument-spill/`stmdb sp!,{r0,r1,r2,r3}` home-area): **0
  hits on all three**, independently reconfirming r11's earlier
  notes-file grep on a richer, more current source. Two of the three
  residuals got real progress anyway — from OUR OWN corpus (Part 1's
  C-23 fix, byte-swap fix), not the external catalogue. Nothing new for
  the 4-register-spill residual this pass (r11's own report already has
  the most promising internal lead there — the `func_020b0034`
  double-return dword-family model — not attempted this brief; flagged
  for a future item since it's a 40-function cluster, not a quick add-on).
- **A methodology caution worth banking.** The peer project retracted 116
  + 9 previously-"matched" functions on 2026-07-24 (commits `fcdfc66d5`,
  `99f568ea2`) after recognizing they were byte-exact only via
  hand-written assembly, not real C — the same principle this project
  already follows. Any pre-2026-07-24 "N% matched" claim from that source
  (including our own brief-524 import note) is now an overstatement by an
  unknown margin. Doesn't affect our own gating; worth remembering before
  trusting a headline number from any external decomp project again.
- 14 new register-coloring/scheduling levers transcribed from the peer's
  "refine fan-out" commit series, all marked UNVERIFIED-ON-2.0 per project
  convention, none tried against our own corpus this pass (time went to
  the higher-confidence internal leads instead).

## Gate

- `python -m pytest -q tests`: 2912 passed, 13 skipped, 2 failed (both
  pre-existing `test_m2c_feed.py` failures, a missing `gcc` on this
  machine's `PATH` — unrelated to this brief).
- 4 of 5 residual functions ships fastmatch/`ninja sha1`-verified (Part
  1); 1 parked with its exact residual diff on file (Part 4 of the
  must-have table above — `func_0209d788`).
- All 5 ported to USA + JPN, each region's `ninja sha1` green.
- `python tools/gate3.py --scope all --no-tests`: 3-region PASS.
- `imported-sm64ds-r3.md`: written, cites sources, marks every new lever
  UNVERIFIED-ON-2.0, explicit "nothing new" for all 3 residuals with the
  query method shown.
- `codegen-walls.md`: P-1 citation corrected.
