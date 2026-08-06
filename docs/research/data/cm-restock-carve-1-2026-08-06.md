# cm-restock-carve-1 — first restock-census wave, 31/35 shipped, a real alignment wall found and declined (2026-08-06)

First wave of the restock-census carve series (the third discovery
method for this project, distinct from `cm-data-inference` and
`cm-bss-convert`): 274 `.data`/`.rodata` symbols found by
`tools/data_worklist.py`'s shape classifier, invisible to prior
discovery methods since most sit in genuine delinks.txt gaps that
dsd silently fills from the base ROM rather than an editable `.s`
cluster file. This wave scoped ov006's 33 struct-shaped candidates
plus 2 flagged `.bss` fast-follows from `cm-bss-convert-9`.

## Result

**31 of 35 candidates shipped (1,960 B), 4 cleanly declined** (a real,
well-documented mwldarm alignment wall, not a research gap). CANARY
discipline followed throughout: the first carve (the 6-symbol
callback-table cluster) went through a full 3-region gate before any
batching; the AudioBank fast-follow and the 23-symbol struct batch
each went through their own verification pass before being folded in.

```
Typed-array:   161,052 -> 162,884 bytes  (+1,832 B,  3.37% -> 3.41%)
Named-struct:   55,204 ->  57,076 bytes  (+1,872 B,  1.16% -> 1.19%)
```

The two deltas differ by 40 B, and that's expected, not a bug: 3
primitive-typed arrays (`short[8]`/`short[30]`/`signed char[12]`, 88 B)
count toward `Typed-array` only (no non-primitive type clause), while 3
scalar (non-array) struct instances (`Ov006Rect021cc034`, the 2
`Ov006AudioBank` singletons, 128 B) count toward `Named-struct` only
(no brackets). `128 - 88 = 40`, reconciling exactly against the 1,960 B
of real new bytes shipped this wave. Measured against a freshly
re-baselined `git stash` snapshot of this exact branch point
(`origin/main` at `c35d49d8d`).

## Part 0: a new byte-extraction discipline for `.data`/`.rodata`

Unlike `.bss` (reserved space, no ROM bytes), `.data`/`.rodata`
candidates have real byte content that must never be hand-transcribed.
Built `extract_bytes.py`: reads ground truth directly from the
pristine `extract/eur/arm9_overlays/ovNNN.bin` (module base address =
delinks.txt's first section start), cross-checks against the current
build tree, and prints a hexdump + LE-u32 word breakdown (pointer-range
flagging) + a raw byte array for independent re-verification. Every
initializer in this wave was generated from this script's output, then
independently re-verified byte-for-byte against the built binary
before being treated as final (see Part 4).

## Part 1: the mechanical difference from `.bss` carving

Investigating the first candidate (`data_ov006_021cbb08`) surfaced a
structural discovery: these `.data` census candidates have **no
delinks.txt TU at all** — dsd silently fills genuinely unclaimed
address ranges from the base ROM without requiring 100% source
coverage. This is fundamentally different from `.bss` carving (which
always repoints an *existing* `.s` cluster file) — carving these means
*inserting* a brand-new TU entry into a gap, not repointing one.
Confirmed via the existing `cluster-d-recipe.md`/`data_0210210c.c`
precedent (brief 121) before committing to the mechanism; validated
empirically by the wave's own CANARY gate.

## Part 2: callback-table cluster (6 symbols, 156 B) — the CANARY

`data_ov006_021cbb08/_bb20/_bb38/_bb74/_bb8c/_bbb0` — all
null-terminated `Ov006StateCb` dispatch tables (5/8 real function
pointers + one zero-word sentinel), proven by real byte extraction
cross-referenced against `symbols.txt` (every non-zero word resolves
to a real `kind:function` symbol at that exact address). 5 of 6
already had unsized `extern Ov006StateCb` declarations in
`ov006_core.h`'s documented "callback-dispatch family"; `_bb20` was
only mentioned in a comment, never declared — the 2nd member of a
separate "dispatch variants" pair. Ran the full 3-region gate on this
cluster alone before touching anything else, per the item's explicit
CANARY requirement.

## Part 3: `Ov006AudioBank` fast-follow (2 symbols, `.bss`, 120 B)

`data_ov006_0224f2ac`, `data_ov006_0224f344` — flagged by
`cm-bss-convert-9` as "same idiom, not independently re-verified."
Verified to full standard: both callers are still raw `.s`
(`func_ov006_021b40ac.s`, `func_ov006_021b4f68.s`), but the exact
`bl func_0202adf8` + `bl func_0202ae1c` two-call signature proven for
all 6 already-shipped family members is directly visible in the raw
disassembly — as authoritative as a matched C consumer. Both were
still living in multi-symbol `.bss` cluster fragments
(`data_ov006_bss_2_4.s`, `data_ov006_bss_2_5.s`); split using the
established frag-numbering convention (`_2_6`, `_2_7` for the
remaining pieces), confirmed against the exact `cm-bss-convert-9`
precedent commit's own fragment-splitting diff before applying.

## Part 4: the struct batch (23 shipped, 1,684 B) — 5 parallel investigations

Dispatched 5 read-only investigation agents over the remaining 27
ov006 struct candidates (address-clustered groups of 3-7), each with
the byte-extraction script, the established toolkit (relocs.txt
structural proof, transitive-callee tracing, `ov006_core.h`
cross-reference), and explicit instructions not to write files (gate
was mid-run; avoided collision). All 5 returned well-evidenced,
high-confidence findings; reconciled centrally before writing any
files.

**Families shipped:**
- **`TouchBoxEntry`** (`{short xMin,yMin,xMax,yMax; int id;}`, new) —
  3 members (`_ddfc`/`_de14`/`_de48`), touch hit-test tables for a
  duel-icon menu; `_de48`'s coordinates reproduce already-shipped
  `data_ov006_021cdf88`'s own `(x,y)` fields exactly (id = df88's
  record index) — the single strongest piece of evidence this wave.
- **`DuelIconEntry`** (existing typedef, reused verbatim) — extended
  to 2 more instances (`_dea8`, `_e0a8`), same offset/property-ID
  mapping to `func_020216b0` as the original df88 consumers.
- **`Ov006HitRect021cc164`** (`{short x0,y0,x1,y1; int tag;}`, new) —
  a 6-member family, discovered by **reconciling two independent
  agents' reports**: one (assigned `_cc164`/`_cc1b8`) and another
  (assigned `_cc268`/`_2c8`/`_334`/`_618`) both independently derived
  the *identical* struct shape from the *same* consumer function
  (`func_ov006_021be948.s`'s `self->f40` switch) without knowing about
  each other's symbols — unified under one typedef rather than shipped
  as two artificially-separate families.
- **`Ov006HitRect021ce084`** (same shape, different consumer/subsystem
  — `func_ov006_021c6530.s` — kept as its own typedef, not conflated
  with the family above) — 1 member.
- **`RecordOv006_021cc588`** (existing typedef, reused) — extended by
  3 more instances (`_0dc`, `_3a0`, `_40c`), completing a
  3-primary/3-secondary dispatch-table family that was previously only
  half-typed.
- **`Ov006PosRow*`** (`{short x; short y;}`, new per-family instances
  per this project's existing per-family-typedef convention) — 3
  members across 2 sibling UI-layout functions.
- **`kv_t`** (existing typedef, reused) — 1 member (`_274`) shipped
  cleanly, completing a 9-table lookup family (case selectors 1-9 all
  now resolved) — see Part 5 for the other 4 members of this same
  family, which did NOT ship.
- Plus 2 standalone tables: `data_ov006_021cdddc` (`short[8]` glyph
  lookup) and `data_ov006_021ce4a4` (`short[30]` decimal score table,
  ruled out as an `Ov006AudioBank`-family member despite matching size
  — computed-stride halfword access, not fixed-offset field access,
  and zero relocations in range) and `data_ov006_021ceb04`
  (`signed char[12]`, direct sibling of already-shipped
  `data_ov006_021ceb2c`).

Every proposed struct was spot-verified against the agents' cited
consumer disassembly and, where reused, against the actual existing
typedef's field names/types before writing (caught nothing wrong this
wave, but this is the standing discipline regardless).

## Part 5: declined — 4 symbols, a real alignment wall

`data_ov006_021ce38a`/`_3ae`/`_3d6`/`_3fe` (all `kv_t`, the remaining
4 members of the 9-table lookup family from Part 4) — **fully resolved
research-wise** (real byte content, real loop-bound-proven consumer
evidence in both twin functions, cross-validated independently by 2
separate agents) but **declined on a structural build-system
constraint**, not a research gap:

Every one of these 4 addresses is 2-byte misaligned
(`addr % 4 == 2`). `arm9.lcf`'s `ALIGNALL(2)` (documented in
`docs/research/cluster-b-size-1-2-recipe.md` and
`docs/research/data-carve-tu-alignment.md`) forces every linked
section to a 4-byte boundary; a new TU claim at a non-4-aligned
address gets a real padding gap inserted, cascading a +2 byte shift
through every symbol in the rest of the module. Confirmed directly via
`ninja check`'s diagnostic signature (`data_ov006_021ce38a`... "Matching
name found at 0x021ce38c", persisting through every later ov006
symbol).

Tried, in order:
1. **Absorb 2 bytes backward** to reach a 4-aligned TU start — dsd's
   delink-time symbol-containment check rejected it (those 2 bytes
   belong to the un-investigated `data_ov006_021ce372`'s own deduced
   extent).
2. **One large bundle TU** spanning back to the nearest already-4-
   aligned, already-shipped boundary (`data_ov006_021ce2ac.c`'s end,
   0x021ce2bc) through the next 4-aligned real-symbol boundary
   (0x021ce450), representing all 11 in-between placeholder symbols as
   individually-named opaque byte arrays — **built, but every symbol
   in the bundle came out at the wrong address**: mwcc does not
   preserve declaration order for multiple top-level globals in one TU
   (matching `cluster-b-size-1-2-recipe.md`'s own documented follow-up
   finding from `cm-data-inference-6`, confirmed here independently).
3. **Smaller bundle** (one combined opaque blob absorbing only the
   placeholders with zero external references, kept as a single
   top-level array to avoid the reordering risk) — mwldarm reported
   **undefined symbol** errors: 4 of the 8 "no direct consumer found"
   placeholders (`_32e`/`_342`/`_35a`/`_372`) are in fact referenced by
   name from two already-existing, unrelated files
   (`data_ov006_021ce650.s`, `data_ov006_021ce8a8.s`) — my own earlier
   relocs.txt check (from-address only) missed this class of reference
   entirely; every placeholder in the gap needs to stay an
   individually-named symbol.

Given every symbol in the gap must stay individually named, AND
individual-TU splits require the *cumulative* address chain to stay
4-aligned (which a genuinely 18-byte-sized real placeholder,
`data_ov006_021ce2e0`, cannot satisfy without the same reordering-risk
merge), this wave declines all 4 rather than force a fragile fix.
`docs/research/ov004-odd-aligned-slot-recipe.md` documents the same
root wall in a harder `.rodata` context requiring a patcher-level fix
after all 3 source-level variants failed there too — consistent with
this being a genuine structural floor, not a one-off mistake.

**Handoff**: a future wave could revisit with a dedicated
patcher-extension approach (per the ov004 doc's Variant E), or
investigate whether `data_ov006_021ce372`'s own true extent can be
independently narrowed via consumer analysis (freeing the 2 bytes
needed for approach #1 without violating dsd's containment check).

## Process notes

- **Kickoff message legitimacy verified before acting**: this wave's
  filing arrived in an unusual dispatch-style format (bash PREFLIGHT
  scripts, third-person references) compared to every prior
  conversational wave-report. Verified every concrete claim (worktree
  identity, clean git status, census doc existence, queue entries)
  against real repo state on a freshly-fetched `origin/main` before
  acting, rather than blindly trusting or blindly refusing — one
  initial "missing doc" finding resolved as a genuine concurrent-push
  timing artifact from another lane, not a real preflight failure.
- **A background task's own "exit 0" summary contradicted the actual
  gate result**: the CANARY gate's task notification reported success,
  but the real log showed `GATE FAIL` (a stale `docs/state-table.md`
  failing its own committed-table check) — caught by reading the
  actual log rather than trusting the notification, matching this
  session's standing "verify, don't trust a self-report" discipline.
  Fixed by regenerating the table; re-confirmed via a targeted
  `--scope tests` re-run rather than redundantly re-running the
  already-proven 3-region SHA1 build.
- **A manual byte-count transcription error caught by the project's
  own no-hand-transcription rule**: while building the alignment-wall
  workaround, manually copied/concatenated hex bytes came out 2 bytes
  short of the true 170-byte span (miscounted by hand). Caught by
  regenerating the exact same array programmatically from
  `extract_bytes.py`'s own logic and diffing, rather than trusting the
  manual copy — exactly the failure class the standing "never
  hand-transcribe, always script-generate" rule exists to prevent.
- **Cross-agent family unification**: two independently-dispatched
  investigation agents each derived the same 6-member struct family
  from opposite ends of one shared dispatch function without knowing
  about each other's assigned symbols (see Part 4,
  `Ov006HitRect021cc164`). Reconciled into one typedef before shipping
  rather than shipping as two separate, artificially-divergent
  families — worth checking for this kind of overlap whenever
  parallel agents share a module.
- Every file-count claim in this doc and the queue entry reconciled
  against `git status --short`/`git diff --stat` before writing, per
  this campaign's standing rule.

## Next steps

- `data_ov006_021ce38a`/`_3ae`/`_3d6`/`_3fe`: blocked on the alignment
  wall above — needs either a patcher-level fix or a narrowed
  `data_ov006_021ce372` extent before retrying.
- `data_ov006_021ce56c`, `021ce5c4` region and other ov006 candidates
  outside this wave's 33-symbol scope: not investigated.
- main's 58 struct-shaped census candidates: not started this wave —
  see the queue entry for the room/no-room decision.
- `cm-field-recheck-1` (item 2 of this kickoff): begins on a fresh
  branch per the kickoff's explicit sequencing, after this PR.
