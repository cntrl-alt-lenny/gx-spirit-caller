[//]: # (markdownlint-disable MD013 MD041)

# Safe Queue v4 — re-verified after the `containment_check.py` module-awareness fix

**Status:** brief 534 (2026-07-06). Re-verifies
[`safe-queue-v3.md`](safe-queue-v3.md)'s 107 `carried` (never-attempted-as-
of-v3) rows against the CURRENT repo state, using the now-fixed
`tools/containment_check.py` (see [Part 1](#part-1--the-tool-fix) below).
This is **not** a new ranking — v3's scoring methodology is untouched — it
is a bookkeeping re-audit that answers one question: *of the 107 rows v3
called "still to attempt," how many actually still are?*

**Headline answer: 8.** The other 99 have already been resolved by
intervening c-match waves (briefs 516–533) that v3's own "carried" label
never got updated to reflect. This is not a new negative result — it
confirms, with row-level evidence instead of a general impression, the
[LANE STATE](../../../AGENTS.md)'s own assessment that the easy c-match
tier is drained.

## Part 1 — the tool fix

`tools/containment_check.py` compares a candidate's built binary against
its baseline to classify a mismatch as CONTAINED (worth continued C-shape
iteration) or AVALANCHE (park it) — see brief 514. It had two compounding
gaps, both closed this brief:

1. **No module awareness.** The tool defaulted `--built`/`--extract` to
   `build/<region>/build/arm9.bin` / `extract/<region>/arm9/arm9.bin` —
   **main's** binaries — and hardcoded the VA base to `0x02000000`,
   regardless of which module a candidate actually belonged to. An overlay
   candidate's compiled bytes never touch main's ARM9 image at all (they
   land in a separate, independently-linked overlay binary); a caller who
   forgot to manually pass overlay-scoped `--built`/`--extract` silently
   diffed the wrong, always-clean pair and got a rubber-stamp CONTAINED
   that said nothing real. **This is directly documented as having
   happened**, not just theorized: brief 518's own dossier table for
   `021e2e18` (ov002) reads verbatim: *"Official `tools/
   containment_check.py` reported zero main-ARM9 diff, but the overlay
   fallback found **805,331** diff bytes / **96,133** runs in
   `arm9_ov002.bin`."* Brief 533 independently names the same gap as "the
   manual overlay-diff dance." Brief 525 hit it on 3 separate candidates
   in one wave.
2. **Truncated diff walk.** The byte-level diff only ever compared the two
   files' common prefix (`min(len(a), len(b))`), so a size mismatch past
   that point was invisible to it — masked in practice by an independent
   full-length size check elsewhere in the same function, but not
   structurally guaranteed, and not something the old code made obvious
   or testable in isolation.

**Fix:** the candidate's module (`main`, `ovNNN`, `itcm`, `dtcm`) is now
resolved *before* any default path or VA base is chosen — from
`--candidate`'s path, `--addr`'s matched delinks.txt entry, or (new)
`--range`'s own address-containment lookup — mirroring
`tools/predict_walls.py`'s existing per-module VA-base pattern rather than
inventing a new convention. The full-length size check is now its own
named, independently-tested function (`_size_mismatch`) that runs before
the truncated walk and forces AVALANCHE on any mismatch regardless of what
the walk finds. 29 new tests in `tests/test_containment_check.py` cover
both fixes, including a direct reproduction of the brief-518 failure
shape (an overlay candidate whose auto-selected main-binary default would
read CONTAINED while its real, module-correct overlay pair avalanches).

## Part 2 — re-verifying the 107 carried rows

Method (read-only — no delinks.txt edits, no C drafts, no match/ship this
wave, per brief 534's collision-free constraint):

1. Parsed all 107 `status: carried` rows out of `safe-queue-v3.md`.
2. Resolved each address's CURRENT state via the fixed tool's own
   module-aware lookup (`--module` taken from the row's own `module`
   column to resolve the 26 that are ambiguous by bare address alone),
   checking **actual file existence** rather than trusting delinks.txt's
   declared extension — see the stale-delinks finding below, which is
   exactly why file existence, not delinks.txt text, has to be the
   authoritative signal.
3. Cross-referenced every still-`.s` address against all `brief-5*.md`
   docs (word-boundary-safe address matching, so `021e2e18` doesn't
   spuriously match inside a longer hex string) to distinguish "never
   touched" from "already attempted and reverted, so still `.s`, but with
   a real recorded outcome" — the same distinction brief 523 had to make
   by hand for its own queue rows.

### Results

| Bucket | Count | Meaning |
|---|---:|---|
| Already MATCHED (now `.c`) | 33 | Resolved by briefs 516–533; v3's "carried" label is stale for these. |
| Attempted, real outcome on record | 66 | Still `.s` (park reverts the source), but a brief-5xx doc shows a genuine build attempt with technical detail (diff-byte counts, register/scheduling analysis, or an explicit confirmed-wall dependency) — not tractable, just not yet reflected in the queue's own bookkeeping. |
| **Genuinely never attempted** | **8** | No match, no recorded attempt, no confirmed-wall citation anywhere in briefs 500–533. |
| **Total** | **107** | |

The 66 "attempted" rows split roughly 75%/25% main/overlay — consistent
with brief 532 (11 main attempts, 9 avalanche) and brief 527's table
(main MED-tier walls with named register/scheduling causes) accounting
for most of the main-side volume, and brief 529/531's ov002/ov000/ov006
sweeps accounting for the overlay side.

### The 8 genuinely open rows

| addr | module | size | tier | predicted-contained? | fixed-tool self-check |
|---|---|---:|---|---|---|
| `0228791c` | ov002 | 176 | RETRIAGE | YES (high) | module=ov002, CONTAINED (0 delta) |
| `0225368c` | ov002 | 92 | RETRIAGE | YES (med) | module=ov002, CONTAINED (0 delta) |
| `020384e8` | main | 172 | MED | LIKELY | module=main, CONTAINED (0 delta) |
| `021ae218` | ov000 | 180 | RETRIAGE | LIKELY | module=ov000 (disambiguated — see below), CONTAINED (0 delta) |
| `021ae2cc` | ov000 | 200 | RETRIAGE | LIKELY | module=ov000 (disambiguated), CONTAINED (0 delta) |
| `021b0a30` | ov002 | 220 | RETRIAGE | LIKELY | module=ov002 (disambiguated), CONTAINED (0 delta) |
| `021ca70c` | ov013 | 192 | RETRIAGE | LIKELY | module=ov013 (disambiguated), CONTAINED (0 delta) |
| `021cca04` | ov011 | 212 | RETRIAGE | LIKELY | module=ov011 (disambiguated), CONTAINED (0 delta) |

"Fixed-tool self-check" = `containment_check.py eur --addr <addr>
[--module <m>]` run against each candidate's own **unmodified** `.s` —
this can't tell you whether a *future* C draft will be contained (that
needs an actual draft, which is real matching work, out of scope this
wave), but it does two useful, zero-risk things: (a) confirms the row's
address/size **metadata is still accurate** against live delinks.txt (no
drift since v3 was written), and (b) exercises the fix for real across a
diverse module sample (main + 4 different overlays). 5 of the 8 needed
`--module` to disambiguate — their bare address falls inside multiple
overlays' reused RAM windows, exactly the everyday case the fix and its
tests target.

**Read "CONTAINED" in that last column as "the tool works and the
metadata checks out," not "this candidate will match."** A real verdict
on any of these 8 requires an actual C draft — the next tractability
signal is the `predicted-contained?` score already in the table, same as
v3.

### A byproduct finding — stale delinks.txt extensions (not fixed here, flagged for the brain)

Cross-referencing surfaced 6 EUR `main` delinks.txt lines that still
declare a `.s` file that no longer exists — the matching `.c` exists and
is tracked (from briefs 528/530's card-ID-switch and jump-table matches),
but delinks.txt's own text was never updated, most likely lost in the
"Brain (Mac): reconcile PC arc (528-533)" multi-branch merge:

```
0200c078, 0200c284, 02030b84, 02031208, 02031684, 02031c8c
```

**This does not break the build** — `tools/configure.py`'s `add_mwasm_
builds`/C equivalent discover source files by globbing the filesystem,
not by trusting delinks.txt's declared filename — confirmed by
successfully compiling `func_02030b84.c` in this exact state. It's a
pure documentation staleness. But it DID cause this brief's first pass at
cross-referencing (before switching to a file-existence check) to
misclassify these 4 of the 6 as still-open when they're actually matched
— the same class of "trust delinks.txt's text over reality" mistake this
whole brief exists to stop making elsewhere. Worth a cheap follow-up:
`grep` every region's delinks.txt for a declared `.s`/`.c` whose file
doesn't exist and fix the text to match — outside this brief's scope
(no delinks edits, collision-free).

## Bottom line for the next wave

**Don't grind the rest of v3's queue — 92% of it (99/107) is already
spoken for.** The 8 rows above are the only ones where a real attempt has
never been made and never been recorded; they're a plausible next pick
(all pre-scored YES/LIKELY, sizes 92–220B, metadata freshly confirmed),
but 8 candidates is not a queue, it's an afternoon. Combined with brief
532/533's own direct-attempt negative results, this is consistent
evidence — not just repeated assertion — that the easy c-match tier is at
its natural tail. The decision for the next round is the one the LANE
STATE header already named: push into the permuter-class register-swap
residue (`021ac91c` ov005 — brief 525's remaining near-miss after
`021b79ac` itself matched in [PR #1095](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1095);
`0200dd58` main — brief 533's B2) and large bespoke RE (Pattern B3/B5,
`021b2924`), or call EUR≈99% / USA-JPN≈49%-code a stopping point for this
campaign phase.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
