# Batch 13: Verifier review

Reviewed commit: `78e6f1bc5` on `worker/batch-13` (base `51fde3801`), checked out in
`.worktrees/verifier-batch-13`, Windows 11, `python`. The Worker was a different model
(GPT-6.1 Sol), so every number below was re-run. Commits after `3299777a7` change only
`docs/batches/batch-13.md` (`git diff --stat 3299777a7 78e6f1bc5`: 1 file).

## Commands I ran

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-only 51fde3801...78e6f1bc5` | 0 | 22 `.c` added, 22 `.s` deleted, `delinks.txt`, `attempts.tsv`, `batch-13.md`. No baseline touched. |
| `python tools/fastmatch.py eur <22 new .c>` | 0 | 22 lines `100.0%  OK  (resolved, N words ...)` |
| My harness, each new file under 2.0, 1.2/sp2p3, 1.2/sp3 (flags from `build.ninja`) | 0 | See tier table. Every default-tier score the doc quotes for non-default files reproduced. |
| `python tools/gate3.py --scope all --log <outside>` (unpiped), then the AGENTS.md PowerShell check | 0 | `[eur]/[usa]/[jpn] SHA1 PASS` (16880/42478/68077), `1330 passed, 15 skipped, 132 subtests passed in 19.74s`, `GATE PASS`, `gate3: GATE EXIT 0`. No `SKIP`, no `STALE` line. |
| `python tools/validate_attempts.py` | 0 | `"rows": 3013`, `"errors": 0`, `shape_conflicts: 66` |
| `python tools/check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_fake_matches.py` | 0 | `OK`, baseline entries 4 |
| `python tools/check_match_invariants.py --version eur` | 1 | `0 error(s), 13999 warning(s)` |
| `python tools/progress.py --version eur` at `51fde3801` and at `78e6f1bc5` | 0 | `Natural-C: 464790` and `467434`; +2,644 B equals the 22 sizes. |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x020a0000 --max-addr 0x020bffff` | 0 | `candidate EUR .s remaining: 1`: `func_020a9914.s`. |

Ledger, checked by script: base prefix byte-identical; 244 rows appended, 11 columns, no CRLF; 72
addresses (22 shipped, 50 parked), each parked one with all three tiers; every `park_class` is in
the raw column of `park_class_map.tsv`; the 50 parked `.s` files are untouched and still routed;
`delinks.txt` changes are 22 `.s:` to `.c:` path lines and nothing else. No `volatile`, `asm`,
pragma, `goto` or data word in any new file.

## Tier table (scores measured by me)

| Tier needed | Files |
|---|---|
| 2.0 only | 6d54, 95a0, aac30, ab0c4, b005c, b044c (1.2 tiers 0-73%) |
| any tier | 3654, b17ac (100% under all three) |
| sp2p3 only | 06b0, 071c, 078c, 10e8, 112c, 2bf0, 34e0, 37e0, 3ac0, 3d34, 5e04, 6170, 6444 |
| sp3 or sp2p3 | 5a34 (both 100%; sp3 is not required) |

## Findings

| # | Class | Where | What is wrong |
|---|---|---|---|
| 1 | SHOULD FIX | Parks `func_020a6a28`, `func_020a96fc`, `func_020aed64`, `func_020a202c`, `func_020a6a94` (592 B) | All five match 100% in plain C (scratch, outside the repo). 6a28 (legacy): `while ((d = t[j]) != 0 && (c = s[i+j], c == d)) j++;` fixes the `cmp` operand order. 96fc (default): the callee takes four arguments; `e = buf + size; e[-1] = 0;` fixes the tail. aed64 (default): the callee is `(a,b,c)` and its result passes through, so return it (`r = f(...); w->pos += n; return r;`). 202c (legacy): `d = val - t->h[ip]; m = d * k;` with `k` loaded first. 6a94 (legacy): declare `i` before `n`. The Worker's own 96.3, 88.46, 81.25, 84.91 and 69.23 were close, and the `reg-alloc` class is wrong for them. |
| 2 | SHOULD FIX | `attempts.tsv`, latest rows of 8 addresses | The final row is below an earlier row of the same batch: `0x020a5a94` legacy 86.36 then 0.0, `0x020a202c` 84.91 then 5.66, `0x020a5458` 66.67 then 3.85, `0x020a6ce0`, `0x020a1c48`, `0x020a2100`, `0x020a09c8`, `0x020a6514`. I reproduced 86.36 for 5a94 and 100% for 202c, so the lower rows are wrong. `0x020a6a28` has three identical sets and `0x020a6444` two. The doc table quotes the maxima, so the ledger and the doc disagree. |
| 3 | SHOULD FIX | Objective, "confirmed-permanent files" | The headroom tool reports 14 permanent files in range; the doc retries seven (the `b2978`..`b2cc4` CPSR set). Not retried and not mentioned: `2c74`, `3308`, `3ed8`, `9764` (90.0), `978c` (91.0), `b03fc` (95.0), `b3168` (90.0). "Retried all confirmed-permanent" is UNPROVEN CLAIM for these seven. |
| 4 | NOTE | `func_020a5a94` | Not converted: best of 24 declaration orders is 86.36 (idx/off registers swap). The park stands, the ledger rows do not (finding 2). |
| 5 | NOTE | `func_020a6444` | First commit also scored 100% with `func_02096228()` called with no argument (r0 happened to hold the address); the final commit passes `&data_021a9948`, correct against the definition. |
| 6 | NOTE | `func_020a2bf0`, `020a5e04`, `020a34e0` | Declarations disagree with definitions (3 of 4 arguments; `asm void(void)` callees). The Worker discloses this; 4-argument form scores 93.94, so the 3-argument form is right. |
| 7 | NOTE | `batch-13.md` | 21 `?` replace punctuation (`?LR/BX?`, `r0?r2`, "? marks the seven"), so the marker legend is hard to read. |
| 8 | NOTE | `func_020a9914.s` | Judgment correct: 8 B dead epilogue `add sp,#0x10; pop {r3-fp,pc}` matching `func_020a97b8`'s prologue (348 B, outside the size limit). |
| 9 | NOTE | Brief's base figure | 461,294 is not reproducible: the base `51fde3801` gives 464,790 (461,294 plus batch 09's 3,496). The delta still equals the matched sizes. |

## Not checked

The other 45 parks beyond the five above and 5a94; `func_020a97b8` itself; the unittest and ruff
runs beyond `ruff check .` (`All checks passed!`). While searching for candidates I ran a `grep`
that printed two lines of `batch-13.md` before pass one ended; no conclusion rests on them.

## Verdict

The 22 matches are honest C, 100% in `fastmatch`, correct in tier, and the gate, routing, ledger prefix and
progress arithmetic all hold. I would merge them. The review is not clean: five parks are plain-C
matches (592 B) mislabelled as register-allocation walls, eight addresses end with a ledger row
lower than a measured earlier one, and seven permanent files were not retried. The Worker should
ship the five, append corrective rows, and retry or justify the seven. No BLOCKER: nothing shipped is
wrong. Confidence high on the shipped set, medium that more parks share finding 1.
