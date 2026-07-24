# Brief 663 — main unknown pool, batch 2 (queue item cm-unknown-main-655-batch2)

**Result: 14/17 shipped (82%), 3 documented near-misses, 3-region gate PASS.**

## Method

Sampled main's `unknown` pool (per `wall_aware_headroom.py --json`,
`main.unknown_files`) in the 650–780 byte tier — the next size tier up
from what briefs 640/655 already covered (roughly 500–650 bytes).
Header-read every candidate before compiling; skipped genuine walls
(raw `.word` cross-function branches) without attempting them.

### Measurement correction

The original 650–780 B label used the `.s` file's on-disk byte length because
the selector emitted paths only. It therefore does **not** establish a
650–780 B `.text` tier. Re-run any comparison with
`wall_aware_headroom.py --json` and sort the emitted `text_size` field; the
historical 14/17 result remains a disk-size-selected sample, not a validated
`.text`-size experiment.

## Ships (14)

| Function | Shape | Notes |
|---|---|---|
| `func_020949f0` | struct-field writer | first try, 100% |
| `func_02090624` | IRQ mask-enable (IME/IE bracket) | `.legacy.c` tier fix |
| `func_0209065c` | IRQ set (IME/IE bracket) | sibling of above, `.legacy.c` |
| `func_020905a8` | IRQ set (IME/IF bracket) | sibling, `.legacy.c` |
| `func_0207db44` | linked-list broadcast+anchor update | decl-order lever |
| `func_020aac84` | variadic-forwarding thunk (2 fixed args) | manual va_list arithmetic |
| `func_020aeda4` | variadic-forwarding thunk (3 fixed args) | zero-shot sibling of above |
| `func_0209413c` | clear-flag + conditional callback | `.legacy.c`, write-order lever |
| `func_02053650` | two-call boolean helper | converge-to-return lever |
| `func_0205d688` | pointer-to-pointer + output-buffer call | `.legacy_sp3.c` tier |
| `func_02065974` | triple-pointer-chain fallback | first try, 100% |
| `func_0208822c` | bounds-checked byte-table shift dispatch | `.legacy_sp3.c`, first try |
| `func_0206b7d8` | address-taken-param + callback dispatch | all-4-regs-spilled lever |
| `func_02065e40` | flag-guarded cleanup call | `.legacy_sp3.c`, first try |

All 14 ported to USA + JPN (28 additional objects), each individually
verified 100% via objdiff before the final gate.

## New levers found

1. **Default-tier literal-pool over-folding.** For two absolute MMIO
   constants close together (e.g. `0x04000208`/`0x04000210`, 8 bytes
   apart), the default `2.0/sp1p5` compiler recognizes the numeric
   relationship and folds them into one pool literal + register
   offset. Ground truth (confirmed via ground-truth sibling
   `func_020905dc.s`, itself unconverted) always uses two independent
   literal loads for this MMIO pattern. **Fix: route through
   `.legacy.c` — the older compiler doesn't perform this fold.**
   Distinct from the epilogue-shape wall (`cm-epilogue-wall`,
   already-cracked this campaign) — same routing-tier mechanism, a
   different observable effect. See `func_02090624`/`func_0209065c`/
   `func_020905a8`.

2. **Variadic-forwarding thunk shape, no `stdarg.h` needed.** This
   toolchain has no real `stdarg.h` (only a pycparser stub used by an
   unrelated tool). The `va_start`-equivalent pointer is reproduced
   exactly with plain arithmetic:

   ```c
   void thunk(int a0, ..., int aN, ...) {
       unsigned int addr = ((unsigned int)&aN & ~3) + sizeof(aN);
       calleee(a0, ..., aN, (void *)addr);
   }
   ```

   Keeping the real `...` in the declaration is what makes the
   compiler emit the standard `stmdb sp!,{r0-r3}` / `stmdb sp!,{r3,lr}`
   argument-spill prologue; the align-down-then-add algebraic *order*
   matters (round-up-then-mask emits an extra `add`/different
   immediate that doesn't match). Confirmed on 2 siblings
   (`func_020aac84`, `func_020aeda4`), second one zero-shot.

3. **Address-of-any-parameter spills all 4 argument registers.**
   `func_0206b7d8` takes only 2 real parameters, but its second
   parameter's address is taken (`&a1`) and passed as an output
   pointer to a helper. mwcc spills **all four** incoming argument
   registers (`stmdb sp!,{r0,r1,r2,r3}`) to build the home-slot area,
   not just the one whose address was taken — r2/r3 are spilled and
   never read. First-try 100% once modeled this way.

## Parked near-misses (3)

| Function | Match% | Diagnosis |
|---|---|---|
| `func_0209a8d0` (list append) | 73.68% | Guard-clause early return compiles to a **branch** in target; both nested-if/else and early-return C forms predicate it instead (identical wrong output both ways). Tail computation fixed via reusing the loop's already-zero terminator value instead of a fresh literal 0. |
| `func_0209a884` (list remove) | 0% (structural) | Two sequential null-guards predicate together in our compile; target keeps them as two separate branches to a shared tail. Same family as above, opposite of the `func_02053650`/`func_0206df54` direction. |
| `func_0206df54` (bool AND-chain) | 40% | Three sequential guards want branches to a shared tail block; both early-return and converged if/else forms predicate the first two guards identically. Reg-alloc-insensitive, matches lever-payoff.md's C-1r pattern but for 3-guard chains specifically. |

These three are the mirror image of the `func_02053650`/`func_0206df54`-style
fix (converge-to-return defeats *unwanted* predication) — here predication is
unwanted but the same lever has zero effect. Worth a fresh angle in
`cm-nearmiss-backlog` (e.g., permuter, or explicit `goto` to a shared
label instead of structured control flow).

## Tooling gotcha: delinks.txt patch must replace the FULL body block

`port_to_region.py` prints a `delinks_entry` (3 lines: header + `complete`
+ `.text start/end`) that must overwrite the **entire** old entry — not just
its header line. A naive `old_header_line + "\n"` → `new_block` string
replace leaves the old entry's `complete` / `.text start:...end:...` lines
behind, producing a corrupted delinks.txt that parses fine per-line but
crashes `dsd delink` at full-rebuild time with `Error: Section '.text'
already exists` (a native panic with an unsymbolized backtrace — no
address or file named). Symptom is easy to miss: incremental
`ninja build/<region>/.../<f>.o` builds for the freshly-ported files
succeed and objdiff 100% (they reuse cached ground-truth `.o`s from
before the corruption), and `check_delink_dupes.py` on the top-level
`arm9/delinks.txt` alone reports OK too, since it only tracks
address-to-file mapping, not duplicate line bodies within one file's
own block. **Only a full clean gate (`gate3.py --scope all`, which
forces `dsd delink` to regenerate from scratch) surfaces it.** Fix: the
patch must consume old-header-line-through-old-`.text`-line as one unit,
not just the header.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN sha1 all OK) after the delinks.txt fix.
