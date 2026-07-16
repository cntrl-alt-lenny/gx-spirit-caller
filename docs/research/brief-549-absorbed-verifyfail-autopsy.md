[//]: # (markdownlint-disable MD013 MD041)

# Brief 549 — the absorbed verify-fail class: a comparator bug, not a codegen wall

**Status:** brief 549 (2026-07-08), wine-free static inspection PLUS a
handful of individual `asm_escape.py` diagnostic invocations (the exact
method the brief's own kickoff specifies — not a real carve, not
`ninja sha1`, not a batch/build; the same class of exception briefs 543
and 547 already used for this same tool). No `delinks.txt` write, no
commit, no `ninja sha1` — zero contention with the scaffolder's live
drain.

## Verdict

**Brief 546's "0 of 4 absorbed-routed attempts shipped" was never a
codegen problem. It's a bug in `asm_escape.py`'s own self-verification
check — the tool falsely reports "did NOT verify" for every single
`--allow-absorbed-offset` substitution, even when the assembled bytes
are provably correct.** Root-caused, fixed, and unit-tested in this
brief; **9 of 9 sampled real candidates** (the exact 2 ov002 functions
brief 546 hit, both regions, plus 5 of main's 26, spanning every
ref-count and size class present in the REFUSE population) now report
`✅ byte-identical` through the fixed tool. The realistic correction to
brief 547's "60/60 recoverable" census: **still 60/60 — the number was
right, but "recoverable" needs the comparator fix landed to actually
manifest as ships**, not evidence of genuine walls as brief 546 might
have suggested.

## Background — restating the problem precisely

Brief 545 wired `asm_escape.py --allow-absorbed-offset` into
`batch_carve.py`: a purely-`C-absorbed` REFUSE (brief 543's proven
`.word base+0xN` substitution) now routes through `whole_function()`
instead of parking immediately. Brief 546 was the first live wave to
actually reach a `C-absorbed`-REFUSE candidate under this wiring:
`func_ov002_022626c4` and `func_ov002_022b9434` (identical addresses,
USA and JPN — ov002 shares EUR-baseline code across regions), both
routed through the flag, both **verify-failed**, 0 of 4 shipped. Brief
547's wine-free `--dry-run` census then reported "60/60 REFUSEs
recoverable, 0 walls" across the whole drain scope — but that census
only ran `classify()` (is the REFUSE *shape* purely `C-absorbed`?), and
explicitly flagged its own caveat: `--dry-run` never calls
`whole_function()`, so its optimism is unattempted. Brief 546's live
result is the concrete case where that caveat bit: the shape check said
recoverable, the real attempt said verify-fail. This brief investigates
why.

## Method

Per candidate: `asm_escape.py --classify-data` (wine-free) to confirm
the exact base/offset; `asm_escape.py --whole-function
--allow-absorbed-offset` (needs wine to assemble+verify — the brief's
sanctioned diagnostic, not a real carve) to see the generated `.s`, the
tool's own byte-compare verdict, and (via `build/_asm_escape/*.asm.o`)
the actual assembled relocation; `arm-none-eabi-objdump -d -r -z` on
both the assembled object and the original delinked gap object
(wine-free) to manually cross-check every word.

## Root cause

`asm_escape.py`'s `diff_words()` compares literal-pool relocations by
**symbol name string**, not resolved address (`x["reloc"] !=
y["reloc"]`, `tools/asm_escape.py:540` before this fix) — a deliberate
design choice (pool words are unresolved placeholders pre-link, so raw
bytes can't be compared; the docstring calls this "reloc words
modulo"). For every *other* reloc in the codebase this is correct: two
different symbol names really do mean two different targets.

The `--allow-absorbed-offset` substitution (brief 541/543) breaks that
invariant on purpose: the assembled side's reloc names the **base**
symbol (`data_X`, with a nonzero addend, e.g. `+0xc34`), while the
original delinked object's reloc names the **absorbed** symbol
(`data_Y`) that expression was substituted for. Different strings,
**same resolved address** (`base + 0xc34 == absorbed`, proven against
the real assembler+linker for all 15 shipped `ov004`/`ov006` functions
in brief 543). `diff_words()` has no way to know this — it just sees
two different symbol names and flags a mismatch, **every single time**,
for every candidate that uses the substitution, regardless of whether
the real link would succeed.

**Compounding factor:** `parse_objdump()` (`tools/asm_escape.py:143`,
pre-fix) actively *discarded* the addend when parsing a reloc line
(`re.sub(r"[+-]0x[0-9a-f]+$", "", ...)`, stripping `+0xc34` before
storing `reloc`) — so even a hypothetical fix that only compared base
symbol names would have been unable to also verify the OFFSET was
correct, silently trusting whatever `resolve_absorbed_substitutions()`
computed.

Brief 543 personally routed around this exact false mismatch by
verifying via a real `ninja sha1` build instead of trusting the tool's
own printed verdict — but `batch_carve.py`'s `Ops.whole_function()`
(brief 545) only ever checks whether `asm_escape.py`'s own stdout
contains `"byte-identical"` or `"✅"`. Since that string can **never**
appear for a substituted candidate under the old comparator, brief
545's wiring was structurally incapable of shipping *any* recovered
`C-absorbed` candidate through the automated pipeline — brief 546's
0-for-4 wasn't these two functions being special; it was every future
attempt hitting the same guaranteed false negative.

## Per-case findings

### `func_ov002_022626c4` (USA + JPN, identical addresses)

184-byte function fully re-verified word-for-word against the original
delinked object: **every one of the 22 words matches byte-for-byte**
except the substituted pool word. Base `data_ov002_022cac38`, absorbed
`data_ov002_022cb86c`, offset `0xc34` — `0x022cac38 + 0xc34 =
0x022cb86c` exactly. The absorbed symbol is the base of an indexed
function-pointer table (`ldr r2, [pc,#…]` then `ldr r1, [r2, r1, lsl #2]`
then `blx r1`) — array-base semantics, not a scalar load; the
substitution is correct regardless. Pre-fix: `[21] reloc
data_ov002_022cac38 vs data_ov002_022cb86c`. Post-fix: `✅
whole-function .s byte-identical vs delinked .o (22 words)`.

### `func_ov002_022b9434` (USA + JPN, identical addresses)

136-byte function. Base `data_ov002_022ccc30`, absorbed
`data_ov002_022ccd34`, offset `0x104` — `0x022ccc30 + 0x104 =
0x022ccd34` exactly. Pre-fix: `[33] reloc data_ov002_022ccc30 vs
data_ov002_022ccd34`. Post-fix: `✅ whole-function .s byte-identical vs
delinked .o (34 words)`.

### `main` sample (5 of 26, USA — chosen to span the full shape space)

| Func | Size | Refs | Offsets | Pre-fix diff count | Post-fix |
|---|---:|---:|---|---:|---|
| `func_02048950` | 0x34 (smallest) | 1 | `+0x4` | 1 | ✅ |
| `func_0207e0dc` | 0x50 | 2 | `+0x1c`, `+0x8` | 2 | ✅ |
| `func_0207de38` | 0x188 | 3 (+1 direct, unsubstituted, ref to the same base) | `+0x4c`, `+0x34`, `+0x8` | 3 | ✅ |
| `func_020a8c5c` | 0x824 | 2 | `+0x4`, `+0x8` | 2 | ✅ |
| `func_020ae380` | 0x8f0 (largest) | 1 (+1 direct A-aligned ref to the same base) | `+0x4` | 1 | ✅ |

Every substitution's arithmetic checked out exactly (offset table
above cross-verified against each `.s` file's `_LITn: .word
base+0xN` lines). `func_0207de38` and `func_020ae380` both also
directly reference their own base symbol elsewhere in the same
function (the exact "coincidental extra reference" shape that
originally masked brief 543's separate `.extern`-list bug) — confirms
that fix (brief 543) is holding correctly here too; this brief's fix
is orthogonal to it.

**9 of 9 sampled candidates, 0 exceptions, 0 residual diffs of any
other kind** — every mismatch the pre-fix comparator reported was
*exclusively* the substituted-reloc false positive, never a real byte
difference. All 26 `main` REFUSEs classify as purely `C-absorbed` (no
`OFFSET`/`MISADDRESSED` mixed in, confirmed via direct
`classify_data_refs()` calls over the full population, not just the
5 sampled) — structurally identical to the two ov002 cases and the 15
already-shipped `ov004`/`ov006` walls.

## The fix

`tools/asm_escape.py`, three small, additive changes:

1. **`parse_objdump()`** now captures the reloc's addend as a separate
   `reloc_addend` field (e.g. `"+0xc34"` or `None`) instead of
   discarding it — `reloc` itself is unchanged (still the bare base
   symbol name), so every existing caller/test is unaffected.
2. **`diff_words()`** gains an optional `absorbed_subs` parameter (the
   same `{absorbed_sym: "base+0xN"}` map `emit_asm()` already uses to
   build the substituted `.word` line). When a reloc mismatch's
   *original*-side symbol is a key in `absorbed_subs`, and the
   *assembled*-side's `reloc + reloc_addend` **exactly** equals the
   recorded substitution string, it's accepted as the known,
   proven-equivalent false positive — not silently, but keyed and
   value-exact per substitution, mirroring the existing `self_func`
   narrow-equivalence pattern one function up. A wrong base OR a wrong
   offset still correctly flags (unit-tested explicitly — this is the
   integrity-preserving half of the fix, not just the happy path).
3. **`bytes_match()` / `generate_whole()`** thread `absorbed_subs`
   through to `diff_words()` — `generate_whole()` already computes the
   map for the substitution itself, so this is a one-line pass-through
   at each of the two call sites (`generate()`'s canonicalisation-hatch
   mode, unrelated to this class, is untouched).

## Verification

| Check | Result |
|---|---|
| New unit tests (`TestDiffWordsAbsorbedSubstitution`, 6 tests: correct substitution matches, wrong offset still flags, wrong base still flags, unrelated symbol still flags, `absorbed_subs=None` preserves old behavior exactly, multiple substitutions + one direct ref in one function all resolve) | 6/6 pass |
| `tests/test_asm_escape.py` | 65 passed (was 59; +6) |
| full `tests/` suite | 2471 passed, 6 skipped (pre-existing, environment-only) |
| `func_ov002_022626c4`, USA — real re-verify against the fixed tool | ✅ byte-identical (was ❌, brief 546) |
| `func_ov002_022626c4`, JPN | ✅ byte-identical |
| `func_ov002_022b9434`, USA | ✅ byte-identical (was ❌, brief 546) |
| `func_ov002_022b9434`, JPN | ✅ byte-identical |
| 5 sampled `main` REFUSEs (1-3 refs each, 0x34-0x8f0 bytes) | 5/5 ✅ byte-identical |
| Emitted `.s` content, pre-fix vs post-fix | byte-identical (`diff` clean) — the fix changes only the comparator, never what gets shipped |
| Real `ninja sha1` on any of these 9 (the ultimate proof) | **not run** — wine-free brief by design; see "What's still open" |

## The corrected ship-vs-verify-fail split

Brief 547's census: 60 REFUSEs (30/region: `ov002`'s 4 + `main`'s 26),
reported as "100% recoverable, 0 walls" from `classify()`'s shape check
alone. Brief 546 then showed 0/4 real attempts shipping, which without
this autopsy would read as "the census was badly wrong — treat
`C-absorbed` REFUSEs as still-parked pending investigation."

**With this fix: the realistic split is still 60/60 shippable, 0
genuine walls** — brief 547's shape-based census was correct; what was
missing was the tool being ABLE to confirm it end-to-end. 9/9 sampled
candidates (covering both ov002 cases brief 546 actually hit, plus a
main sample spanning 1-3 refs and the full size range 0x34-0x8f0)
show zero counter-evidence, and the mechanism is address-arithmetic
based, not per-function content — there's no structural reason for it
to hold for 9 wildly different candidates and then fail for the
remaining 21 unsampled ones. This is a systematic comparator fix, not
a per-case patch.

## What's still open — the honest gap

**This brief cannot itself prove a real link succeeds** — `diff_words`
is a pre-link, symbolic comparator; the only fully authoritative proof
is a real `ninja sha1` after staging a candidate into `delinks.txt`
(brief 543's own standard). That is explicitly out of scope here (wine-
free by the brief's own charter, zero contention with the live drain).
**Next step for a wine-enabled brief or the scaffolder's next wave:**

1. Confirm this fix is merged into the branch/worktree in use.
2. Stage `func_ov002_022626c4` (or any one candidate) into `ov002`'s
   `delinks.txt` via the normal `--allow-absorbed-offset` path, run the
   region `ninja sha1` gate — the exact brief-543 playbook, one
   candidate, before trusting the fix for a real wave.
3. If green: the fix is fully proven; `batch_carve.py`'s next wave
   against `ov002`/`main` should now show `absorbed-routed` converting
   to real `SHIPPED` counts instead of `verify-fail` — worth a one-line
   note in that wave's own report confirming the flip, closing the loop
   brief 546 opened.

No `asm_escape.py`/`batch_carve.py` behavior changed for any candidate
OUTSIDE the `C-absorbed` substitution path — `absorbed_subs` defaults
to `None` everywhere, and `None` reproduces the exact pre-549 diff
output (unit-tested explicitly).

## Files changed

- `tools/asm_escape.py` — the three changes above (the only behavioral
  code change).
- `tests/test_asm_escape.py` — 6 new tests.
- `docs/research/brief-549-absorbed-verifyfail-autopsy.md` — this doc.

Nothing under `src/`, `config/`, or any `delinks.txt` touched — no
carve, no commit beyond this doc, no `ninja sha1` run.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
