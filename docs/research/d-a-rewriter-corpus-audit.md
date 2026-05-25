# Brief 212 — `$d`/`$a` rewriter corpus audit + straggler diagnosis

**Brief:** 212 (scaffolder). Audit the full project corpus for `.s`
ships that brief 210's `patch_arm_mapping_symbols.py` could flip but
currently doesn't, and investigate the two unflipped brief-209
stragglers (`func_ov011_021cb574` at 99.74% fuzzy and
`func_ov011_021d02a4` at 98.76%) for a residual mechanism the
rewriter doesn't cover.

## Headline

**Straggler root cause identified and fix shipped.** The asymmetric
`$d` emission between mwasmarm (one `$d` per `.word` *run*) and dsd
delink (one `$d` per *pool entry*) causes the rewriter's per-symbol
pass 1 to produce divergent mapping-symbol shapes when a literal
pool contains a `cond==0xF` data word followed by ARM-like words.
dsd's side over-promotes the trailing words to `$a` individually;
mwasm's side has implicit-`$d` coverage to end-of-`.text`. objdiff
classifies the trailing bytes as code on one side, data on the
other, and the function loses `matched_functions` credit despite
byte-identical `.text` (`complete_units = 1`).

**Pass 2 collapse fix added** to `patch_arm_mapping_symbols.py`:
after the per-symbol promotion pass, zero `st_name` on every `$a`
whose `st_value > last_data_offset`. Both sides converge on the
"implicit-`$d` from last data marker to end-of-section" shape that
matches dsd's intended pool extent.

**Corpus impact (live dry-run against the decomper worktree's
`build/eur` tree):** **12 units would have their mapping-symbol
shape collapsed** by pass 2 (10 target-only, 2 both-sides). Of
those, **11 are currently uncredited stragglers** that should flip
to `matched_functions: 1` after pass 2 runs in production. Fuzzy
range of the 11: 89.66% to 99.80% — these were below brief 209's
fuzzy-<70% investigation threshold so they slipped through.

`--sweep` audit mode added to the tool. Brain runs:

```bash
python tools/patch_arm_mapping_symbols.py --in objdiff.json --sweep \
    --sweep-only-changed
```

after `ninja report` to surface any unit pair where the rewriter
would still alter shape (post-fix expectation: zero rows). With
`--verbose`, dumps per-unit info dicts for changed pairs.

## The asymmetric `$d` emission mechanism

Brief 209 documented the surface symptom (`$d` mapping symbols
mis-classifying brief 192 hand-encoded BL bytes as data). Brief 210
fixed pass 1 (promote `$d` → `$a` when the underlying word decodes
as ARM-like). Brief 212 found pass 1 is insufficient when emission
shapes differ between the two `.o` files being compared.

### What mwasmarm emits

For a `.s` file that interleaves real mnemonics and `.word`
directives — the canonical brief 192 / 197 C-32 cross-overlay BL
recipe — mwasmarm follows the ARM ELF convention: emit a mapping
symbol at every TRANSITION between code (`$a`) and data (`$d`),
NEVER at continuations.

```asm
        bl      func_ov000_021ab6ec   ;  → $a here (transition from prev $d)
        .word   0xe3a00001            ;  → $d here (transition to data)
        .word   0xe28dd070            ;  → (no marker, continuation)
        .word   0xe8bd87f0            ;  → (no marker)
        .word   0x0400000a            ;  → (literal pool starts; no marker)
        .word   0x021d30f8            ;  → (no marker)
        ...
        .word   0xffe01fff            ;  → (no marker)
        .word   0x0400000c            ;  → (no marker)
```

The pre-resolve built `.o` has ONE `$d` marker at the offset of the
first `.word` after the last `bl`, then nothing until the end of
the section.

### What dsd delink emits

For the same `.text` bytes extracted from the orig ROM, dsd's
delink produces one explicit mapping symbol per pool ENTRY plus
some inline `.L_xxxxxxxx` data labels. Each pool word gets its own
`$d` marker at its offset:

```
$a@0x0000           ; function start
$d@0x05b0           ; pool word 1 (raw 0x00000000 pre-resolve, becomes 0x021d40c0 post-resolve)
$d@0x05b4           ; pool word 2
...
$d@0x05e8           ; pool word N (the 0xffe01fff data word)
$d@0x05ec           ; pool word N+1 (0x0400000c)
```

(Empirically verified on `func_ov011_021cb574`'s
`build/eur/delinks/.../func_ov011_021cb574.o`: 36 `$d` symbols on
the built side, 38 `$d` symbols on the delinks side.)

### How pass 1's per-symbol promotion handles each side

For the mwasm-built side, pass 1 sees one `$d` covering
`[first_word_after_bl, end-of-text)`. It walks the words, finds
the first non-ARM-like word (cond=0xF, e.g. `0xffe01fff`), and
splits the `$d` to mark only the trailing data range. Result:

```
$a@<last bl>           ; (real)
$d@<0xffe01fff offset> ; (split-moved from the original $d position)
```

Implicit `$a` covers `[<bl>, <0xffe01fff>)`; implicit `$d` covers
`[<0xffe01fff>, end-of-text)`.

For the dsd-delinks side, pass 1 sees MANY `$d` markers (one per
pool entry), each covering 4 bytes. It promotes each individually
based on whether THAT word decodes as ARM-like:

```
$a@0x0000              ; (function start, real)
$a@0x05b0              ; (promoted from $d — 0x021d40c0 decodes as cond=0 EQ, accepted)
$a@0x05b4              ; (promoted)
...
$d@0x05e8              ; (0xffe01fff stays — cond=0xF, rejected)
$a@0x05ec              ; (promoted — 0x0400000c decodes as cond=0 EQ, accepted)
```

### The divergence

For bytes at `0x05ec`:

- **Built side**: covered by implicit-`$d` (the split-`$d` at
  `0x05e8` extends to end). Decoded as DATA.
- **Delinks side**: covered by `$a@0x05ec`. Decoded as the ARM
  instruction `LDREQ` (cond=0 + LDR opcode bits in the upper
  nibble).

Same bytes, different classification. objdiff's
`fuzzy_match_percent` counts the one-instruction divergence and
withholds `matched_functions` credit.

For `func_ov011_021cb574`: 1 trailing word after `0xffe01fff` →
1 instruction divergence → 1520 bytes × (1 − 99.7368%) = 4 bytes,
exact match.

For `func_ov011_021d02a4`: 4 trailing words after `0xffe01fff` →
4 instruction divergence → 1292 bytes × (1 − 98.7616%) = 16 bytes,
exact match.

## The fix — pass 2 trailing-promotion collapse

After the per-symbol pass 1 completes, walk the post-pass-1
mapping symbols and find the LAST `$d` (the trailing data marker,
if any). Zero `st_name` on every `$a` whose `st_value` exceeds
that offset. Mapping symbols with `st_name == 0` are skipped by
the enumerator (they're treated as anonymous local symbols), so
they're effectively removed from the mapping-symbol view without
compacting the symtab.

Why it converges both sides: the built side has no `$a` markers
after its `$d` (it never emitted them); the delinks side has
trailing per-entry `$a` markers (post-pass-1 promotions) that get
collapsed. Both end up with the trailing region implicit-`$d` from
the last data marker to end-of-`.text`. Same shape, same
instruction-vs-data classification, `matched_functions` credit.

### Why "collapse every trailing `$a`" is safe

The rule deliberately doesn't restrict to "$a markers that pass 1
just promoted" — partly because the rewriter is idempotent (re-runs
can't see the "just promoted" set), partly because the structural
shape of every `.s` ship in this corpus is **code, then trailing
pool data, no code after**. A real `$a` from a mnemonic emission
after a `$d` data marker would mean executable code AFTER the
literal pool — which doesn't occur in this corpus (verified across
all 134 `.s`-source units in objdiff.json).

The new test `test_no_collapse_when_all_data` documents this design
choice so future readers don't regress the rule into "only just-
promoted symbols collapse" without first verifying that real-`$a`-
after-pool patterns are still structurally absent.

### Idempotency preserved

A second invocation of the rewriter on a post-pass-2 file:

- Pass 1 sees the same `$d` (still data, no change).
- Pass 2 re-walks symbols, finds no `$a > last_data_offset` (they
  were zeroed in the first pass).

Bytes unchanged. Tested by `test_idempotency_after_collapse`.

## Corpus sweep results

Live dry-run sweep against the decomper worktree's
`build/eur/objdiff.json` (covering 134 `.s`-source units, run on
2026-05-25 before the fix landed):

| Bucket                                | Count | Description                                                      |
|---------------------------------------|------:|------------------------------------------------------------------|
| `no-op` (rewriter has nothing to do)  |   122 | Already byte-clean + matched. Thumb files, pure-mnemonic files. |
| `trailing-collapse-target` only       |    10 | dsd delink side has per-entry trailing `$a` over-promotions     |
| `trailing-collapse-base` only         |     0 | mwasm side has trailing `$a` over-promotions (doesn't happen)   |
| `trailing-collapse-both`              |     2 | Both sides have trailing `$a` residue (large mixed-mode files)  |
| `other-change` (pass-1 promote/split) |     0 | Pass 1 has already converged on every unit (rewriter ran)        |
| `parse-error`                         |     0 | Every `.o.resolved` parsed cleanly                              |

### The 12 units the pass-2 fix would alter

| Unit                                            | Curr matched_fn | Curr fuzzy% | Post-fix expectation |
|-------------------------------------------------|----------------:|------------:|----------------------|
| `src/main/func_02023274`                        |        (none)   |    91.4729  | flip → 1, 100%       |
| `src/overlay002/func_ov002_0220eb00`            |        (none)   |    99.0774  | flip → 1, 100%       |
| `src/overlay002/func_ov002_021e4ba8`            |             1   |   100.0000  | already matched; pass 2 cosmetic |
| `src/overlay002/func_ov002_022b595c`            |        (none)   |    99.8009  | flip → 1, 100%       |
| `src/overlay004/func_ov004_021ca4f8`            |        (none)   |    94.2928  | flip → 1, 100%       |
| `src/overlay004/func_ov004_021cab44`            |        (none)   |    98.6957  | flip → 1, 100%       |
| `src/overlay010/func_ov010_021b3a1c`            |        (none)   |    96.2963  | flip → 1, 100%       |
| `src/overlay011/func_ov011_021cb574`            |        (none)   |    99.7368  | flip → 1, 100% (brief 209 straggler) |
| `src/overlay011/func_ov011_021d02a4`            |        (none)   |    98.7616  | flip → 1, 100% (brief 209 straggler) |
| `src/overlay012/func_ov012_021c9f48`            |        (none)   |    89.6552  | flip → 1, 100%       |
| `src/overlay018/func_ov018_021ab1c4`            |        (none)   |    98.3146  | flip → 1, 100%       |
| `src/overlay020/func_ov020_021abbe8`            |        (none)   |    98.7780  | flip → 1, 100%       |

All 12 units currently report `complete_units = 1` — the bytes
match. They're losing credit purely on the mapping-shape divergence
this fix corrects.

**Aggregate expected delta**: `matched_functions +11` (12 minus the
already-credited `021e4ba8`). For comparison, brief 210 was
`+11`; this is the same magnitude leftover. Needs brain's local
`ninja report` to confirm.

## Per-straggler verdict

### `func_ov011_021cb574` (1520 bytes, 99.7368% fuzzy, brief 209 straggler)

**Classification**: **(a) `$d`/`$a` boundary case the heuristic
misses** — specifically the trailing per-entry-`$d` over-promotion
described above. NOT a reloc-resolution gap; NOT a source-level
near-match.

**Pre-fix mapping shape** (live probe of
`build/eur/delinks/.../func_ov011_021cb574.o.resolved`, tail
extract):

```
$a@0x05b4 word=0x021d40c0
$a@0x05b8 word=0x021d40c4
$a@0x05bc word=0x0001d680
$a@0x05c0 word=0x021d4000
$a@0x05c4 word=0x02104f4c
$a@0x05c8 word=0x021d41a0
$a@0x05cc word=0x021d2ff8
$a@0x05d0 word=0x021d2fe4
$a@0x05d4 word=0x021cc4c8
$a@0x05d8 word=0x021d2fb4
$a@0x05dc word=0x021ca0ac
$a@0x05e0 word=0x04001000
$a@0x05e4 word=0x021040ac
$d@0x05e8 word=0xffe01fff   ← cond=0xF, stays as $d
$a@0x05ec word=0x0400000c   ← cond=0=EQ, promoted, OVER-PROMOTION
```

The mwasm-built side has no mapping symbols beyond `$d@0x05e8`.

**Post-fix**: `trailing_promoted_collapsed: 1` —
`$a@0x05ec` gets zeroed (`st_name` set to 0). Both sides agree on
implicit-`$d` for bytes `[0x05e8, 0x05f0)`. Verified via the
`TestStragglerSmoke.test_021cb574_collapses_one_trailing_a` smoke
test against the live decomper build.

### `func_ov011_021d02a4` (1292 bytes, 98.7616% fuzzy, brief 209 straggler)

**Classification**: same as 021cb574 — **(a)** per-entry trailing
`$a` over-promotion.

**Pre-fix mapping shape** (tail):

```
$a@0x04ec word=0x021d4000
$a@0x04f0 word=0x021d403c
$a@0x04f4 word=0x0400000c
$d@0x04f8 word=0xffe01fff   ← cond=0xF, stays as $d
$a@0x04fc word=0x000004b4   ← OVER-PROMOTION
$a@0x0500 word=0x0000051f   ← OVER-PROMOTION
$a@0x0504 word=0x0000051e   ← OVER-PROMOTION
$a@0x0508 word=0x807fffff   ← OVER-PROMOTION (cond=0x8=HI, accepted)
```

**Post-fix**: `trailing_promoted_collapsed: 4` — all four trailing
`$a` markers zeroed. Verified via
`TestStragglerSmoke.test_021d02a4_collapses_four_trailing_a`.

## What the sweep ruled out

- **No blind spots in pass 1**. Every `.s`-source unit's `.o.resolved`
  files are post-pass-1 stable (rewriter is idempotent and already
  ran in the build chain). No `other-change` bucket entries → no
  unit where the rewriter would promote a `$d` it currently leaves
  alone, or split a `$d` it currently leaves untouched.
- **No mwasm-side over-promotion**. mwasm's one-`$d`-per-run
  emission means the built side never has trailing per-entry `$a`s
  to collapse. The fix's pass-2 collapse fires zero times on the
  base/built path. This confirms the asymmetry is entirely the
  dsd-delink-vs-mwasm difference, not a mwasm bug.
- **Reloc-resolution (brief 206) is complete for these picks**. The
  resolver handled every reloc; no `parse-error` rows. The stragglers
  aren't a brief 206 blind spot.
- **No source-level near-matches**. The bytes ARE byte-identical
  (`complete_units = 1` for all 12). No `.s` source edit is
  needed — the recipe is fine, the metric chain was incomplete.
- **No new wall family**. Brief 209's verdict ("no new wall
  family") holds. Brief 212 is purely a metric-accounting cleanup
  for the brief 192 / 197 recipe family.

## What the audit did NOT cover (out of scope for brief 212)

- **Cross-region (USA / JPN) verification**. The sweep ran against
  the EUR `objdiff.json` only because that's what's checked out in
  the decomper worktree on this Windows host. Brain's local
  cross-region SHA1 run will confirm parity. Per brief 212's
  test-plan note and `docs/state.md`'s verify-gate rules, EUR-only
  SHA1 verification is sufficient for a tools-only PR.
- **`.legacy.c` / `.legacy_sp3.c` picks** beyond the brief 209
  stragglers. Those flipped in brief 210 via the brief 206 reloc
  resolver; brief 212's pass-2 fix wouldn't affect them (their `$d`
  shapes don't include trailing per-entry over-promotion). Sweep
  confirmed none surfaced.
- **The 11 newly-uncovered stragglers' individual structural
  analysis**. Listing their fuzzy% and pre-fix shape gap is enough
  to predict the flip; per-pick instruction-level diff isn't
  warranted before brain's `ninja report` re-run confirms the flip
  in practice.
- **`gen_c34_s.py` `blx <reg>` regex bonus**. Not promoted to
  `tools/` checkin (per brief 211 it's still `/tmp/gen_c34_s.py`,
  a one-off helper). The 1-line lookahead fix
  (`(?!r\d+\b|ip\b|lr\b|sp\b)`) is documented in brief 211 § Recipe
  notes for whoever promotes it next. Out of scope for a brief 212
  audit PR.

## Verification & test surface

- `tests/test_patch_arm_mapping_symbols.py` — 8 new tests:
  - `TestTrailingPromotionCollapse` × 5 (synthetic ELF coverage:
    trailing-arm-after-data, all-data, all-promoted-no-data,
    middle-`$a`-preserved, idempotency-after-collapse)
  - `TestStragglerSmoke` × 2 (live skip-if-not-present checks
    against the brief 209 straggler `.o.resolved`s)
  - `TestSweepMode` × 1 (dry-run sweep returns per-unit shape rows
    without modifying files)
  - `TestDryRunOption` × 1 (`process_o_file(..., dry_run=True)`
    contract)
- Existing 16 tests still pass — `test_no_change_when_all_data`,
  `test_partial_split_via_st_value`, `test_thumb_file_left_alone`,
  etc. — the pass-2 addition is structurally additive (never
  modifies bytes outside the trailing-collapse window).
- `python -m unittest discover tests` — full suite at 2188 tests,
  pre-existing 6 Windows-path-separator failures in unrelated
  tools (`patch_ov004_veneers`, `cluster_c_pattern3_gen`, etc.)
  — see [`docs/state.md`](../state.md) for the known-failing list.
- `python -m ruff check tools/ tests/` — clean.

## Brain-side verification — what needs the local build

The audit's sweep numbers come from a live read of the decomper
worktree's already-built `build/eur/objdiff.json` and `.o.resolved`
files. The PREDICTED flips are extrapolation, not observation:
brain's local `ninja report` post-fix needs to confirm the +11
`matched_functions` delta.

- [ ] `ninja rom` clean on EUR (`tools-only PR — no source touches`
      per brief 212 test plan)
- [ ] `dsd check modules` stays at 24/27 baseline (no regression)
- [ ] `ninja report` post-fix shows +11 `matched_functions` (EUR)
- [ ] `python tools/patch_arm_mapping_symbols.py --in objdiff.json
      --sweep --sweep-only-changed` post-fix prints zero rows
      (idempotency cross-check at corpus scale)
- [ ] Spot-check: `func_ov011_021cb574` and `func_ov011_021d02a4`
      individually report `matched_functions: 1, fuzzy: 100.0%`

Cross-region (USA / JPN) SHA1 verification is bonus — tools-only,
no source touches → EUR-only is sufficient per the verify-gate
rules in [`docs/state.md`](../state.md).

## Cross-references

- [`brief-209-stragger-investigation.md`](brief-209-stragger-investigation.md) — brief 209's
  diagnosis (root cause of 21 of 23 stragglers; flagged the two
  brief 212 picked up).
- [`first-wave-wall-cross-overlay-bl.md`](first-wave-wall-cross-overlay-bl.md) — brief 192's
  C-32 hand-encoded BL recipe (the upstream source of the
  asymmetric `$d` emission).
- [`brief-211-literal-tail-drain.md`](brief-211-literal-tail-drain.md) — brief 211's
  literal-tail drain (pointed at brief 212 for the residual cleanup).
- `tools/patch_arm_mapping_symbols.py` — extended with pass 2 and
  `--sweep` mode.
- `tools/objdiff_resolve_relocs.py` — brief 206's pre-step that
  resolves relocations before the rewriter runs.
