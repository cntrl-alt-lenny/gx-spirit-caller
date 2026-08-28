[//]: # (markdownlint-disable MD013 MD041)

# q-collision-pair-audit — auditing the 7 unchecked fingerprint collisions

**Snapshot:** 2026-08-29, `origin/main` post-#1589/#1590 (the exact-name lookup
has landed; this audit is entirely built on committed `symbols.txt` /
`relocs.txt` / `delinks.txt` / source files, which are stable — nothing here
is time-sensitive the way a live refusal census is).

## The distinction this audit turns on

A byte-identical ROM proves the **built bytes** are correct. It does not
prove every **symbol attribution** in the source is correct. A `.c` that
calls the wrong name for the right address, or resolves to the wrong member
of a genuinely interchangeable pair, still compiles to the right bytes *for
that address* and gates green — the wrongness lives entirely in what the
source *claims*, not in what it *produces*. `q-fingerprint-promotion-
evidence` (#1589) found 8 EUR address pairs whose raw fingerprint guesses
collide on one shared target — 1 of them (`func_0209bb60`/`func_0209bc20`)
was already known to be exactly this kind of source-level error (brief 673).
This document checks the other 7.

## Verdict

**All 7 previously-unchecked pairs are CORRECT.** The committed, shipped
source at every disputed address structurally matches its true EUR twin —
verified by independently reading the actual files, not by re-running the
fingerprint. The 1-in-8 rate from the known-wrong case does **not**
generalize: 0 of the 7 newly-audited pairs are wrong. **No new WRONG pair
was found**, so there is nothing to scope for a fix this round.

Every "CORRECT" verdict rests on **independently re-derivable evidence** —
a discriminator the current fingerprint's `reloc_sig` throws away — not on
absence of contradicting evidence. Two of the seven (`0x02032fac`/
`0x02032fe4` and `0x02033000`/`0x0203301c`) turned out to be facets of the
**same** underlying 8-function chain, so this audit covers 6 independent
structural situations, not 7.

**One bonus finding, unrelated to any pair's verdict:** auditing pair 6
surfaced a real error in `docs/research/brief-435-region-port-wave7.md` —
its own prose has two symbol names swapped. See *Bonus finding* below.

## Canary: reproducing brief 673's verdict independently

Before auditing the 7 unknowns, I read the actual committed files for the
known pair and confirmed the verdict without re-deriving #1589's
measurement, by reading `func_0209bb60`/`func_0209bc20` directly:

- `src/main/func_0209bb60.legacy.c` (EUR): `func_0209bb60(void *a0)` calls its
  own **self+size successor** `func_0209bba4` (`0x0209bb60 + 0x44 =
  0x0209bba4`), then `func_0209b54c`/`func_0209b534`, touching
  `data_021a8438`.
- `src/usa/main/func_0209ba6c.legacy.c` (the address brief 673 says is
  correct): calls **its own** self+size successor `func_0209bab0`
  (`0x0209ba6c + 0x44 = 0x0209bab0`), then `func_0209b458`/`func_0209b440`,
  touching `data_021a8358` — **identical shape** to `func_0209bb60`, just
  region-renamed.
- `src/usa/main/func_0209bb2c.legacy.c` (the address the raw fingerprint
  still guesses today for `func_0209bb60`): calls **its own** self+size
  successor `func_0209bb70`, referencing the **same**
  `func_0209b458`/`func_0209b440`/`data_021a8358` as `func_0209ba6c` above —
  this is `func_0209bc20`'s twin, not `func_0209bb60`'s.

This independently reproduces brief 673's verdict — WRONG at the raw-
fingerprint level (still true today: `find_siblings` has not been changed),
**CORRECT in the currently-committed, shipped source** (brief 673's hand fix
is exactly what's in the tree). The method — read both candidate `.c`
files, compare call/data-reference SHAPE (position, self-relative offset,
which callee/data appears where), ignoring literal renamed spellings — is
what every pair below uses. Canary passed; proceeded to the 7 unknowns
without further ceremony.

## Method

7 independent read-only agents, one per pair, each given the canary's
worked example as a template and instructed to: (1) pull sizes and any
existing real name from all three regions' `symbols.txt`; (2) pull full
relocations (`kind:`/`to:`/`module:`) for both EUR candidates from
`relocs.txt`, looking for a self+size edge or any per-candidate-distinct
target; (3) read both EUR source files; (4) find and read every
same-size candidate `.c`/`.s` file near the collision target in USA and
JPN; (5) structurally compare committed target content against both EUR
candidates; (6) cross-check `delinks.txt` for genuine per-function TU
headers. Sub-agents were read-only throughout (no file writes, no git
mutation, no build/`ninja`/`gate3.py`); all writing, verification, and this
document are mine.

I independently spot-checked one agent's most surprising claim (the
brief-435 documentation error) directly against `relocs.txt` and the
committed source myself — see *Bonus finding*.

## Per-pair results

### Pair 1 — `0x02032fac` / `0x02032fe4` → target `0x02032f90`

**CORRECT.** All EUR siblings in this run (`0x02032f74`…`0x02033038`, 8
functions, `size=0x1c`) share the identical two-call signature (`arm_call →
OS_DisableIrq`, `arm_call → OS_RestoreIrq`) — non-discriminating by
construction. The only varying evidence is a **non-relocated literal**
struct-offset immediate (`str r4, [r5, #imm]`), invisible to any
relocation-based fingerprint. USA/JPN have only **5** of EUR's 8 siblings as
byte-identical counterparts (some EUR slots have no byte-exact USA/JPN
twin at all). `0x02032fac` (imm `0xed0`) is byte-identical to the shipped
`func_02032f90.c` (imm `0xed0`) — genuinely correct. `0x02032fe4` (imm
`0xed8`) has **no** byte-exact USA/JPN counterpart in this run at all; its
raw-fingerprint guess of the same target is simply the closest available
byte match (`byte-sim=0.964`, i.e. 27/28 bytes), not a shipped wrong file —
confirmed directly against `build/known_correct_dropped_collisions.json`'s
own recorded byte-sim values for both EUR addresses. No mismatch between
any committed `delinks.txt` entry and what's on disk.

### Pair 2 — `0x02033000` / `0x0203301c` → target `0x02032fc8`

**CORRECT**, with a genuinely subtle caveat. This is the **same 8-function
IRQ-bracketed chain** as Pair 1, one slot further along. The EUR-to-USA/JPN
literal-immediate delta is a constant **−8** across the whole run,
confirmed against 2 independent `.s`-file ground-truth anchors (6/6 fit).
`0x02033000`'s literal (`0xedc`) happens to be byte-identical to
`0x02032fc8`'s shipped content — the tool's byte-disambiguation (raw Hamming
comparison) picked it correctly by direct byte proof, which is the same
standard this whole project gates on. The caveat: by the run's own
field-position ordering, `0x02032fc8` is *semantically* slot 6, one ahead of
EUR `0x02033000`'s slot 5 — a coincidental byte-value alignment, not a true
1:1 field correspondence. This does **not** change the verdict: there is no
misnamed symbol here (the two calls are the shared, always-correct
`OS_DisableIrq`/`OS_RestoreIrq`), and the shipped literal is independently
byte-verified against the real ROM content. It changes only how this
document's own "which EUR pair maps to which" framing should be read for
this one case — not a source defect.

### Pair 3 — `0x020952d0` / `0x020952e4` → target `0x020951f0`

**CORRECT.** No self+size edge here; each is a 2-load thunk. The two loads'
`to:` targets differ in **callee size** (`0x70` vs `0x8c`) — independently
resolvable and consistent with a uniform EUR→USA/JPN delta of `+0xE8` for
both. `EUR 0x020952d0 → USA/JPN 0x020951dc` (0x70 callee, shipped as `.s`)
and `EUR 0x020952e4 → USA/JPN 0x020951f0` (0x8c callee, shipped as `.c`,
structurally matches). `delinks.txt` entries are genuine per-function
headers in all three regions, filenames match disk exactly.

### Pair 4 — `0x020954d4` / `0x02095514` → target `0x02095420`

**CORRECT.** Both calls (`OS_DisableIrq`/`OS_RestoreIrq`) are shared and
non-discriminating; the distinguishing evidence is a literal-pool data
pointer at `+0x3c`, resolvable through the module's uniform `−0xE0`
data-address delta. `EUR 0x02095514 → USA/JPN 0x02095420` (shipped `.c`,
matches). `EUR 0x020954d4 → USA/JPN 0x020953e0` (shipped `.s`, matches).
Independently corroborated by the EUR dispatcher's own call order
(`func_020954b4` calls B then A; USA's `func_020953c0` calls the same two
targets in the same order). `delinks.txt` consistent, no mismatch.

### Pair 5 — `0x0209a824` / `0x0209a83c` → target `0x0209a748`

**CORRECT**, and this pair is part of a 4-way collision family (EUR has 4
adjacent `size=0x18` thunks sharing one reloc-kind signature, not just 2).
Both candidates call callees of different size (`0x48` vs `0x14`), each
independently and uniquely resolvable to its USA/JPN counterpart.
`EUR 0x0209a824 → USA/JPN 0x0209a730` (0x48 callee, shipped, matches).
`EUR 0x0209a83c → USA/JPN 0x0209a748` = the disputed target (0x14 callee,
shipped, matches). `delinks.txt` consistent.

### Pair 6 — `0x0209a92c` / `0x0209a9b8` → target `0x0209a8c4`

**CORRECT.** A self+size edge exists (matching the canary's shape exactly)
and resolves cleanly through the module's uniform `+0xF4` delta:
`EUR 0x0209a9b8`'s successor `0x0209a9f4` maps to `0x0209a900`, which is
exactly the committed `func_0209a8c4.legacy.c`'s own call target — so
`0x0209a8c4` is `0x0209a9b8`'s twin, matching the shipped content.
`EUR 0x0209a92c`'s true twin (`0x0209a838`) shipped as whole-function `.s`,
whose own asm calls `func_0209a874` — `0x0209a92c`'s shape, independently
confirming the split. See *Bonus finding* for a documentation-only
correction this pair surfaced.

### Pair 7 — `0x0209bfd4` / `0x0209bfe4` → target `0x0209bef0`

**CORRECT.** No self+size edge; distinguishing evidence is callee size
again (`0xa4` vs `0x9c`), resolvable through the run's uniform `−0xF4`
delta (confirmed across a long multi-function size-sequence alignment
spanning both candidates and their neighbors, not just the two candidates
in isolation). `EUR 0x0209bfe4 → USA/JPN 0x0209bef0` (0x9c callee,
shipped, matches — this is the disputed target). `EUR 0x0209bfd4 → USA/JPN
0x0209bee0` (0xa4 callee, shipped as `.s`, matches). `delinks.txt`
consistent in all three regions.

## Synthesis — the shared mechanism

Every one of the 8 pairs (canary included) shares the same root cause:
`find_region_siblings.Function.reloc_sig` is **deliberately** built from
`(offset, kind, target_MODULE)` — the actual `to:` address is excluded on
purpose, because it's region-specific and the whole point of the fingerprint
is to be comparable across regions. That design choice is exactly what
makes two same-size EUR siblings that call *different* callees of the
*same kind, in the same module* fingerprint-identical: the very information
that would disambiguate them is the information the signature was built to
discard.

For **5 of the 7** audited pairs (3, 4, 5, 6, 7) plus the canary, a real
discriminator survives anyway, in data the tool already has but doesn't
use for this purpose: a self+size self-referential call resolvable through
a uniform module-wide address delta, a callee-SIZE mismatch independently
resolvable the same way, or a literal-pool data-pointer target. In every
one of these cases the discriminator was found by reading the FULL
(non-stripped) relocation record and cross-checking a module-wide address
delta — exactly the mechanism `q-fingerprint-promotion-evidence`'s
`verified_neighbor` signal measures at scale, and exactly what the other
lane is now testing against the ROM gate.

For **2 of the 7** (1 and 2 — actually one 8-function chain), no
relocation-based discriminator can ever exist: every sibling in the run
shares the identical two-call signature, and the only distinguishing
evidence is a non-relocated literal integer immediate. These still shipped
correct, but by raw byte-content luck (`byte_disambiguate`'s Hamming
comparison), not by any resolvable symbolic evidence — a genuinely
different, harder case that a relocation-based signal (like
`verified_neighbor`) cannot help with, because there is nothing relational
to discriminate on.

## Critic pass — weakest evidence

Pair 2 (`0x02033000`/`0x0203301c`) has the most caveated verdict: its
"correct" rests on a byte-content coincidence across a constant-shift
literal-immediate run, and its own field-position semantics don't cleanly
1:1-match the EUR pair as originally listed (see the pair's own writeup
above). It is still CORRECT by the project's own standard (byte-verified
against the real ROM, no symbol misattribution), but it is the one verdict
where "correct" required the most explanation to state precisely, and a
future reader should not mistake "byte-correct" for "field-semantically
1:1-mapped" for this specific pair.

No pair returned UNDECIDABLE — every one had enough evidence (a resolvable
relocation discriminator, or a direct byte-content comparison against
`.s`-file ground truth) to reach a verdict. This is itself worth stating
plainly rather than assuming: it means the 7 pairs happened to be the
easier end of what a collision like this can look like, not that every
future collision will be this cleanly resolvable.

## Bonus finding: `brief-435-region-port-wave7.md` has swapped symbol names

Auditing pair 6 (`0x0209a92c`/`0x0209a9b8` → `0x0209a8c4`) surfaced an
unrelated documentation error, independently verified:

```text
$ grep -n "func_0209a900\|func_0209a874" docs/research/brief-435-region-port-wave7.md
```

> "The MEDIUM consensus-shift auto-promote resolved one of its calls to the
> *wrong adjacent sibling* — `func_0209a900` instead of the correct
> `func_0209a874`"

```text
$ grep -n "^from:0x0209a8d4" config/usa/arm9/relocs.txt
from:0x0209a8d4 kind:arm_call to:0x0209a900 module:main

$ grep -n "func_0209a900" src/usa/main/func_0209a8c4.legacy.c
extern int func_0209a900(int a0, void (*cb)(void), int *out);
    int r = func_0209a900(a0, func_0209b3a8, &out);
```

The committed relocation and the committed source both call `func_0209a900`
— and this pair's own independent structural derivation (self+size edge
through the module's `+0xF4` delta) shows `func_0209a900` is exactly the
correct call target for `0x0209a8c4`. Brief 435's prose has the two names
backwards: it names `func_0209a900` as the *wrong* pick and `func_0209a874`
as *correct*, when the tree shows the reverse. `git log` on this file shows
its content has been stable since it was first created (2026-07-24,
`d2b7cc9a8`) — the code was never actually wrong; only the brief's
explanation of which name was which is inverted. The brief's underlying
lesson (`objdiff` alone cannot catch a wrong-sibling resolution — only the
ROM `sha1` can) is sound and unaffected; only the two symbol names in that
one sentence need swapping. Not fixed in this PR (a docs-only change
outside this item's scope) — flagged here for whoever next touches that
file.

## What this does not establish

- **This audits 7 pairs, not all possible collisions.** These 7 (8 with the
  canary) are only the ones `q-fingerprint-promotion-evidence`'s
  reconstruction happened to surface as *already-shipped* fingerprint
  collisions. There may be other symbol-attribution errors in shipped ports
  that don't happen to collide with a sibling in this specific way — this
  audit says nothing about those.
- **"CORRECT" means the currently-committed source is verified right**, not
  that the live fingerprint tool has been fixed. `find_siblings` still
  guesses wrong (or ambiguously) for every one of these 8 pairs today; only
  the already-shipped, already-hand-or-luck-resolved source is being
  assessed here.
- **No fix is proposed or implemented.** Per the item's instruction, a
  source correction inside shipped ports needs its own gated round; there
  is nothing to correct here since no wrong pair was found.

## Reproducing the evidence

```bash
# Symbols / sizes / names:
grep -n "<addr>" config/eur/arm9/symbols.txt config/usa/arm9/symbols.txt config/jpn/arm9/symbols.txt

# Relocations for a function at <addr> size <size>:
grep -n "^from:0x<addr-prefix>" config/eur/arm9/relocs.txt

# Committed source files:
find src/main src/usa/main src/jpn/main -iname "*<addr>*"

# delinks.txt TU headers:
grep -n "0x<addr>" config/usa/arm9/delinks.txt config/jpn/arm9/delinks.txt

# The dropped-collision provenance this audit started from:
python tools/fingerprint_signal_evidence.py   # regenerates build/known_correct_dropped_collisions.json
```

Every address, size, relocation, and file path cited above was read
directly from the files listed; none is inferred from the fingerprint tool
itself.
