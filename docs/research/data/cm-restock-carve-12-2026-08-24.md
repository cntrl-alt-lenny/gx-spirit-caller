[//]: # (markdownlint-disable MD013)

# cm-restock-carve-12 — the group verifier ships; the pool it was built to drain is a clean 0-of-575 (2026-08-24)

Twelfth wave of the `cm-restock-carve` series. `cm-restock-carve-11`
sized this wave's target precisely: 576 windows / 3,069 symbols /
66,096 B that are geometrically composable (4-aligned both ends) but
blocked behind the standing wave-4 rule that an n>=3 composed group
must be compiled and its `.o` inspected before it is trusted. This
wave built the tool that automates that check, ran it across the full
pool, and got an honest, near-total rejection. That is the finding,
not a setback in reaching it.

## Part 1 — `tools/verify_composed_group.py`

Automates the exact "compile standalone (no link), inspect the `.o`"
method wave 3 established and wave 11 used by hand to root-cause the
`char[N]`-separate-section finding. For a candidate group:

1. **Same-size gate, before any compile.** Wave 11 proved differing
   size (even address-ascending) is unsafe for `char[N]` arrays; a
   mixed-size group is rejected immediately, no compile needed —
   most of the pool's rejections cost nothing.
2. **Compile via `asm_escape.compile_c`** — the SAME mwcc invocation
   the real build uses, never a hand-copied flag set.
3. **Parse `objdump -s -j .data`'s raw section dump** into one byte
   string per `.data` section, in file order. (Not `-t`/symbol-table:
   every declaration gets its own generically-named `.data` section
   per wave 11's finding, so there's no per-symbol section index to
   read from `-t` alone; raw content comparison is strictly stronger
   evidence anyway — it catches a content bug the offset-only check
   couldn't.)
4. **Section count == member count**, and **each section's content,
   in file order, exactly matches each member's own expected bytes,
   in address order.** A mismatch here is either a reordering (wave
   4's failure mode) or a genuine content bug in the generated
   source — either way, not shippable without investigation.

A pass proves the compiled *object* is correct; it does not prove the
*linked ROM* will be — that's what the canary gate is for. The
parser was verified against real captured `objdump` output before
being trusted, including the specific torture case natural-language
string content creates: an embedded space (or several consecutive
spaces) inside the content renders as a literal space in `objdump`'s
ASCII column, which would break a naive whitespace-split parser. The
parser splits on the *structural* boundary GNU objdump always uses
(2+ spaces separate the hex columns from the ASCII column; hex groups
are always single-space-separated) rather than tokenizing on all
whitespace, so it's correct regardless of what the string content
itself contains.

30 unit tests (`tests/test_verify_composed_group.py`): the PURE layer
(escaping, source rendering, section parsing, pass/reject
classification) fully covered with fixtures — including two real
compiled-object smoke tests exercising the actual toolchain (skipped
cleanly if it isn't downloaded).

## An avoided repeat: the "8 same-size bonus pairs" that weren't

Re-deriving the pool fresh after wave 11's 46 shipped symbols dropped
out of the candidate set exposed 8 new-looking n=2 windows with
ascending-but-unequal member sizes. **These are not new — they are
the exact 8 windows `cm-restock-carve-11` already tested and
declined** (the ones that produced the 93 MB EUR divergence). The
first pass at this wave's own re-tiling script reused wave 11's
original (since-corrected) `size[0] <= size[1]` classification instead
of the fixed `size[0] == size[1]` rule, which would have re-flagged
these as "safe" and shipped the exact disproven pattern a second
time. Caught by inspecting the actual candidate content before
generating any files, not by a later gate failure. Fixed before
compiling anything: **zero of the 8 are genuinely new or safe; they
remain correctly declined, unchanged from wave 11's own disposition.**

## Part 2 — running the verifier across the 576-window pool

Fresh census (own measurement): the non-4-aligned `string`/
`string-ascii4` pool, post wave-11 shipment, is **3,141 symbols /
67,553 B** (down from wave 11's 3,187 / 68,613 by exactly wave 11's
own 46-symbol / 1,060 B shipment — clean reconciliation, no
correction needed). Re-tiled into the same window classes:

| Class | Windows | Symbols | Bytes | Disposition |
|---|---:|---:|---:|---|
| n=2, ascending-unequal size | 8 | 16 | 396 | Still declined — wave 11's own disproven class, not re-attempted |
| n=2, descending size | 17 | 34 | 668 | Still declined — P-50, permanent |
| n>=3, geometrically composable | 576 | 3,069 | 66,096 | **This wave's target** |
| Unreachable from run start | — | 22 | 393 | Needs backward absorption, still untested |

Of the 576 n>=3 windows, 575 passed the standard per-candidate content
checks this series has used since wave 9 (zero internal relocs, real
bytes from `arm9.bin`, clean null-terminated padding, zero overlap
against any existing TU); 1 (`data_020cdcd0`) failed on dirty padding
and was excluded before verification even started.

**Verifier result on the 575 content-valid windows: 0 pass.**

| Rejection reason | Count |
|---|---:|
| Mixed sizes (rejected before compiling) | 561 |
| Same size, but compiled section content/order mismatch | 14 |
| **Pass** | **0** |

**The 66,096 B figure does not materialize under any currently-known-
safe recipe.** 561 of 575 fail on the same-size requirement wave 11
already established as necessary (natural strings essentially never
cluster into groups of 3+ with identical byte length). The remaining
14 same-size groups — the ones that COULD have worked if same-size
generalized cleanly from n=2 to n>=3 — all failed anyway.

## New finding: same-size does not generalize from n=2 to n>=3 either

Confirmed directly, not inferred from the 14 rejections alone: two
synthetic 3-member same-size (8 B each) groups were compiled and
inspected by hand before trusting the verifier's own logic.

- `zebra` / `apple` / `mango` (declared in that address order)
  compiled to file order `apple` / `zebra` / `mango`.
- A separate synthetic group (`foo` / `barbaz`-truncated /`qux`)
  compiled to `barbaz` / `foo` / `qux`.

Neither declaration order, alphabetical content order, nor byte-value
order predicts either output — `apple` correctly sorts first in both
a real and a naive-alphabetical reading, but `zebra`/`mango` land
backward from every simple ordering rule tried. This looks like an
internal hash-bucket order intrinsic to mwcc's string-literal table
management (plausibly related to the `-str noreuse` flag's own
literal-tracking machinery), not a predictable, exploitable pattern.
**A real wave-11 n=2 same-size pair, compiled the identical way,
correctly preserved declaration order** — confirming this is
specifically an n>=3 phenomenon, the same shape as wave 4's original
struct-type finding ("mwcc doesn't preserve declaration order for
n>2 groups") now independently confirmed for a mechanistically
different underlying cause (separate sections per declaration, not
offsets within one section).

**No source-level workaround was found or is expected**: since the
reordering doesn't follow any externally-predictable key, there's no
way to pre-arrange declaration order to compensate. The only way to
know whether a specific n>=3 group is safe is to compile it and check
— exactly what `verify_composed_group.py` now does, and the honest
answer for this entire pool is that none of it passes.

Folded into `alignment-wall-tu-composition-recipe.md`'s own "wave 12
update" section so a future wave consulting the canonical recipe
directly (not this wave-specific writeup) gets the corrected scope
where it will actually look for it.

## Result: 0 symbols shipped this wave

No `.c` files, no `delinks.txt` changes. This wave's deliverable is
the verifier tool (durable, reusable, tested) and the honest census +
null result it produced — not a byte count. Per the kickoff's own
framing: "if the verifier rejects most of the 576, that is the finding
and the byte figure comes down accordingly. Say so plainly with the
count." The count is 0.

## Gate

Full 3-region clean-tree gate (`python tools/gate3.py --scope all
--clean`) — run to confirm the new tool + tests introduce zero
regression to the byte-identical build, even though no
ROM-affecting file changed:

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

pytest tail:

```
3399 passed, 15 skipped, 76 subtests passed in 222.21s (0:03:42)
[pytest] OK
```

## Named-struct / Typed-array, before -> after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via an actual `git stash push -u` / `pop`:

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | 211,020 | 211,020 | **+0** |
| `named_struct_bytes` | 73,876 | 73,876 | **+0** |

Zero delta, exactly matching zero files shipped.

## What this unlocks (scoping only, not this wave's to execute)

- **`tools/verify_composed_group.py` is durable, general-purpose
  infrastructure.** It doesn't care what shape's candidates it's fed
  — any future composition attempt (a different shape, a different
  module, even a future re-test of the descending/differing-size
  classes if some other fix is ever found) can reuse it directly
  instead of re-deriving the compile-and-inspect method by hand.
- **The 576-window / 66,096 B pool is now known, not estimated, to be
  unreachable via same-size n>=3 composition.** A future wave
  shouldn't re-attempt this exact approach without a genuinely new
  idea (e.g. a compiler flag that disables mwcc's internal string
  literal reordering, if one exists and can be verified not to affect
  already-shipped output) — re-running the same verifier against the
  same pool would reproduce the same 0.
- The 8 declined ascending-unequal-size and 17 descending-size n=2
  pairs, and the 22 unreachable-from-run-start symbols, are unchanged
  from wave 11's own disposition — still open, still needing the
  untested backward-absorption half or a genuinely new mechanism.
- `cm-restock-carve-13` (this round's second item) takes the
  non-string shapes instead — a different pool, unaffected by this
  wave's null result.

## Cross-references

- [`alignment-wall-tu-composition-recipe.md`](../alignment-wall-tu-composition-recipe.md) —
  updated with this wave's finding (same-size necessary but not
  sufficient for n>=3).
- [`../codegen-walls.md`](../codegen-walls.md) — P-50 and the original
  wave-4 n>=3 struct-reordering finding this wave's result echoes for
  a different C type.
- [`cm-restock-carve-11-2026-08-24.md`](cm-restock-carve-11-2026-08-24.md) —
  the wave that sized this pool and found the differing-size wall.
