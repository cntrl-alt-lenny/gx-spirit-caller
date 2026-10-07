Tool: Codex desktop; model: gpt-6.1-sol; reasoning effort: medium.

# Batch 06 Worker handoff

Branch `worker/batch-06`, based on `0cc273a7a`. Walked all 58 assigned
convertible entries in address order through **0x0207ff84**: 55 attempted,
37 matched at 100%, 18 parked and three skipped. Matches add **4,484 B** of
natural C. Each match has its own function commit and shipped ledger row;
every failed compiler tier has a parked row. No merge was performed.

## Matched functions

All final fastmatch scores are 100.0%. Five callers were subsequently corrected
to use the existing matched callee prototypes and re-scored at 100.0%; the
`func_0207845c` named-reference correction also re-scored at 100.0%, but was
subsequently reverted after link failure. `legacy` means `.legacy.c`; `legacy_sp3`
means `.legacy_sp3.c`. Each tier was selected after the measured default
failure below, using the original instruction/frame evidence stated.

| Function | Bytes | Tier | Evidence for tier after default attempt |
|---|---:|---|---|
| func_02070a38 | 136 | legacy | Default 0%; Original uses a 4-byte stack slot and `bx lr`; default frame differs. |
| func_02070b4c | 96 | legacy | Default 0%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02072144 | 240 | legacy | Default 38.3%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02072444 | 132 | legacy | Default 21.2%; Original signed divide-by-four correction shifts and loop instruction order; default instruction selection differs. |
| func_020724c8 | 124 | legacy | Default 0%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_020736ac | 140 | legacy | Default 2.9%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207391c | 96 | legacy | Default 12.5%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207397c | 224 | legacy | Default 5.3%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02073dcc | 136 | legacy | Default 8.8%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02074088 | 60 | legacy | Default 46.7%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_020745fc | 240 | legacy | Default 18.3%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207475c | 132 | legacy | Default 93.9%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02075d74 | 128 | legacy | Default 3.1%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02076c5c | 100 | legacy | Default 48%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02077b98 | 112 | legacy | Default 7.1%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02078ccc | 100 | legacy | Default 4%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02078d30 | 88 | legacy | Default 0%; Original uses a 4-byte stack slot and `bx lr`; default frame differs. |
| func_02078d88 | 68 | legacy | Default 82.3%; Original rotate/OR order and repeated load; default substitutes a move and changes instruction order. |
| func_02078dcc | 112 | legacy | Default 25%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02078f50 | 96 | legacy | Default 91.7%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02079984 | 132 | legacy | Default 0%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02079b48 | 116 | legacy | Default 51.7%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02079bbc | 184 | legacy | Default 54.4%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02079cc0 | 112 | legacy | Default 50%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_02079d30 | 172 | legacy | Default 55.8%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207b13c | 80 | legacy | Default 0%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207b548 | 176 | legacy | Default 0%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207c3b0 | 212 | legacy | Default 7.5%; Original restores `lr` then `bx lr`; default return/frame differs. |
| func_0207cff4 | 104 | legacy_sp3 | Default 0%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207dc5c | 76 | legacy_sp3 | Default 5.3%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207deb0 | 32 | legacy | Default 25%; Original has eight words and separate stores; default coalesces stores into six words. |
| func_0207e124 | 160 | legacy_sp3 | Default 0%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207e1c4 | 80 | legacy_sp3 | Default 0%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207e54c | 72 | legacy_sp3 | Default 5.6%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207e664 | 72 | legacy_sp3 | Default 5.6%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207e6f0 | 72 | legacy_sp3 | Default 5.6%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |
| func_0207e748 | 72 | legacy_sp3 | Default 5.6%; Original omits padding `r3`, uses `sub sp,#4`, and restores `pc`; default frame differs. |

## Attempted but not shipped

| Function | Bytes | Default best % | Legacy best % | SP3 best % | Remaining obstacle |
|---|---:|---:|---:|---:|---|
| func_0207084c | 224 | 0 | 66.1 | — | reg-alloc-instr-scheduling |
| func_0207103c | 80 | 5 | 40 | — | reg-alloc-instr-scheduling |
| func_02073f28 | 92 | 0 | 95.7 | — | P-17-commutative-add-operand-order |
| func_02077018 | 116 | 10.3 | 83.9 | — | structural |
| func_02077a28 | 96 | 0 | 75 | — | reg-alloc-instr-scheduling |
| func_02077b5c | 60 | 73.3 | 73.3 | — | reg-alloc-instr-scheduling |
| func_0207845c | 60 | 0 | 100 (object only) | — | Named-reference link blocker; restored assembly. |
| func_02078eec | 28 | 0 | 0 | — | structural |
| func_0207c484 | 104 | 11.5 | 23.1 | — | reg-alloc-instr-scheduling |
| func_0207c4ec | 132 | 9.1 | 39.4 | — | structural |
| func_0207d3ac | 132 | 24.2 | — | 33.3 | reg-alloc-instr-scheduling |
| func_0207d458 | 60 | 53.3 | — | 60 | reg-alloc-instr-scheduling |
| func_0207e0a8 | 124 | 3.2 | — | 15.6 | structural |
| func_0207e594 | 164 | 53.5 | — | 58.1 | structural |
| func_0207ef90 | 204 | 0 | — | 15.7 | structural |
| func_0207f05c | 220 | 0 | — | 7.3 | structural |
| func_0207f510 | 256 | 0 | — | 45.3 | reg-alloc-instr-scheduling |
| func_0207ff84 | 116 | 0 | — | 6.9 | structural |

## Walked but not attempted

| Function | Bytes | Reason |
|---|---:|---|
| func_02074e4c | 12 | Shared epilogue: stack adjustment, register restore and return; no independent prologue or C function body. |
| func_0207708c | 8 | Shared epilogue: register restore and return; no independent prologue or C function body. |
| func_0207fd60 | 68 | Original passes a second value to func_0207fd48, whose existing matched C prototype takes only one argument. Respecting that prototype cannot express this caller; repairing it is outside this batch. |

No assigned entries remain beyond the final walked address. The two permanent
exclusions `func_0207db8c` and `func_0207dbf8` were outside the assigned 58.
All 21 parked/skipped entries retain their original assembly and exact routing.

## Acceptance evidence

The full gate, final 37-function fastmatch sweep and other checks below ran on
last code commit **`6822eacc4e576780d2e950f4478e0baf36fb4249`**. The final summary commit changes only this
document. The gate was run unpiped:

```text
DYLD_LIBRARY_PATH=/opt/homebrew/lib python3.13 tools/gate3.py --scope all --log ../gate-batch-06.log
```

The prescribed macOS log check (exit 0):

```text
grep -nE "SHA1 (PASS|FAIL)|INFRASTRUCTURE|CLEAN-FAIL|SKIP|GATE [A-Z]+|[0-9]+ (passed|failed)" ../gate-batch-06.log
13902:[eur] SHA1 PASS
28662:[usa] SHA1 PASS
54683:[jpn] SHA1 PASS
54723:1331 passed, 14 skipped, 132 subtests passed in 25.95s
54726:==================== GATE PASS ====================
54727:gate3: GATE EXIT 0
```

`tail -n 1 ../gate-batch-06.log` (exit 0) printed `gate3: GATE EXIT 0`.
No region was skipped. Gate exit: **0**.

| Check | Exit | Real output |
|---|---:|---|
| Final `fastmatch.py eur` sweep over retained C files | 0 | 37 functions, each `100.0% OK` (resolved). |
| `check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` (existing warnings; no errors) |
| `validate_attempts.py` | 0 | `"rows": 2101, "errors": 0, "shape_migrations": 0, "shape_conflicts": 66` (existing conflicts, none in batch-06) |
| Gate reference check, all three regions | 0 | `32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 412 (baseline entries 5926)`; `check_references: OK` |
| Gate fake-match lint | 0 | `raw-data-directive 0, data-in-text 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`; `check_fake_matches: OK` |
| Gate `python3.13 -m pytest -q tests` | 0 | `1331 passed, 14 skipped, 132 subtests passed in 25.95s` |
| `python3.13 -m unittest discover -s tests` | 0 | `Ran 1345 tests in 22.348s`; `OK (skipped=14)` |
| `python3.13 -m ruff check .` | 0 | `All checks passed!` |
| `progress.py --version eur` | 0 | `Natural-C: 428966 / 2385948 bytes (17.98%)` |

All project scripts used Python 3.13. Natural-C before at `0cc273a7a`:
**424,482 B**; after at the checked commit: **428,966 B**, gain **4,484 B**.
The progress tool identifies its source as
`delinks.txt (approximate — run ninja report locally for objdiff-verified numbers)`;
the independent final sweep verifies all 37 new C functions at 100%.
Coverage audit: **58 = 37 retained C + 18 parked + 3 skipped**; all 21 remaining
assembly files are byte-identical to the base, routing spans are preserved, and
the pre-batch ledger prefix is byte-identical. No baseline lines were pruned.


## Limitations and review notes

- Brain's libzstd workaround is required on this Mac:
  `DYLD_LIBRARY_PATH=/opt/homebrew/lib` for fastmatch, reference checking and
  the gate. `download_tool.py` omitted the library required by objdump; no
  software was installed and no tool was patched. A stale graph from the first
  parked draft was resolved by authorized `configure.py eur`. The known match
  `func_02032b30.c` then scored `100.0% OK` before work resumed.
- The initial `func_0207084c` tool-anomaly row's zero is an unscored placeholder.
  The resumed default zero and legacy 66.1% are measured scores; all rows were
  retained. Append-only correction rows classify the earlier `func_02078d88`
  default score as instruction-selection and `func_02078eec` default score as
  structural. They are classification corrections, not extra scoring attempts.
- An intermediate gate was stopped only in this worktree to apply the final
  declaration corrections; it is not acceptance evidence. A batch-only audit
  then found zero relocation differences across all 38 provisional C units.
  The next EUR link failed: `Undefined : "data_021020b5"`, referenced from
  `func_0207845c`. The existing data_021020b4 object subsumes that symbol
  without defining it. Restoring the original assembly restored its tolerated
  `data_021020b4+1` reference. The final gate covers 37 C units.
- `func_0207845c` retains its historical 100% shipped event, followed by a
  `park_one.py` tool-anomaly event with shape `objdiff-100-reference-blocked`.
  Its numeric score is `unknown` because that event records an unscored
  full-link blocker, not a new objdiff measurement; the measured best 100%
  remains in the ledger and table. No existing row was changed.
  The function is restored byte for byte to `.s`; no baseline was changed.
- IRQ queue globals in `func_0207391c` and `func_0207397c` are volatile because
  the original rereads the cursor/bound and publishes then clears the waiter
  before polling. There are no volatile dummy locals. Shared object layouts
  and existing matched callee prototypes were reused without new headers.
- `func_0207e1c4` walks the existing five contiguous 24-byte DuelHeapSlot
  records; its declaration reuses the existing slot layout and five-pointer
  table. The skipped `func_0207fd60` exposes an existing prototype defect that
  needs work outside this batch.
- Byte-identical builds and static checks are the delivered evidence. No
  gameplay test, USA/JPN port, rename or owner acceptance is claimed. Review
  and the owner-approved merge remain separate steps.

## Fixes after review

Merged `origin/main` first (no conflicts). Checks ran on the commit before
this report; this report commit changes only this file.

1. `func_02078d88`: appended a final `legacy shipped 100` row with
   `record_shipped.py`; the file stays `func_02078d88.legacy.c`.
2. `func_02072444`: `git mv` of `.legacy.c` to `.c`, changed only its path line
   in `config/eur/arm9/delinks.txt`. Default tier:
   `[eur] func_02072444 (func_02072444.c, cc=2.0): 100.0%  OK`. Shipped row
   appended (tier default).
3. `func_0207e664.legacy_sp3.c`: `Bank.names` and `Bank.extra` are now plain
   `int`. `100.0%  OK` at sp3.
4. `func_0207fd60` (68 B): per-file declaration
   `int func_0207fd48(int *a, void *b)`. Default tier 0.0% (no padding slot),
   `.legacy.c` 88.9% (18 words against 17), `.legacy_sp3.c` 100.0% OK. Both
   failed tiers parked with `park_one.py` (park class `frame-shape`, already
   in the map) and the `.s` restored; then shipped at `legacy_sp3` (`.s`
   removed, delinks path line set to `.legacy_sp3.c`).

Checks (exit codes, real output):

- `fastmatch.py eur` on the four changed C files: exit 0, each `100.0%  OK`.
- `check_delink_dupes.py`: exit 0, `OK (81 delinks.txt, no duplicate .text addresses)`.
- `validate_attempts.py`: exit 0, `"errors": 0`.
- `check_fake_matches.py`: exit 0, `OK`.
- `python -m pytest -q tests`: `1329 passed, 16 skipped, 132 subtests passed`.
- `gate3.py --scope all --log .../gate-batch-06-fix.log`: exit 0; log lines
  `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`,
  `1330 passed, 15 skipped, 132 subtests passed`, `GATE PASS`,
  `gate3: GATE EXIT 0`.
- `progress.py --version eur`: `Natural-C: 452786 / 2385948 bytes (18.98%)`.
  452,786 - 448,234 = 4,552 B = 4,484 B + 68 B (`func_0207fd60`), so the gain
  equals the batch's shipped sizes.

Not done: `func_02074e4c` and `func_0207708c` left alone as instructed.
