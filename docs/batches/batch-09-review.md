# Batch 09: Verifier review

Reviewed commit: `565a22076` on `worker/batch-09` (base `44ee15fdc`), in
`.worktrees/verifier-batch-09`, Windows 11, `python`. The checkout finished
without a lock. The Worker was the same model, so I re-ran everything.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-status 44ee15fdc...565a22076` | 0 | 50 files: 23 `.c` added, the same 23 `.s` deleted, `delinks.txt`, `attempts.tsv`, `batch-09.md`, one line out of `reference_baseline.txt`. Nothing else. |
| `python tools/fastmatch.py eur <the 23 .c>` (after `ninja build/eur/delinks/.delink.stamp`) | 0 | 23 lines `100.0%  OK  (resolved, N words, ...)` |
| `python tools/gate3.py --scope all --log <outside worktree>`, not piped | 0 | see next row |
| AGENTS.md PowerShell log check, verbatim | 0 | `17000:[eur] SHA1 PASS`, `42598:[usa] SHA1 PASS`, `68197:[jpn] SHA1 PASS`, `68237:1330 passed, 15 skipped, 132 subtests passed in 19.83s`, `68240:==== GATE PASS ====`, `68241:gate3: GATE EXIT 0`. No `SKIP`. |
| (inside the gate) | 0 | `check_references: ... wrong-target 410 (baseline entries 5924)`, `check_references: OK`, `check_fake_matches: OK` |
| `python tools/check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_fake_matches.py` | 0 | `OK` (`do-while-zero 3, volatile-local 1`, unchanged) |
| `python tools/check_match_invariants.py --version eur` | 1 | `0 error(s), 13999 warning(s)` |
| `python tools/validate_attempts.py` | 0 | `"rows": 2451, "errors": 0, "shape_conflicts": 66` (none from this batch) |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 451182`; 451,182 - 448,234 = 2,948 B = sum of the 23 sizes |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02010000 --max-addr 0x0201ffff` | 0 | `candidate EUR .s remaining: 0`, `confirmed-permanent: 1` |
| My script: base `.s` blocks of 256 B or less in range | 0 | 55 = 11 earlier ledger rows + 43 this batch + `func_0201d47c` |
| Scratch compiles of drafts, outside the repo | 0 | see findings |

## Pass one

| Check | Result |
|---|---|
| Honest C | All 23 read. No `volatile`, asm, pragma, `register`, data word. One `goto` (`func_02017afc`). I recompiled it with if/else and with a ternary: both differ (`streq`/`strne` become one `str`), so the `goto` is needed. NOTE only. |
| Tier | All 23 are plain `.c`, rule `mwcc` (2.0); 23 ledger rows `default shipped 100`. |
| Routing | 28,180 lines before and after; exactly 23 differ, each `.s:` to `.c:` on the path line, same stem; set equals the shipped addresses. |
| Ledger | Base is a byte-identical prefix; 84 rows appended, 11 columns, no CRLF. 23 shipped, 20 parked with 3 tiers each (`func_02011620` has 4 rows). Every parked `park_class` is in the raw column of `park_class_map.tsv`, no `PROVISIONAL:`. The 20 parked `.s` files are untouched and still routed. |
| Reference baseline | One line deleted: `func_02019494.s ... wrong-target`. The `.c` now names `data_020b5ae8`; the gate reports no `STALE`. Judged legitimate. |

## Findings

| # | Class | Where | What is wrong, and how it fails |
|---|---|---|---|
| 1 | SHOULD FIX | ledger `0x0201ef90` (parked 96.9, `P-20-r0-vs-r1`) | A plain C draft matches. `func_0201ed3c`, `func_0201edac`, `func_0201ede4` each take `(arg0, arg1)` in `src/main`; the Worker called them with one argument, so the original's `r1` load (the second argument) looked like a register-letter wall. Passing `r->f0`, `r->f8`, `r->fc` as second arguments gives an instruction-identical function under 2.0 (diff empty apart from `bl` placeholders; relocation targets identical, 11). The wall label hides a convertible function (256 B). |
| 2 | SHOULD FIX | `func_0201d47c` (excluded as permanent, P-18) | Not a wall. `int f(Obj *o){ func_0209448c(0,o,0x28); o->a = 0x20; o->b = 0x20; return 0; }`, with `a`, `b` two 8-bit fields at `+0x1c`, compiles to the identical 14 words under 2.0. The only trap is that it returns 0. The exclusion cost 56 B. |
| 3 | SHOULD FIX | `func_0201f874` (parked 94.6, `control-flow-structural-mismatch`) | Reading `data_02191f40` directly instead of through a pointer removes the loop and branch differences. The only residue is `movs r0,#0` against `mov r0,#0`. The ledger class misstates the cause. Not matched. |
| 4 | NOTE | `func_0201e4cc` (96.6) | Passing `s->f1c` as `func_02092904`'s second argument removes the r0/r1 diff; only the order of `add r5` and `bic r4` differs (six variants). The park stands, the class is misattributed. |
| 5 | SHOULD FIX | `attempts.tsv`, last `func_02011620` row | The Worker says its `legacy` row (0.0) should be 6.9, and left it. The latest row for the address is therefore wrong. Append a corrective row. |
| 6 | UNPROVEN CLAIM | `batch-09.md` | "1.2 tiers score near zero wherever the original pushes r3 as padding". I did not reproduce it; only the default tier was checked for parks 1-3. |
| 7 | NOTE | `batch-09.md` | "`data_020b5ae8`, which the original names": the old `.s` used `data_020b5ab8+0x30`. The reference check passes, so the new form is right. Under the newer primary-checkout AGENTS.md, Brain deletes baseline lines; this one is the single deletion Brain should keep. |
| 8 | NOTE | `func_02011aec.c`, `func_02010eb8.c` | `func_02011a94` is declared `int(void)` there but defined `int(int)`; `func_02011178` is declared with `Obj *`/`int *` and defined with `Mtx *`. Links and matches; the declarations disagree. |

## Not verified

USA and JPN beyond the gate; the 1.2 tiers for the 23 shipped functions;
the 17 other parks; the cross-overlay `bl` parks (taken as symbol-limited);
the 6.9 score.

## Verdict

The 23 conversions are honest, match at 100% under the default tier, and the
gate, routing, ledger prefix and progress arithmetic all check out. I would
merge them. The review is not clean: two further functions (`func_0201ef90`,
`func_0201d47c`, 312 B) match in plain C and were left as walls, and the
ledger now records a wrong class for `func_0201ef90`, `func_0201f874` and
`func_0201e4cc` and a wrong score for `func_02011620`. The Worker should ship
the two matches and append corrective rows in this batch. No BLOCKER:
nothing shipped is wrong. Confidence high on the shipped set, medium on how
many other parks share these mistakes.
