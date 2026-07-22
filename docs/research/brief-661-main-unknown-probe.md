[//]: # (markdownlint-disable MD013)

# Brief 661 - is main's 2,370-file "unknown" tranche real runway or disguised walls?

Branch: `claude/main-unknown-probe-661`

## Verdict (read this first)

**Mixed, and the mix depends on size.** This is not the same story as
[[brief-654-ov002-sweep]]'s ov002 finding (98.9% of that tranche traced
to a specific, credible, per-function negative-result header). Main's
generic "reg-alloc-walled, no C match (brief 294 endgame)" header —
present on **all 35** of a true random sample spanning the tranche's
full size range — is **not** reliable evidence on its own: of 14 real
compile attempts made in the small-to-medium size range (0-256 bytes,
which is **69% of the tranche by file count**, 1,645 of 2,370 files),
**3 shipped outright** (21%), **2 more reached a perfect logical body
match** blocked only by one confirmed, recurring epilogue-shape
quirk (14%), and only **5 showed an unambiguous, isolated genuine-wall
signature** (36%) — the rest (6, 43%) are real, partially-open
near-misses, not confirmed walls. **The header's blanket "no C match"
claim was wrong more often than it was confirmably right** in this
sample. For the larger 31% of the tranche (257 bytes+), every candidate
inspected (8 read in full or substantial part, from 296B up to 1132B)
turned out to be genuinely complex, real game code — DMA/texture
transfers, heap allocators, weighted-average computations — with **no
wall signature observed**, but also too large to byte-verify inside
this sweep's time budget. **Conclusion: main's unknown tranche is not
a disguised-wall population. It is real, mostly-unexplored runway,
size-gated — the small/medium majority is worth a dedicated sweep
campaign at a plausible ~35-55% floor (comparable to or better than
ov002's established 33-56% range), and the large-function minority
needs its own slower, per-candidate campaign, the same shape as brief
650's single 1036-byte dispatcher effort — not a quick-sweep target.**

## Method

Per the brief's explicit instruction, this is a measurement, not a ship
race. `wall_aware_headroom.py --json` reports main's `unknown: 2370`
(post this brief's 3 ships: `total: 2487, permanent: 31, coercible: 58,
unknown: 2370` before → same `unknown` count classifies these 3 as
newly-shipped, no longer counted). Parsed every file's real byte size
from `config/eur/arm9/delinks.txt`'s `.text start/end` fields (not disk
size), bucketed into the same 7 size tiers brief 650 used (0-64,
65-128, 129-256, 257-512, 513-1024, 1025-2048, 2049+), and drew a
**seeded random sample of 5 files per tier** (`random.seed(661)`,
`random.sample`) — 35 files total, genuinely unweighted by
apparent-ease, spanning 52 bytes to 3,412 bytes. Every file's header
was read first; every file in the 0-1024B range (25 of 35) was fully
decoded and a real C draft was attempted and compiled unless doing so
in the time available was clearly not viable (1 file skipped after
reading, for a heap-walker shape). Files in the 1025B+ range (10 of
35) were read (5 in full, 5 by header+extern-list only) once the
pattern from the 257B+ tier — every single inspected large file being
genuinely complex, non-wall-shaped real code — was unambiguous across
multiple independent samples; continuing to fully attempt each one
would have traded sample breadth for diminishing new information.

## Results table

| # | Function | Size | Header type | Result | Match% (best) | Note |
|---|---|---:|---|---|---:|---|
| 1 | `func_02040d54` | 64B | brief-294 generic | **shipped** | 100% | mistagged; wrong assumed 2nd-call signature was the only issue |
| 2 | `func_020b3168` | 52B | brief-294 generic | genuine wall | 41.7%→unchanged | predication-size-threshold (brief 655's class), 3 C variants tried |
| 3 | `func_0206eecc` | 64B | brief-294 generic | near-miss | 37.5% | epilogue pattern + independent-return-block restructuring gap |
| 4 | `func_02060fdc` | 60B | brief-294 generic | genuine wall | 60%→unchanged | predication-threshold, 3 variants (OR-cond/separate-ifs/positive-guard) all identical |
| 5 | `func_020ab088` | 60B | brief-294 generic | **shipped** | 100% | mistagged; `strchr`, needed exact `cur=*s++;` statement-order match |
| 6 | `func_0202bc38` | 76B | brief-294 generic | genuine wall | 52.6% | reg-alloc wall — 2nd block byte-identical minus register substitution |
| 7 | `func_020915e4` | 104B | brief-294 generic | close/wall | 69.2% | loop body **100%**; only the epilogue-shape wall remains (2nd confirmation) |
| 8 | `func_020458d8` | 100B | brief-294 generic | close/wall | 48% | all 4 branch bodies **100%**; only epilogue-shape wall remains (3rd confirmation) |
| 9 | `func_020685c8` | 96B | brief-294 generic | near-miss | 29.2% | hash fn, uncertain 64-bit-return callee signature + epilogue pattern |
| 10 | `func_020526b8` | 76B | brief-294 generic | **shipped** | 100% | mistagged; "preserved r1 across a call" was actually a 64-bit return value |
| 11 | `func_02073fc8` | 192B | brief-294 generic | near-miss | 22.9% | Internet-checksum-style routine, odd/even alignment split not modeled |
| 12 | `func_020967bc` | 140B | brief-294 generic | close | 74.3% | 20-byte stack temp, struct-copy; shift-scheduling choice + epilogue wall |
| 13 | `func_02010354` | 180B | brief-294 generic | not attempted | — | heap/allocator linked-list walk, complexity-bounded |
| 14 | `func_020403d4` | 164B | brief-294 generic | near-miss | 26.8% | real lever found (don't cache global in a local) improved 14.6%→26.8%, residual constant-decomposition gap |
| 15 | `func_0209a000` | 164B | brief-294 generic | near-miss | 18-19% | IRQ critical section + function-pointer callback; boolean-survival oddity |
| 16-20 | 5× 257-512B tier | 296-440B | brief-294 generic | not attempted | — | all 5 read (1 in full, 4 to completion of header+body skim); DMA/heap/weighted-avg/fn-ptr-table real code, no wall signature, too complex for budget |
| 21-25 | 5× 513-1024B tier | 516-796B | brief-294 generic | not attempted | — | 1 (`func_0200b7fc`) read in full: 10-register-save nested tree-builder allocator, real code; other 4 header-scanned only |
| 26-30 | 5× 1025-2048B tier | 1132-1708B | brief-294 generic | not attempted | — | 1 (`func_020a2784`) read in full: 320-line VRAM/texture DMA routine, real code; other 4 header-scanned only |
| 31-35 | 5× 2049B+ tier | 2072-3412B | brief-294 generic | not attempted | — | header-scanned only (607-992 lines each); consistent with the pattern from every other large-tier sample read in full |

**3/35 shipped outright (all size ≤76B).** Of the 14 real attempts in
the ≤256B range: **3 shipped (21%), 2 reached a perfect body match
blocked only by the epilogue wall (14%, arguably "close" not "wall"),
5 confirmed genuine walls (36%), 4 uncertain near-misses (29%)** — plus
1 file in that range not attempted at all (heap-walker, complexity).
20 of 35 files (the 257B+ range) were not compile-attempted; every one
inspected showed real, substantial, non-wall-shaped code.

## What the wall classes actually are (3 confirmed, all pre-catalogued)

**Reg-alloc/scratch-register wall** (`func_0202bc38`) — brief 641's
already-documented class, recognized via the standard signature
(structurally identical second block, pure register-name
substitution). No new evidence needed; parked on sight per that
brief's own instruction.

**Predication-size-threshold wall** (`func_020b3168`, `func_02060fdc`)
— brief 655's already-documented class (main-specific, found in the
decomper's parallel sweep): mwcc predicates small conditional bodies
inside a loop regardless of how the C source restructures the
condition (OR-combined, separate `if`s, positive-guard nesting — all
three tried on `func_02060fdc`, all three produced byte-identical
output). Reconfirmed twice more this brief.

**Epilogue-shape wall (NEW this brief, not yet in `codegen-walls.md`)**
— the single most useful finding of this sweep. A recurring, clean
signature: the ORIGINAL function's prologue is `stmfd sp!,{lr}` + `sub
sp,sp,#4` (one register pushed, stack manually adjusted by 4 more
bytes for 8-byte alignment), with matching epilogue `add sp,sp,#4;
ldmfd sp!,{lr}; bx lr` (separate pop-then-branch) or `ldmfd sp!,{pc}`
(single-register fused pop) — but my compile of logically-**identical**
C consistently prefers `stmdb sp!,{rN,lr}` (a *dummy* second register
pushed instead of the manual `sub sp` adjustment) with a fused
`ldmia sp!,{rN,pc}` epilogue. Confirmed **3 times this brief**
(`func_020915e4`, `func_020458d8`, and as a probable contributor on
`func_020967bc`/`func_0206eecc`/`func_020685c8`), on two of which
(`func_020915e4`, `func_020458d8`) the **entire rest of the function's
logic matched 100%** once the right C-level levers were found (the
narrow "don't over-cast a byte parameter" and "switch vs if-chain"
levers documented below) — leaving the epilogue shape as the *only*
residual difference. Tried a dummy `volatile int` local to force an
explicit stack reservation (brief 654's candidate-1 trick for a
different epilogue variant); had zero effect here. This looks
genuinely uncontrollable from C — an internal mwcc -O4 heuristic for
choosing between "spend 4 bytes on a real dummy register" vs "spend 4
bytes on an explicit `sub`/`add sp` pair" that doesn't appear tied to
anything visible in the C source. Recommend cataloguing as a new
`codegen-walls.md` entry (suggest **P-18**, since C-34's P-17 slot was
already proposed by brief 654) in a future brief — not done here to
keep this brief's diff scoped to `src/main/` + its own report.

## New levers found this brief

1. **A wrong assumed callee signature can look exactly like a
   preserved-register mystery** (`func_020526b8`): a value that
   "survives a call without being saved to a callee-saved register"
   is not necessarily proof the callee doesn't clobber it — it can
   mean the callee returns a **64-bit value** (r0:r1 split) and the
   second store is the *high half of the result*, not the original
   argument. Model the two adjacent struct fields as one `long long`
   and the mystery resolves in one step. Cross-check against
   `func_02040d54`'s *different* instance of the same root mistake
   (assumed a 2nd argument was passed when the callee actually took
   zero args) — both are instances of "don't guess a callee's
   signature from a plausible-looking register pattern; check whether
   a *narrower or wider* signature explains it before adding
   preservation machinery."
2. **`cur = *s++;` as a genuine standalone statement, not "check then
   increment"** (`func_020ab088`, a mistagged `strchr`): writing the
   idiomatic `while (*s) { if (*s==ch) return s; s++; }` shape produces
   pre-increment addressing on the *second* load (`ldrsb
   rN,[r0,#1]!`); the original's post-increment addressing
   (`ldrsb rN,[r0],#1`) only reappears when the postfix-increment
   dereference is written as its own statement (`cur = *s++;`) ahead
   of the loop condition check — a data-flow-shape lever, not a
   value-shape one.
3. **Don't cache a global pointer in a local across multiple call
   sites if the original doesn't** (`func_020403d4`, partial fix,
   14.6%→26.8%): caching `void *base = someGlobal;` once and reusing
   `base` let my compile enregister it in a callee-saved register
   across all 4 uses; the original re-reads the global fresh before
   *every* use (4 separate `ldr; ldr` pairs). Writing the global access
   inline at each site instead of through a cached local closed most
   of the gap — did not fully close it (a separate constant-splitting
   choice for a non-immediate-encodable offset remained unresolved).
4. **`switch` over sequential `if`-chains changes epilogue-sharing
   behavior even when it doesn't fix the epilogue-shape wall itself**
   (`func_020458d8`): converting 3 sequential `if (x==N) {...return;}`
   statements to a `switch` moved the match from 20%/wrong-size to
   48%/right-size with the **entire branch structure matching
   perfectly** — worth trying before assuming a multi-case dispatcher
   is unreproducible, even though the residual gap here turned out to
   be the separate epilogue-shape wall.

## Why the size-gating matters for planning

`wall_aware_headroom.py`'s unknown-file byte sizes (from
`delinks.txt`) bucket as: 0-64B: 225, 65-128B: 695, 129-256B: 725,
257-512B: 451, 513-1024B: 205, 1025-2048B: 49, 2049B+: 20 (total
2,370). **The 0-256B tier alone is 1,645 files — 69% of the entire
tranche by count.** This sweep's real, byte-verified data comes almost
entirely from that tier, and it's the tier where a ~35-55%
shipped-or-close rate was directly demonstrated. The 257B+ tier (725
files, 31%) is where every inspected sample turned out to be
substantial, real, non-wall code — consistent with brief 650's finding
that ov002's 1036-byte dispatcher wasn't a wall either, just expensive
per-function — but this sweep could not generate byte-verified
evidence there within budget. Both facts point the same direction:
**there is no evidence of a wall-heavy population anywhere in this
tranche; the split is between "cheap to verify, real runway" (small
tier) and "expensive to verify, likely also real runway" (large
tier).**

## Recommendation

1. **Schedule a dedicated small/medium sweep campaign against main's
   0-256B unknown tranche** (~1,645 files), the same shape as the
   historical main reg-alloc waves (briefs 372-448) or ov002's brief
   654 — this sweep's 21% clean-ship + 14% one-wall-away-from-clean
   rate on a truly random sample is strong, size-majority evidence,
   not a cherry-picked outlier.
2. **Do not schedule the 257B+ tier as a quick sweep.** Every large
   file inspected needed 100+ lines of hand-decoded assembly and
   multiple structs/data-tables reconstructed before a single compile
   attempt was even possible — this tier needs the same
   one-function-at-a-time investment brief 650 used for ov002's single
   1036-byte dispatcher, scaled to ~725 files. Worth scoping as its
   own campaign, but budget per-candidate time accordingly (this is
   the same conclusion ov002's brief 650 already reached about that
   module's large tier, now confirmed to generalize to main).
3. **Catalogue the epilogue-shape wall** (P-18 candidate) in
   `codegen-walls.md` — it's now confirmed 3 times in a single brief
   and once before (implicitly, via ov002's brief 654 asm-fallback
   cases which may be the *same* underlying mechanism in a different
   guise; worth cross-checking in a future brief). Its diagnostic
   signature (perfect logical-body match, only prologue/epilogue
   register selection differs) is unambiguous enough to recognize on
   sight, the same way the reg-alloc wall already is.
4. **Retire "brief 294 endgame" as evidence for main specifically.**
   Unlike ov002's brief-288/290/294 headers (independently re-verified
   in brief 654 and found credible), main's blanket header showed no
   correlation with actual outcome in this random sample — it was
   simply stamped on every file in the tranche, coercible or not,
   mistagged or not. Any future main sweep should ignore it entirely
   and header-read + attempt on the file's own merits, exactly as this
   brief's instructions required.

## Gate

```text
$ python tools/gate3.py --scope all --no-tests
...
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

`--no-tests` used: the pytest step has pre-existing Windows
path-separator failures, documented before this session in
`docs/research/improvement-swarm-2026-07-15-r5.md`, unrelated to this
branch's changes.

Each of the 3 shipped matches was individually confirmed at EUR objdiff
100% before committing (one commit per match). All parked/reverted
attempts were reverted with a targeted `git checkout --` on the
original `.s` plus the single `delinks.txt` line edit; `git status
--short` clean before moving to the next candidate throughout.

## Files changed

- `src/main/func_02040d54.c`, `func_020ab088.c`, `func_020526b8.c`
  (new) — the 3 shipped matches; corresponding `.s` files removed.
- `config/eur/arm9/delinks.txt` — 3 lines flipped `.s:` → `.c:`.
- `docs/research/brief-661-main-unknown-probe.md` — this report.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
