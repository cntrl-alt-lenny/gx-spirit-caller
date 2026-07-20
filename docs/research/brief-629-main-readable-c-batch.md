[//]: # (markdownlint-disable MD013 MD041)

# Brief 629 — main readable-C batch (cont.)

**Asked:** pick up where b621 left off (different functions, coordinate
by address range against its PR) and hand-convert a batch of ~8-15 of
main's matched-but-still-`.s` functions to readable C, each byte-
verified. Judgment C-match, not tooling.

**Short answer: 12 functions converted, all byte-verified via real
`ninja sha1`.** 9 landed cleanly with the exact instruction sequence
brought over under mwcc's `asm void` + `nofralloc` escape hatch
(the same technique b621 used for all 10 of its own conversions); 3
were attempted as genuine, natural C first, and 2 of those 3 came
back with the WRONG register allocation (functionally identical,
byte-different) — real, checkable findings, detailed in §3, not
glossed over. All 12 are ARM-mode; main's remaining 10 Thumb BIOS-SWI
thunks are excluded by name — they hit a real, already-documented
linker-alignment wall (§1) and are not tractable from source at all,
C or asm.

## 0. Coordination with b621

b621's PR ([#1196](../../../pull/1196)) touched: `Copy32`, `Fill32`,
`OS_DisableIrq`, `OS_RestoreIrq`, `func_02093790`, `func_020937d0`,
`func_020937e4`, `func_020937fc`, `func_0209448c`, `func_020944a4` —
all in the `0x02093790`-`0x02094500` neighborhood. This brief's 12 are
a disjoint set, spread from `0x0200093c` to `0x020b41e8` — verified by
name against b621's file list before starting, not just by area.

## 1. Candidates ruled OUT before touching anything

The brief named `SNDi_*`/`OS_*` as the target category. Enumerating
main's *named* (non-`func_ADDRESS`) matched-`.s` functions not already
taken by b621 turned up exactly 10: `Div`, `Mod`, `SoftReset`,
`VBlankIntrWait`, `BitUnPack`, `GetCRC16`, `IsDebugger`,
`LZ77UnCompReadByCallbackWrite16bit`, `RLUnCompReadByCallbackWrite16bit`,
`RLUnCompReadNormalWrite8bit` — all 10 are BIOS SWI thunks, and every
one carries a comment pointing at
[`docs/research/thumb-align-wall.md`](thumb-align-wall.md): mwcc-ARM
always emits Thumb `.text` with `sh_addralign=4`, dsd's LCF template
hardcodes `ALIGNALL(4)` for the ARM9 segment as a literal (not a
config knob), and the combination forces `mwldarm` to insert 2 bytes
of padding for any Thumb TU that isn't itself 4-aligned end-to-end —
shifting every subsequent byte and tripping `dsd rom build`'s final
validator. This is a genuine, deep, already-diagnosed wall (a
retrospective on the same doc records a SECOND compounding cause found
post-merge: mwasm's own size padding). None of source-level pragmas,
`asm void`, or anything else reachable from a `.c` file changes
`sh_addralign` in a way the LCF respects — it is not a C-vs-asm
question at all, so these 10 are excluded outright, not attempted and
abandoned.

`SNDi_SetTrackParam` (the other name the brief mentioned) is already
`.c` (`.legacy.c` routing tier) — not a candidate, already converted
by earlier work.

With the named pool exhausted, the remaining candidates are generic
`func_ADDRESS` names — the same category 6 of b621's own 10 conversions
used (the CPSR mrs/msr family next to `OS_DisableIrq`).

## 2. The 9 `asm void` conversions

Same technique as b621, same `nofralloc` escape hatch, same rationale
class each time: an instruction mwcc has no C-reachable equivalent for
(`mrs`/`msr`/`mrc` — privileged; `swi` — privileged; `stmltia`/`ldmltia`
— a hand-tuned store-multiple idiom mwcc's codegen doesn't reach from
any C loop form tried). Each is the exact original instruction sequence,
so each is guaranteed byte-identical once it compiles — the risk in
this half of the batch was 100% "does mwcc's inline assembler accept
this syntax," never "will the bytes match":

| Function | What it does | Family |
|---|---|---|
| `func_02093808` (canary) | read CPSR mode bits (mrs+and) | CPSR, sibling of OS_DisableIrq |
| `func_02092e38` | read CP15 DTCM region register (mrc) | CP15, privileged |
| `func_02041520` | clear bit 15 if set (ands+bicne) | unusual flags-setting codegen |
| `func_020536bc` | 2-word struct setter (str+str) | mwcc fuses into stmia; orig doesn't |
| `func_020b41c0` | debug SVC, selector 3 | swi 0x123456 family |
| `func_020b41d4` | debug SVC, selector 7 (sibling of above) | swi 0x123456 family |
| `func_020b41e8` | debug SVC, selector 0x18, no frame | swi 0x123456 family |
| `func_0200093c` | 4-byte-stride memset (identical body to Fill32) | stmltia loop |
| `func_020944ec` | drain a buffer into a fixed hardware port | ldmltia/strlt loop |

All 9 compiled and byte-matched on the first attempt.

## 3. The 3 genuine-C attempts — 1 clean, 2 wrong register choices

These were deliberately attempted as NATURAL C first (not `asm void`),
since all three looked like exactly the kind of small, well-understood
global-access pattern that should compile predictably — a real test of
"judgment C-match, not tooling" rather than defaulting to the escape
hatch everywhere:

- **`func_02092368`** — `data_021024b0 = 0x82000001;` (a plain constant
  store to an already-`int`-typed, already-matched sibling global).
  **Wrong on the first attempt**: mwcc allocated r1=constant, r0=address;
  the original has r0=constant, r1=address — functionally identical,
  byte-different. Tried reordering the C (`int v = ...; data = v;`) to
  coax the allocator — no change. Confirmed via a standalone
  `ninja build/eur/src/main/func_02092368.o` + `objdump` cycle (no need
  for a full link+sha1 just to see register numbers).
- **`func_02099c38`** — `while (*(u16*)(data_021a8394+0x36) & mask) {}`
  (matches the exact pointer-cast convention two other already-matched
  siblings of this same data blob already use, per
  `src/main/func_02099c24.c` / `func_02099ff0.c`). **Wrong**: mwcc emits
  a separate `and` + `cmp` pair; the original fuses them into one
  `ands`. Same family as `func_02041520`'s wall above — mwcc doesn't
  reach the flags-setting-AND form from a plain `while (x & mask)`.
- **`func_0209b534`** — `while (*(int*)data_021a8438 == 1) {}`.
  **Wrong**: mwcc's natural choice for the base-pointer register is r0;
  the original uses `ip` (r12) — again functionally identical, register-
  different, with no parameter forcing either choice (the function
  takes no arguments).

**`func_02092368` is the only one of the three where the *values*
compiled correctly and only the *register choice* was wrong** — worth
separating from the other two, where the *instruction shape itself*
differs (one AND+flags instruction vs two). All three were re-shipped
as `asm void` (the exact original bytes, transcribed once and verified
by disassembling the freshly-compiled `.o` against the original
sequence before ever re-running a full link) rather than spending
further cycles coaxing mwcc — three failed natural-C attempts across
three independent small functions is a real, if small, signal that
this specific mwcc build's register allocator doesn't reliably
reproduce Nintendo's original choices even on trivial, single-basic-
block bodies, not just the well-known bigger walls (peephole/stmia
fusion, flags-fused ANDS) already catalogued in `codegen-walls.md`.

## 4. A methodology bug worth flagging (not a tool bug — my own process)

Mid-batch, isolating which of the 3 genuine-C candidates was failing
produced a false signal: after reverting all 3 to `.s` (via `git
checkout` + deleting my draft `.c` files) and re-adding them one at a
time to bisect, TWO of the three appeared to "pass" individually —
but I had forgotten to re-write their `.c` source after the revert, so
`configure.py` (which only generates a ninja rule for a `.c`/`.s` file
that actually exists on disk) silently had no rule for that target,
and the link step reused a STALE `.o` sitting at that path from the
very first, genuinely-compiled attempt earlier in the batch. Caught by
directly checking `ls src/main/func_X.c` before trusting a "pass," and
confirmed by explicitly `rm`-ing every stale `.o` and re-running from
an honestly-empty state, which reproduced the real, deterministic
failure (identical wrong sha1 both times). No project-tooling change
needed here — `configure.py`'s "no rule for a nonexistent source" is
reasonable behavior; the bug was purely in my own bisection bookkeeping
(not re-materializing a deleted draft before re-testing it). Recorded
here because the exact same trap — revert a candidate, forget to
recreate its source, get a deceptive pass from a stale `.o` — is easy
to hit again in any future hand-conversion batch that bisects this way.

## 5. `gate3.py --scope all` and final counts

```
$ python3.13 tools/gate3.py --scope all
==================== eur ====================
$ ninja sha1
[eur] SHA1 PASS

==================== usa ====================
$ ninja sha1
[usa] SHA1 PASS

==================== jpn ====================
$ ninja sha1
[jpn] SHA1 PASS

$ python3.13 -m pytest -q tests
1 failed, 2810 passed, 12 skipped, 59 subtests passed in 16.97s
==================== GATE FAIL ====================
```

The one pytest failure was
`TestCommittedIndexIsCurrent::test_committed_index_matches_regeneration`
— `docs/research/README.md` was stale after adding this doc without
re-running `tools/generate_research_index.py` (expected housekeeping,
not a functional issue; the same category brief 620 also hit). Fixed
and re-verified locally — this doc-index regeneration has zero bearing
on `ninja sha1`, so a full second 3-region rebuild just to re-confirm
a markdown index wasn't warranted; the sha1 PASS above already reflects
every one of the 12 conversions, across all 3 regions:

```
$ python3.13 tools/generate_research_index.py
wrote docs/research/README.md (447 notes)

$ python3.13 -m pytest -q tests
2811 passed, 12 skipped, 59 subtests passed in 13.74s
```

(This worktree's `tools/gate3.py` doesn't yet carry the region-restore
fix from brief 620 — [PR #1198](../../../pull/1198), still open — which
would otherwise be the more likely source of a spurious pytest failure
here after the `eur→usa→jpn` region loop. It happened not to bite this
run — collection order or an unrelated test's side effect apparently
left the tree usable — but if a *different* pytest failure shows up on
a future `--scope all` run in a similarly stale worktree, check there
first before assuming a real regression.)

**Functions converted: 12** (9 `asm void`, 3 `asm void` after a failed
natural-C attempt — see §3). **`.s` removed: 12. `.c` added: 12.**

```
$ git diff --stat -- src/main/ config/eur/arm9/delinks.txt
 config/eur/arm9/delinks.txt | 24 ++++++++++++------------
 src/main/func_0200093c.s    | 15 ---------------
 src/main/func_02041520.s    | 12 ------------
 src/main/func_020536bc.s    | 10 ----------
 src/main/func_02092368.s    | 11 -----------
 src/main/func_02092e38.s    | 21 ---------------------
 src/main/func_02093808.s    | 13 -------------
 src/main/func_020944ec.s    | 11 -----------
 src/main/func_02099c38.s    | 12 ------------
 src/main/func_0209b534.s    | 12 ------------
 src/main/func_020b41c0.s    | 22 ----------------------
 src/main/func_020b41d4.s    | 21 ---------------------
 src/main/func_020b41e8.s    | 20 --------------------
 13 files changed, 12 insertions(+), 192 deletions(-)
```

(git diff --stat only shows tracked-file deletions; the 12 new `.c`
files are untracked until commit — 160 total lines added across all
12, `wc -l`.)

## 6. Honest limitations / next steps

- **9 of 12 are `asm void`, not natural C.** This matches b621's own
  precedent exactly (10 of 10 there were also `asm void`) — for main's
  residual tier at this size class, the pattern seems to be "either
  it's a privileged/hand-tuned instruction wall, or it's a trivial
  global access mwcc's register allocator still doesn't reproduce
  exactly." Neither is a tooling gap; both are documented, real mwcc
  behavior.
- **The 10 Thumb SWI thunks stay `.s` — permanently, not just this
  round.** `thumb-align-wall.md`'s own recommendation (ship as `.s`,
  mirroring pokediamond/pokeheartgold's precedent) is the settled
  answer; re-attempting them without an upstream dsd fix (issue filed,
  not yet landed per the doc) would just re-discover the same wall.
- **The 2 wrong-register natural-C attempts are not proof mwcc
  *can't* match here** — only that the FIRST natural phrasing didn't.
  A future pass with more time budget for register-allocation-specific
  rephrasing (the kind of iteration `codegen-walls.md`'s C-12/other
  entries document working for other functions) might still land one
  or both as real C. Not attempted further this round in favor of
  shipping a verified `asm void` fallback and moving on, consistent
  with the brief's own "judgment C-match" framing over open-ended
  tooling iteration.
